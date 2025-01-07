import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class CommonMethods{

  static const List<String> supportedAudioExtensions = [
    // Lossy Audio Formats
    'mp3',   // MPEG-1 Audio Layer III
    'aac',   // Advanced Audio Codec
    'm4a',   // MPEG-4 Audio (AAC/ALAC)
    'ogg',   // Ogg Vorbis
    'opus',  // Opus
    'wma',   // Windows Media Audio
    'amr',   // Adaptive Multi-Rate
    'ac3',   // Audio Codec 3 (Dolby Digital)
    'mka',   // Matroska Audio
    'mp2',   // MPEG Audio Layer II

    // Lossless Audio Formats
    'flac',  // Free Lossless Audio Codec
    'alac',  // Apple Lossless Audio Codec
    'wav',   // Waveform Audio File Format (can be uncompressed or lossless compressed)
    'aiff',  // Audio Interchange File Format
    'ape',   // Monkey's Audio

    // Uncompressed and Raw Audio Formats
    'pcm',   // Pulse Code Modulation (raw audio)
    'aif',   // AIFF Audio Interchange File Format
    'caf',   // Core Audio Format

    // Specialized Formats
    'dts',   // Digital Theater Systems
    'm4b',   // Audiobook format similar to M4A with bookmarks
    'ra',    // RealAudio
    'wv',    // WavPack
    'dff',   // DSD Interchange File Format
    'dsf',   // Direct Stream Digital

    // Legacy and Less Common Formats
    'voc',   // Creative Voice File
    'au',    // Audio file format used by Sun Microsystems
    'vox',   // Dialogic ADPCM audio
    'snd',   // Sound file format

    // Additional Formats
    'spx',   // Speex
    'gsm',   // GSM 6.10 WAV format
    'tta',   // TTA Lossless Audio Codec
    'qcp',   // Qualcomm PureVoice
    'w64',   // Sony Wave64
  ];

  /// Show Toast
   static void showToast({String? msg}){
    Fluttertoast.showToast(
        msg: msg ?? "Error Occurred",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 15
    );
  }

  /// File pick
  static Future<FilePickerResult?> pickFile() async {
    PermissionStatus status;
    final androidInfo = await DeviceInfoPlugin().androidInfo;

    if (Platform.isAndroid && androidInfo.version.sdkInt <= 32) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.audio.request();
    }


    if (status.isDenied) {
      // Request permission if not already granted
      status = await Permission.storage.request();
    }

    if (status.isGranted) {
      final result =  await FilePicker.platform.pickFiles(
        type: FileType.audio,
      );
      return result;
    }
    showToast(msg: "Please allow permission");
    return null;
  }
}