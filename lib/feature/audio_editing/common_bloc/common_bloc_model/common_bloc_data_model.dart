class CommonBlocDataModel {
  final bool isPlayingNow;
  final bool isLoading;
  final Duration position;
  final Duration totalDuration;
  final String error;
  final String fileUrl;

  CommonBlocDataModel({
     this.isPlayingNow = false,
     this.isLoading = false,
     this.fileUrl = "",
     this.error = "",
     this.position = const Duration(seconds: 0),
     this.totalDuration = const Duration(seconds: 0),
  });

  CommonBlocDataModel copyWith({
    bool? isPlayingNow,
    bool? isLoading,
    String? fileUrl,
    Duration? position,
    Duration? totalDuration,
    String? error,
  }) {
    return CommonBlocDataModel(
      isPlayingNow: isPlayingNow ?? this.isPlayingNow,
      totalDuration: totalDuration ?? this.totalDuration,
      position: position ?? this.position,
      isLoading: isLoading ?? this.isLoading,
      fileUrl: fileUrl ?? this.fileUrl,
      error: error ?? this.error,
    );
  }
}
