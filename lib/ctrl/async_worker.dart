import 'package:observer_at_ease/observer_at_ease.dart';

abstract class AsyncWorker<TState> extends LiteObservable<TState> {
  Future<void> doWork();
}
