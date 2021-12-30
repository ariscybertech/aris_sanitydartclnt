part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// Sanity ACL mode
enum DatasetAclMode {
  /// Make dataset visibility public
  public,

  /// Make dataset visibility private
  private
}

/// This is the base class for sanity client configuration
class DatasetResponse {
  /// Dataset name
  final String? name;

  /// Dataset acl mode
  final DatasetAclMode? aclMode;

  /// Default constructor
  DatasetResponse({
    this.name,
    this.aclMode,
  });
}

/// This is the base class for sanity client configuration
class CreateUpdateDatasetDto {
  /// Dataset name
  final String? name;

  /// Dataset acl mode
  final DatasetAclMode? aclMode;

  /// Default constructor
  CreateUpdateDatasetDto({
    this.name,
    this.aclMode = DatasetAclMode.public,
  });
}
