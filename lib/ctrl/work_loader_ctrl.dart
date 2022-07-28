import 'worker.dart';

class WorkLoaderCtrl {
  WorkLoaderCtrl();

  void reload(List<Worker>? workers) {
    if (workers != null) {
      for (var worker in workers) {
        worker.doWork();
      }
    }
  }
}
