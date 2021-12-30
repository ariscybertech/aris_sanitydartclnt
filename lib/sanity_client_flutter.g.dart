// GENERATED CODE - DO NOT MODIFY BY HAND

part of sanity_client_flutter;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mutation _$MutationFromJson(Map<String, dynamic> json) {
  return Mutation();
}

Map<String, dynamic> _$MutationToJson(Mutation instance) => <String, dynamic>{};

SanityDocument _$SanityDocumentFromJson(Map<String, dynamic> json) {
  return SanityDocument(
    id: json['_id'] as String,
    rev: json['_rev'] as String,
    type: json['_type'] as String,
    createdAt: json['_createdAt'] as String,
    updatedAt: json['_updatedAt'] as String,
  );
}

Map<String, dynamic> _$SanityDocumentToJson(SanityDocument instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_rev': instance.rev,
      '_type': instance.type,
      '_createdAt': instance.createdAt,
      '_updatedAt': instance.updatedAt,
    };

SanityType _$SanityTypeFromJson(Map<String, dynamic> json) {
  return SanityType(
    type: json['_type'] as String,
  );
}

Map<String, dynamic> _$SanityTypeToJson(SanityType instance) =>
    <String, dynamic>{
      '_type': instance.type,
    };

SanityId _$SanityIdFromJson(Map<String, dynamic> json) {
  return SanityId(
    id: json['_id'] as String,
  );
}

Map<String, dynamic> _$SanityIdToJson(SanityId instance) => <String, dynamic>{
      '_id': instance.id,
    };
