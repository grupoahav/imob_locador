import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'log_level_enum.dart';
import 'log_printer_style_enum.dart';

@sealed
class ImobLoggerConfig extends Equatable {
  final LogPrinterStyle style;
  final List<LogLevel> levels;
  final bool isColorized;

  const ImobLoggerConfig({
    required this.style,
    required this.levels,
    required this.isColorized,
  });

  const ImobLoggerConfig.pretty({
    this.levels = LogLevel.values,
    this.isColorized = true,
  }) : style = LogPrinterStyle.pretty;

  const ImobLoggerConfig.simple({
    this.levels = LogLevel.values,
    this.isColorized = true,
  }) : style = LogPrinterStyle.simple;

  const ImobLoggerConfig.disable()
      : style = LogPrinterStyle.simple,
        levels = const <LogLevel>[],
        isColorized = false;

  @override
  List<Object> get props => [style, levels];
}
