import 'package:flutter/foundation.dart';

/// - [trace] Backend, interligando serviços
/// - [debug] Estiver testando algo e quiser gerar log, ignorado na produção (Send & Storage)
/// - [information] Informação, usuario fez isso, fez aquilo, etc
/// - [warning] Algo que nao faz mal ao aplicativo, mas precisa de atenção. Exemplo: quando faz chamada no Google, porquê gera custo
/// - [error] Basicamente o que cair em catch, esperado ou não
/// - [fatal] Só em caso de algo q vai fechar a aplicação,
enum LogLevel {
  trace,
  debug,
  information,
  warning,
  error,
  fatal,
}

extension LogLevelExtension on LogLevel {
  String toShortString() {
    return describeEnum(this);
  }

  bool get isDebug => this == LogLevel.debug;
  bool get isRrror => this == LogLevel.error;
  bool get isFatal => this == LogLevel.fatal;
  bool get isInformation => this == LogLevel.information;
  bool get isTrace => this == LogLevel.trace;
  bool get isWarning => this == LogLevel.warning;

  bool get isNotDebug => this != LogLevel.debug;
  bool get isNotRrror => this != LogLevel.error;
  bool get isNotFatal => this != LogLevel.fatal;
  bool get isNotInformation => this != LogLevel.information;
  bool get isNotTrace => this != LogLevel.trace;
  bool get isNotWarning => this != LogLevel.warning;
}
