class ServerException<ErrorModel> implements Exception {
  final ErrorModel error;
  ServerException(this.error);
}

class CacheException implements Exception {
  final String message;
  CacheException({required this.message});
}
