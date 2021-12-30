part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// Sanity document model
@JsonSerializable(nullable: true)
class SanityDocument {
  /// Get/Set sanity document internal revision
  @JsonKey(name: '_id')
  final String? id;

  /// Get/Set sanity document internal revision
  @JsonKey(name: '_rev')
  final String? rev;

  /// Get/Set sanity document type
  @JsonKey(name: '_type')
  final String? type;

  /// Get/Set sanity document created timestamp
  @JsonKey(name: '_createdAt')
  final String? createdAt;

  /// Get/Set sanity document updated timestamp
  @JsonKey(name: '_updatedAt')
  final String? updatedAt;

  /// Constructor
  SanityDocument({
    this.id,
    this.rev,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  /// Convert from json
  factory SanityDocument.fromJson(Map<String, dynamic> json) =>
      _$SanityDocumentFromJson(json);

  /// Convert to json
  Map<String, dynamic> toJson() => _$SanityDocumentToJson(this);
}

/// Sanity document response
class SanityResponse<T> {
  /// Status message
  final String? statusMessage;

  /// Status message
  final int? statusCode;

  /// Sanity data
  final T? data;

  /// Constructor
  SanityResponse({
    this.statusMessage,
    this.statusCode,
    this.data,
  });
}

/// Filtered sanity request. It extends [RequestOptions]
class FilterResponseQueryOptions extends RequestOptions {
  /// Boolean flag to filter request
  bool filterResponse = true;
}

/// Sanity mutation visibility
enum MutationVisibility {
  /// Mutation is is sync
  sync,

  /// Mutation is is async
  async,

  /// Defer mutation call
  defer,
}

/// Base sanity mutation type
class BaseMutationOptions extends RequestOptions {
  /// Mutation visibility
  MutationVisibility? visibility;

  /// Should return all document
  bool? returnDocuments;

  /// return first document
  bool? returnFirst;
}

/// Base sanity mutation query type
class MutationQueryOptions extends RequestOptions {
  /// Mutation visibility
  MutationVisibility? visibility;

  /// Should return all document
  bool? returnDocuments;

  /// return document ids
  bool? returnIds;

  /// convert type to map
  Map<String, dynamic> toMap() {
    return {
      'visibility': visibility,
      'returnDocuments': returnDocuments,
      'returnIds': returnIds,
    };
  }
}

/// Sanity with document type interface
@JsonSerializable(nullable: true)
class SanityType {
  /// sanity document type
  @JsonKey(name: '_type')
  String? type;

  /// Constructor
  SanityType({this.type});

  /// Convert from json
  factory SanityType.fromJson(Map<String, dynamic> json) =>
      _$SanityTypeFromJson(json);

  /// Convert to json
  Map<String, dynamic> toJson() => _$SanityTypeToJson(this);
}

/// Sanity with document id interface
@JsonSerializable(nullable: true)
class SanityId {
  /// sanity id
  @JsonKey(name: '_id')
  String? id;

  /// Constructor
  SanityId({this.id});

  /// Convert from json
  factory SanityId.fromJson(Map<String, dynamic> json) =>
      _$SanityIdFromJson(json);

  /// Convert to json
  Map<String, dynamic> toJson() => _$SanityIdToJson(this);
}
