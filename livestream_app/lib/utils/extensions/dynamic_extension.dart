import 'package:flutter/foundation.dart';

extension Log on Object{
  void log(){
    if(kDebugMode){
      print(toString());
    }
  }
}

extension FunctionObjX<T> on T {
  R let<R>(R Function(T it) func) {
    if (this != null) return func(this);
    return this as R;
  }

  R also<R>(R Function(T it) func) {
    return func(this);
  }
}