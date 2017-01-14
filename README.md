# Debouncer

## Quick start:

    import 'package:debouncer/debouncer.dart';

So, somewhere in your application:

    Debouncer debouncer = new Debouncer(1000);
    List<String> logs = [];
    
    onChange(String val) {
      debouncer.run(logs.add, [val]);
    }
    
So in this case `logs.add` will only be called with a single parameter that
is `val`, when time between invocations is larger than 1000 milliseconds.

If the parameters change between calls to `.run`, only the last parameters
which are passed are going to be used when the calls do not occur for given
milliseconds.

If you call the same instance with different functions, only the last used
function will be called  when the calls do not occur for given milliseconds.