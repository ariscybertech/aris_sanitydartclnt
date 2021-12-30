part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// Mutation class
@JsonSerializable(nullable: true)
class Mutation {
  @JsonKey(name: 'Mutations')
  late List<Object> _mutations;

  /// constructor
  Mutation();

  Mutation createOrReplace() {
    return this;
  }

  /// Convert from json
  factory Mutation.fromJson(Map<String, dynamic> json) =>
      _$MutationFromJson(json);

  /// Convert to json
  Map<String, dynamic> toJson() => _$MutationToJson(this);
}
