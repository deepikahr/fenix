import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/widgets.dart';

Timer useTimer(Duration duration, Function() callback) {
  return use(_TimerHook(duration: duration, callback: callback));
}

class _TimerHook extends Hook<Timer> {
  const _TimerHook({
    required this.duration,
    required this.callback,
  });

  final Duration duration;
  final Function() callback;

  @override
  _TimerHookState createState() {
    return _TimerHookState();
  }
}

class _TimerHookState extends HookState<Timer, _TimerHook> {
  late Timer _timer;

  @override
  void initHook() {
    super.initHook();
    _timer = Timer(hook.duration, hook.callback);
  }

  @override
  Timer build(BuildContext context) => _timer;

  @override
  void dispose() => _timer.cancel();

  @override
  String get debugLabel => 'useTimer';
}
