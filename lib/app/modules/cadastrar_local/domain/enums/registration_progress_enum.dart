import 'package:flutter/widgets.dart';
import 'package:imob_design_system/imob_design_system.dart';

enum EnumRegistrationProgress {
  notStarted,
  inProgress,
  complete,
}

extension XEnumRegistrationProgress on EnumRegistrationProgress {
  String toFormattedString() {
    switch (this) {
      case EnumRegistrationProgress.notStarted:
        return 'Não iniciado';
      case EnumRegistrationProgress.inProgress:
        return 'Em Preenchimento';
      case EnumRegistrationProgress.complete:
        return 'Preenchimento Completo';
    }
  }

  Color get color {
    switch (this) {
      case EnumRegistrationProgress.notStarted:
        return ImobColors.grey;
      case EnumRegistrationProgress.inProgress:
        return ImobColors.purple;
      case EnumRegistrationProgress.complete:
        return ImobColors.green;
    }
  }

  bool get isNotStarted => this == EnumRegistrationProgress.notStarted;
  bool get isInProgress => this == EnumRegistrationProgress.inProgress;
  bool get isComplete => this == EnumRegistrationProgress.complete;
}
