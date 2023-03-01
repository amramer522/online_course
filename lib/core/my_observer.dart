import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_log/quick_log.dart';

class MyObserver extends BlocObserver {
  Logger log = const Logger('');

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log.info('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (change.nextState.toString().contains("Fail")) {
      log.error(
          'onChange -- previous (${change.currentState.runtimeType}) ------> current ( ${change.nextState.runtimeType} )',
          includeStackTrace: false);
    } else {
      log.fine(
          'onChange -- previous  ( ${change.currentState.runtimeType}) ------? current ( ${change.nextState.runtimeType} )');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.error('onError --> $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log.error('onClose -- ${bloc.runtimeType}');
  }
}
