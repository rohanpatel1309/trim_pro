class FfmpegCommand {
  static const convertAudioCommand = '-i "filePath" -c:a codec "tempFilePath"';

  static const cutAudioCommand =
      '-i "filePath" -ss start -to end -c:a libmp3lame "tempFilePath"';

  static const convertAudioToMp3 =
      '-i "filePath" -vn -acodec libmp3lame "filePathMp3"';

  static const cutAudioFromZeroTo =
      '-i "filePath" -ss 0 -to endTime -c copy "tempFilePath"';

  static const cutAudioFromTime =
      '-i "filePath" -ss startTime -c copy "tempFilePath"';

  static const concatAudioFiles =
      '-f concat -safe 0 -i filePaths -c copy "tempFilePath"';


  static const speedAudioFiles =
      '-i "filePath" -filter:a "atempo=speedValue" -c:a libmp3lame "tempFilePath"';



  static const mergeTwoAudioFiles =
      '-i "filePath1" -i "filePath2" -filter_complex "[0:a:0][1:a:0]concat=n=2:v=0:a=1[out]" -map "[out]" -c:a libmp3lame "tempFilePath"';
}
