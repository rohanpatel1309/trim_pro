class CommonBlocDataModel {
  final bool isPlayingNow;
  final bool isLoading;
  final Duration position;
  final Duration totalDuration;
  final String error;
  final bool isSetUrl;

  CommonBlocDataModel({
     this.isPlayingNow = false,
     this.isLoading = false,
     this.isSetUrl = false,
     this.error = "",
     this.position = const Duration(seconds: 0),
     this.totalDuration = const Duration(seconds: 0),
  });

  CommonBlocDataModel copyWith({
    bool? isPlayingNow,
    bool? isLoading,
    bool? isSetUrl,
    Duration? position,
    Duration? totalDuration,
    String? error,
  }) {
    return CommonBlocDataModel(
      isPlayingNow: isPlayingNow ?? this.isPlayingNow,
      totalDuration: totalDuration ?? this.totalDuration,
      position: position ?? this.position,
      isLoading: isLoading ?? this.isLoading,
      isSetUrl: isSetUrl ?? this.isSetUrl,
      error: error ?? this.error,
    );
  }
}
