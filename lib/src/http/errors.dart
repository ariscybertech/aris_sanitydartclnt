/// Client only exception
class ClientException implements Exception {
  /// Exception cause or reason
  final String cause;

  /// [ClientException] constructor
  ClientException(this.cause);
}

/// Sever only exception
class ServerException implements Exception {
  /// Exception cause or reason
  final String cause;

  /// [ServerException] constructor
  ServerException(this.cause);
}