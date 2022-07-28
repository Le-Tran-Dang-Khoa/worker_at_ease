import 'package:flutter/cupertino.dart';
import 'package:observer_at_ease/observer_at_ease.dart';

abstract class AsyncWorker<TState> extends LiteObservable<TState> {
  TState get completedState;

  @mustCallSuper
  Future<void> doWork() async {
    notify(completedState);
  }
}
