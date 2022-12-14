import 'package:observer_at_ease/observer_at_ease.dart';

import 'work_result.dart';

abstract class AsyncLoaderCtrl extends LiteObservable<WorkResult> {
  int total = 0;
  int progress = 0;

  WorkResult get result => WorkResult(total: total, progress: progress);

  AsyncLoaderCtrl() : super();

  void doneWork({int workAmount = 1}) {
    progress += workAmount;
    notify(result);
  }
}
