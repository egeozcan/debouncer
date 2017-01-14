library debouncer;
import 'dart:async';

class Debouncer {
  final int _durationMilliseconds;
  Timer _timer;
  Function _currentFn;
  List _arguments;
  Debouncer(this._durationMilliseconds) {
    _resetTimer();
  }

  _resetTimer() {
    if(this._timer != null && this._timer.isActive) {
      this._timer.cancel();
    }
    this._timer = new Timer(new Duration(milliseconds: this._durationMilliseconds), () {
      if (this._currentFn != null) {
        Function.apply(this._currentFn, this._arguments);
      }
    });
  }

  run(Function fn, [List args = const []]) {
    this._currentFn = fn;
    this._arguments = args;
    _resetTimer();
  }
}