import 'package:observer_at_ease/observer_at_ease.dart';

import 'async_worker.dart';
import 'async_loader_ctrl.dart';

class AsyncWorkLoaderCtrl extends AsyncLoaderCtrl with Observer<bool> {
  AsyncWorkLoaderCtrl() : super();

  Future<void> reloadAsync(
    List<AsyncWorker<bool>>? asyncWorkers, {
    bool waitAsync = false,
  }) async {
    total = (asyncWorkers ?? []).length;
    progress = 0;
    if (asyncWorkers != null) {
      for (var asyncWorker in asyncWorkers) {
        asyncWorker.subscribe(this);
        if (waitAsync) {
          await asyncWorker.doWork();
        } else {
          asyncWorker.doWork();
        }
      }
    } else {
      doneWork(workAmount: 0);
    }
  }

  @override
  void notifyUpdate(BaseObservable<bool> observable, bool arg) {
    observable.unsubscribe(this);
    doneWork();
  }
}
