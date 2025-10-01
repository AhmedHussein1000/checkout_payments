abstract class CustomException implements Exception {
  final String message;
  const CustomException(this.message);
}

class ServerException extends CustomException {
  const ServerException(super.message);
}
class CacheException extends CustomException {
  const CacheException(super.message);
}
