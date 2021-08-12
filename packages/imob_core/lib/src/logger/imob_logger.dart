import 'imob_logger_config.dart';
import 'imob_logger_printer.dart';
import 'imob_logger_stack_trace.dart';
import 'log_level_enum.dart';
import 'log_model.dart';

class ImobLogger {
  ImobLogger._internal();

  static final ImobLogger _instance = ImobLogger._internal();
  static ImobLogger get instance => _instance;

  final ImobLoggerPrinter _printer = ImobLoggerPrinter.instance;

  ImobLoggerConfig? _config;

  bool get isAlreadyInitialized => _config != null;

  static ImobLogger init(ImobLoggerConfig config) {
    if (_instance.isAlreadyInitialized) return _instance;

    ImobLoggerPrinter.init(config);

    _instance._config = config;
    return _instance;
  }

  Log log({
    String? description,
    String? details,
    required LogLevel level,
    StackTrace? stackTrace,
  }) {
    final ImobLoggerStackTrace loggerStackTrace =
        ImobLoggerStackTrace.of(stackTrace ?? StackTrace.current);

    if (description == null) {
      final List<String> names = loggerStackTrace.functionName.split('.');
      if (names.length > 1) {
        description =
            '(${names[0]}): ${names[1]} | ${loggerStackTrace.fileName}';
      } else {
        description = '(${names[0]}) | ${loggerStackTrace.fileName}';
      }
    }

    if (level.isNotInformation) {
      details ??= loggerStackTrace.stackTrace.toString();
    }

    final Log log = Log(
      description: description,
      details: details,
      date: DateTime.now().toLocal().toUtc(),
      level: level,
    );

    _printer.print(log);
    return log;
  }

  Log debug({
    String? description,
    String? details,
    StackTrace? stackTrace,
  }) {
    return log(
      description: description,
      details: details,
      level: LogLevel.debug,
      stackTrace: stackTrace,
    );
  }

  Log error({
    String? description,
    String? details,
    int? companyId,
    StackTrace? stackTrace,
  }) {
    return log(
      description: description,
      details: details,
      level: LogLevel.error,
      stackTrace: stackTrace,
    );
  }

  Log fatal({
    String? description,
    String? details,
    StackTrace? stackTrace,
  }) {
    return log(
      description: description,
      details: details,
      level: LogLevel.fatal,
      stackTrace: stackTrace,
    );
  }

  Log information({
    String? description,
    String? details,
    StackTrace? stackTrace,
  }) {
    return log(
      description: description,
      details: details,
      level: LogLevel.information,
      stackTrace: stackTrace,
    );
  }

  Log trace({
    String? description,
    StackTrace? stackTrace,
  }) {
    return log(
      description: description,
      level: LogLevel.trace,
      stackTrace: stackTrace,
    );
  }

  Log warning({
    String? description,
    String? details,
    StackTrace? stackTrace,
  }) {
    return log(
      description: description,
      details: details,
      level: LogLevel.warning,
      stackTrace: stackTrace,
    );
  }
}
