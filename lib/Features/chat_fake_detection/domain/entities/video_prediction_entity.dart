class VideoPredictionEntity {
  final String model;
  final int fakeFramesCount;
  final String fakeFramesZip;
  final double fakePercentage;
  final double realPercentage;
  final int totalFramesAnalyzed;
  final int commonFakeFramesCount;
  final String commonFakeFramesZip;

  VideoPredictionEntity({
    required this.model,
    required this.fakeFramesCount,
    required this.fakeFramesZip,
    required this.fakePercentage,
    required this.realPercentage,
    required this.totalFramesAnalyzed,
    required this.commonFakeFramesCount,
    required this.commonFakeFramesZip,
  });
}
