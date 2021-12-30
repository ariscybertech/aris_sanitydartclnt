part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// This is the base class for sanity client configuration
abstract class BaseClientOption {
  /// Flag for using CDN or non CDN API
  bool? useCdn;

  /// Auth token for current user
  String? token;

  /// `Optional` api host name
  final String apiHost;

  /// Default constructor
  BaseClientOption({
    this.useCdn = false,
    this.token,
    required this.apiHost,
  });
}

/// Default sanity client options
class SanityClientOptions extends BaseClientOption {
  /// Flag to specify to use host project
  final bool useProjectHostname;

  /// Actual sanity project id
  final String projectId;

  /// Actual sanity project dataset name
  final String? dataset;

  /// Flag to check if the api endpoint is default to sanity
  bool? isDefaultApi;

  /// Sanity CDN endpoint
  String? cdnUrl;

  /// Sanity plain endpoint
  String? url;

  /// Default [SanityClientOptions] constructor that takes in all
  /// relevant config options for [SanityClient]
  SanityClientOptions({
    this.useProjectHostname = true,
    required this.projectId,
    this.dataset,
    bool? useCdn,
    String? token,
    String apiHost = 'https://api.sanity.io',
  }) : super(
          apiHost: apiHost,
          useCdn: useCdn,
        );
}

/// Simple DTO for delete entity response
class DeleteResponse {
  /// delete response from http request
  final bool? deleted;

  /// Constructor
  DeleteResponse({this.deleted});
}
