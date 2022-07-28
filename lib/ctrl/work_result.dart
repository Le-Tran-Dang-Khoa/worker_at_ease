class WorkResult {
  late int total;
  late int progress;

  bool get isCompleted => progress >= total;
  double get percentCompleted => total > 0 ? (progress * 100.0) / total : 0.0;

  WorkResult({this.total = 1, this.progress = 0});
}
