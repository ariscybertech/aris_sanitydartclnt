part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// Returns `true` if the {projectId} is valid.
///
/// ```dart
/// validateProjectId(production) == true
/// ```
bool validateProjectId(String projectId) {
  var exp = RegExp(r"^[-a-z0-9]+$");

  if (!exp.hasMatch(projectId)) {
    throw Exception('''
      Datasets can only contain lowercase characters, numbers, underscores and dashes
    ''');
  }

  return true;
}

/// Returns `true` if the {projectId} is valid.
///
/// ```dart
/// validateDataset(production) == true
/// ```
bool validateDataset(String? name) {
  var exp = RegExp(r"^[-\w]{1,128}$");

  if (!exp.hasMatch(name!)) {
    throw Exception('''
      `projectId` can only contain only a-z, 0-9 and dashes
    ''');
  }

  return true;
}

/// Returns dataset name.
///
/// ```dart
/// hasDataset(config) == production
/// ```
String? hasDataset(SanityClientOptions config) {
  if (config.dataset == null) {
    throw Exception('`dataset` must be provided to perform queries');
  }
  return config.dataset;
}
