extension MapStringDynamicExtension on Map<String, dynamic> {
  Map<String, dynamic> keysToLowerCase() {
    return map((key, value) => MapEntry(key.toLowerCase(), value));
  }
}
