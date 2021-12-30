part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// A simple crud interface
abstract class Crud<C, R, U, D> {
  /// Create an entity
  Future<R?>? create(C data) {
    return null;
  }

  /// Update an entity
  Future<R?>? update(U data) {
    return null;
  }

  /// Delete an entity
  Future<D?>? delete(String id) {
    return null;
  }

  /// List all entity
  Future<Iterable<R?>>? list() {
    return null;
  }
}

/// A simple crud interface
abstract class CrudWithGet<C, R, U, D> extends Crud<C, R, U, D> {
  /// Get an entity
  Future<R?>? getOne(String id) {
    return null;
  }
}

/// Request option
abstract class RequestOptions {
  /// Request timeout
  int? timeout;

  /// request token
  String? token;
}
