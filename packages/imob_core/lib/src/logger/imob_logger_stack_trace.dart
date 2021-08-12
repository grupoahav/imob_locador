class ImobLoggerStackTrace {
  const ImobLoggerStackTrace._({
    required this.functionName,
    required this.callerFunctionName,
    required this.fileName,
    required this.lineNumber,
    required this.columnNumber,
    required this.stackTrace,
  });

  factory ImobLoggerStackTrace.of(StackTrace stackTrace) {
    if (stackTrace.toString().isEmpty) stackTrace = StackTrace.current;

    final List<String> frames = stackTrace.toString().split('\n');
    final String functionName = _getFunctionNameFromFrame(frames[0]);
    final String callerFunctionName = _getFunctionNameFromFrame(
      frames[1].startsWith('#') ? frames[1] : frames[2],
    );
    final List<String> fileInfo = _getFileInfoFromFrame(frames[0]);

    return ImobLoggerStackTrace._(
      functionName: functionName,
      callerFunctionName: callerFunctionName,
      fileName: fileInfo.isNotEmpty ? fileInfo[0] : 'FileName not found',
      lineNumber: fileInfo.length > 1 ? int.tryParse(fileInfo[1]) ?? 0 : 0,
      columnNumber: fileInfo.length > 2 ? int.tryParse(fileInfo[2]) ?? 0 : 0,
      stackTrace: stackTrace,
    );
  }

  final String functionName;
  final String callerFunctionName;
  final String fileName;
  final int lineNumber;
  final int columnNumber;
  final StackTrace stackTrace;

  static List<String> _getFileInfoFromFrame(String trace) {
    final indexOfFileName = trace.indexOf(RegExp('[A-Za-z | _ ]+.dart'));
    final fileInfo = trace.substring(indexOfFileName);

    return fileInfo.split(':').map((e) => e.replaceAll(')', '')).toList();
  }

  static String _getFunctionNameFromFrame(String trace) {
    final indexOfWhiteSpace = trace.indexOf(' ');
    final subStr = trace.substring(indexOfWhiteSpace);
    final indexOfFunction = subStr.indexOf(RegExp('[A-Za-z0-9]'));

    return subStr
        .substring(indexOfFunction)
        .substring(0, subStr.substring(indexOfFunction).indexOf(' '));
  }
}
