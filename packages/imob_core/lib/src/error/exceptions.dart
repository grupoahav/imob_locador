class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({
    this.message = 'Houve um erro no servidor',
    this.statusCode,
  });
}

class CacheException implements Exception {
  final String message;

  CacheException({
    this.message = 'Houve um erro no armazenamento interno',
  });
}
