enum LogPrinterStyle {
  simple,
  pretty,
}

extension LogPrinterStyleExtension on LogPrinterStyle {
  bool get isSimple => this == LogPrinterStyle.simple;
  bool get isPretty => this == LogPrinterStyle.pretty;
}
