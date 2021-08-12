import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'imob_logger_config.dart';
import 'log_level_enum.dart';
import 'log_model.dart';
import 'log_printer_style_enum.dart';

class ImobLoggerPrinter {
  ImobLoggerPrinter._internal();

  static final ImobLoggerPrinter _instance = ImobLoggerPrinter._internal();
  static ImobLoggerPrinter get instance => _instance;

  ImobLoggerConfig? _config;

  static ImobLoggerPrinter init(ImobLoggerConfig _config) {
    _instance._config = _config;

    return _instance;
  }

  final String _separatorInit = '┌ ';
  final String _magenta = '\x1B[35m';
  final String _red = '\x1B[31m';
  final String _green = '\x1B[32m';
  final String _yellow = '\x1B[33m';
  final String _cyan = '\x1B[36m';
  final String _white = '\x1B[37m';
  final String _reset = '\x1B[0m';

  void print(Log log) {
    if (_config == null)
      throw Exception('ImobLoggerPrinter não foi inicializdo');

    if (_config!.levels.any((level) => level == log.level)) {
      switch (_config!.style) {
        case LogPrinterStyle.simple:
          debugPrint(_formatLogSimple(log));
          break;
        case LogPrinterStyle.pretty:
          debugPrint(_formatLogPretty(log));
          break;
      }
    }
  }

  String _formatLogSimple(Log log) {
    final List<String> toPrint = <String>[];
    final String date = '(${log.date})';
    final String description = log.description;
    final String? details = log.details;

    toPrint.add(_levelTitle(log.level));
    toPrint.add(date);
    toPrint.add(description);
    if (details != null) toPrint.add(details);

    return _levelColor(log.level) +
        toPrint.join(' | ${_levelColor(log.level)}') +
        _reset;
  }

  String _formatLogPretty(Log log) {
    final List<String> toPrint = <String>[];
    final String date = 'DateTime: ${log.date}';
    final List<String> description = [
      'Description: ',
      ...log.description.split('\n'),
    ];
    final List<String> details = ['Details: '];
    if (log.details != null && log.details!.isNotEmpty) {
      details.addAll(log.details!.split('\n'));
    }

    toPrint.add(_levelTitle(log.level));
    toPrint.add(date);
    if (description.length >= 2) {
      toPrint.add(description.first + description[1]);
      description.removeAt(0);
      description.removeAt(0);
      toPrint.addAll(description);
    }
    if (details.length >= 2) {
      toPrint.add(details.first + details[1]);
      details.removeAt(0);
      details.removeAt(0);
      toPrint.addAll(details);
    }

    return _levelColor(log.level) +
        _separatorInit +
        toPrint
            .getRange(0, toPrint.length - 1)
            .join('\n${_levelColor(log.level)}├ ') +
        ('\n${_levelColor(log.level)}└ ${toPrint.last}') +
        _reset;
  }

  String _levelColor(LogLevel level) {
    if (!(_config?.isColorized ?? false)) return '';

    String result;
    switch (level) {
      case LogLevel.debug:
        result = _magenta;
        break;
      case LogLevel.error:
        result = _red;
        break;
      case LogLevel.fatal:
        result = _cyan;
        break;
      case LogLevel.information:
        result = _white;
        break;
      case LogLevel.trace:
        result = _green;
        break;
      case LogLevel.warning:
        result = _yellow;
        break;
    }

    return result;
  }

  String _levelTitle(LogLevel level) {
    String result;
    switch (level) {
      case LogLevel.debug:
        result = '🐛 [DEBUG]';
        break;
      case LogLevel.error:
        result = '⛔ [ERROR]';
        break;
      case LogLevel.fatal:
        result = '💀 [FATAL]';
        break;
      case LogLevel.information:
        result = '💬 [INFO]';
        break;
      case LogLevel.trace:
        result = '🔎 [TRACE]';
        break;
      case LogLevel.warning:
        result = '⚠️ [WARNING]';
        break;
    }

    return result;
  }
}
