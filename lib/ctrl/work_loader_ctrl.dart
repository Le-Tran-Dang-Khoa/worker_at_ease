import 'loader_ctrl.dart';
import 'worker.dart';

class WorkLoaderCtrl extends LoaderCtrl {
  WorkLoaderCtrl() : super();

  void reload(List<Worker>? workers) {
    total = (workers ?? []).length;
    progress = 0;
    if (workers != null) {
      for (var worker in workers) {
        worker.doWork();
        doneWork();
      }
    } else {
      doneWork(workAmount: 0);
    }
  }
}
