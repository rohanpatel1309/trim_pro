import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(AudioMergeApp());
}

class AudioMergeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Merge App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AudioMergeScreen(),
    );
  }
}

class AudioMergeScreen extends StatefulWidget {
  @override
  _AudioMergeScreenState createState() => _AudioMergeScreenState();
}

class _AudioMergeScreenState extends State<AudioMergeScreen> {
  String? audioFileName;
  final List<TimeRange> timeRanges = [];
  bool isLoading = false;

  Future<void> pickAudioFile() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    String? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    )?.then((result) => result?.files.first.path);

    if (pickedFile != null) {
      setState(() {
        audioFileName = pickedFile;
      });
    }
  }

  void addTimeRange() {
    setState(() {
      timeRanges.add(TimeRange());
    });
  }

  Future<String> _getAudioDuration(String filePath) async {
    final mediaInfoSession = await FFprobeKit.getMediaInformation(filePath);
    final mediaInfo = mediaInfoSession.getMediaInformation()!;
    final duration = double.parse(mediaInfo.getDuration()!);
    print('Duration: $duration');
    return secondsToHMS(duration);
  }

  String secondsToHMS(double seconds) {
    int totalSeconds = seconds.round(); // Round to the nearest second
    int hours = totalSeconds ~/ 3600; // Get the number of hours
    int minutes = (totalSeconds % 3600) ~/ 60; // Get the number of minutes
    int remainingSeconds = totalSeconds % 60; // Get the remaining seconds

    // Format the string to hh:mm:ss
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Future<void> removeAudioSegments() async {
    if (audioFileName == null || timeRanges.isEmpty) return;

    setState(() {
      isLoading = true;  // Set loading state to true
    });

    // Get the temporary directory
    Directory tempDir = await getTemporaryDirectory();
    String tempOutputPath = '${tempDir.path}/merged_audio_temp.mp3';

    // Get the duration of the entire audio file
    String audioDuration = await _getAudioDuration(audioFileName!);
    print("Audio Duration: $audioDuration");
    print("Selected Audio File: $audioFileName");

    // Build the FFmpeg command to cut and merge audio (excluding segments)
    List<String> commands = [];

    // 1. First segment from the start of the audio to the start of the first time range
    if (timeRanges[0].startController.text != '00:00:00') {
      print('-y -i "$audioFileName" -ss 00:00:00 -to ${timeRanges[0].startController.text} -c copy "${tempDir.path}/part0.mp3"');
      commands.add(
          '-y -i "$audioFileName" -ss 00:00:00 -to ${timeRanges[0].startController.text} -c copy "${tempDir.path}/part0.mp3"'
      );
    }

    // 2. Create commands for the parts between time ranges
    for (int i = 0; i < timeRanges.length - 1; i++) {
      String end = timeRanges[i].endController.text;
      String nextStart = timeRanges[i + 1].startController.text;

      print('-y -i "$audioFileName" -ss $end -to $nextStart -c copy "${tempDir.path}/part${i + 1}.mp3"');

      // Add segment from the current time range's end to the next time range's start
      commands.add(
          '-y -i "$audioFileName" -ss $end -to $nextStart -c copy "${tempDir.path}/part${i + 1}.mp3"'
      );
    }

    // 3. Last segment from the end of the last time range to the end of the audio
    String lastEnd = timeRanges.last.endController.text;
    print( '-y -i "$audioFileName" -ss $lastEnd -to $audioDuration -c copy "${tempDir.path}/part${timeRanges.length}.mp3"');
    commands.add(
        '-y -i "$audioFileName" -ss $lastEnd -to $audioDuration -c copy "${tempDir.path}/part${timeRanges.length}.mp3"'
    );

    // Execute the commands to cut audio segments
    for (int i = 0; i < commands.length; i++) {
      final session = await FFmpegKit.execute(commands[i]);  // Execute the command
      final returnCode = await session.getReturnCode();  // Get the return code

      if (returnCode == null || returnCode.isValueError()) {  // Check for errors safely
        print("FFmpeg command failed with return code: $returnCode");
        setState(() {
          isLoading = false;
        });
        return; // Exit the function if FFmpeg command fails
      }
    }

    // 4. Concatenate the audio parts that are left after removing the specified segments
    String concatCommand = 'concat:' +
        List.generate(commands.length, (index) => '"${tempDir.path}/part$index.mp3"')
            .join('|');
    final concatSession = await FFmpegKit.execute('-y -i $concatCommand -c copy "$tempOutputPath"');  // Execute the concat command
    final concatReturnCode = await concatSession.getReturnCode();  // Get the return code for the concat command

    if (concatReturnCode == null || concatReturnCode.isValueError()) {  // Check for errors safely
      print("FFmpeg concat command failed with return code: $concatReturnCode");
      setState(() {
        isLoading = false;
      });
      return; // Exit the function if concat command fails
    }

    // Check if the output file exists before proceeding
    File tempOutputFile = File(tempOutputPath);
    if (!tempOutputFile.existsSync()) {
      print("Output file does not exist: $tempOutputPath");
      setState(() {
        isLoading = false;
      });
      return;
    }

    // Now show the native save dialog
    if (!await FlutterFileDialog.isPickDirectorySupported()) {
      print("Picking directory not supported");
      return;
    }
    final pickedDirectory = await FlutterFileDialog.pickDirectory();

    if (pickedDirectory != null) {
      final savePath = await FlutterFileDialog.saveFileToDirectory(
        directory: pickedDirectory,
        data: File(tempOutputPath).readAsBytesSync(),
        mimeType: "audio/mpeg",
        fileName: "fileName${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}-${DateTime.now().minute}.mp3",
        replace: true,
      );
      // Show a message indicating where the file is saved
      if (savePath != null) {
        print("Merged audio saved at: $savePath");
      }
    }

    setState(() {
      isLoading = false;  // Set loading state to false
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Audio Merge Tool')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (audioFileName != null) ...[
                Text("Selected File: $audioFileName", style: TextStyle(fontSize: screenWidth * 0.05)),
                SizedBox(height: 20),
              ],
              ElevatedButton(
                onPressed: pickAudioFile,
                child: Text('Pick Audio File', style: TextStyle(fontSize: screenWidth * 0.04)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: addTimeRange,
                child: Text('Add Time Range', style: TextStyle(fontSize: screenWidth * 0.04)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: timeRanges.length,
                  itemBuilder: (context, index) {
                    return TimeRangeWidget(
                      timeRange: timeRanges[index],
                      onRemove: () {
                        setState(() {
                          timeRanges.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: removeAudioSegments,
                child: Text('Merge Audio', style: TextStyle(fontSize: screenWidth * 0.04)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeRange {
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
}

class TimeRangeWidget extends StatelessWidget {
  final TimeRange timeRange;
  final VoidCallback onRemove;

  TimeRangeWidget({required this.timeRange, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: timeRange.startController,
                decoration: InputDecoration(labelText: 'Start(hh:mm:ss)'),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: timeRange.endController,
                decoration: InputDecoration(labelText: 'End(hh:mm:ss)'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
