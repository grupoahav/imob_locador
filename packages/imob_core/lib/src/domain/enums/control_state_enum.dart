import 'package:flutter/foundation.dart';

enum ControlState {
  start,
  empty,
  loading,
  success,
  failure,
}

extension ParseToString on ControlState {
  String toShortString() => describeEnum(this);

  bool get isStart => this == ControlState.start;
  bool get isEmpty => this == ControlState.empty;
  bool get isLoading => this == ControlState.loading;
  bool get isSuccess => this == ControlState.success;
  bool get isFailure => this == ControlState.failure;
  bool get isNotStart => this != ControlState.start;
  bool get isNotEmpty => this != ControlState.empty;
  bool get isNotLoading => this != ControlState.loading;
  bool get isNotSuccess => this != ControlState.success;
  bool get isNotFailure => this != ControlState.failure;
}
