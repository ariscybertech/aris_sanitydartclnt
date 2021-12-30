part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// Sanity client
class SanityClient {
  SanityClient._internal();

  /// Singleton lock instance
  bool _lock = false;

  /// Default sanity client options
  late SanityClientOptions _config;

  /// [HttpClient] client for http request
  late HttpClient _httpClient;

  /// [Dataset] dataset api
  late DatasetClient dataset;

  static final SanityClient _instance = SanityClient._internal();

  _verifyConfig(SanityClientOptions config) {
    if (!validateProjectId(config.projectId)) {
      throw Exception("Configuration must contain `projectId`");
    }

    if (config.dataset != null) {
      validateDataset(config.dataset);
    }
  }

  /// init exposed sanity methods
  _init() {
    // setup http headers
    var header = <String, dynamic>{};
    if (_config.token != null) {
      header['Authorization'] = 'Bearer ${_config.token}';
    }

    if (_config.useProjectHostname == null && _config.projectId != null) {
      header[projectHeader] = _config.projectId;
    }

    var hostParts = _config.apiHost.split('://');
    var protocol = hostParts[0];
    var host = hostParts[1];

    var isDefaultApi = _config.apiHost == defaultApiHost;
    var cdnHost = isDefaultApi ? defaultCdnHost : host;

    if (_config.useProjectHostname) {
      _config.url = '$protocol://${_config.projectId}.$host/v1';
      _config.cdnUrl = '$protocol://${_config.projectId}.$cdnHost/v1';
    } else {
      _config.url = '${_config.apiHost}/v1';
      _config.cdnUrl = _config.url;
    }

    // Init http client options
    var httpOpts = HttpClientOption();
    httpOpts.contentType = 'application/json';
    httpOpts.headers = header;
    httpOpts.baseUrl = _config.useCdn == true ? _config.cdnUrl : _config.url;
    httpOpts.authToken = _config.token;

    _httpClient = HttpClient(httpOpts);
    dataset = DatasetClient(_httpClient);
  }

  /// [SanityClient] constructor that creates a singleton
  factory SanityClient(SanityClientOptions opts) {
    assert(!_instance._lock, "it's a singleton that can't re-defined");
    _instance._verifyConfig(opts);
    _instance._config = opts;
    _instance._lock = true;
    _instance._init();
    return _instance;
  }

  /// Fetch documents of type that extends [SanityDocument]
  Future<SanityResponse<T>> fetch<T>(Iterable<String> ids) async {
    var path = _getDataUrl('doc', ids.join(','));
    var result = await _httpClient.get<T>(path);

    return SanityResponse(
      data: result.data,
      statusCode: result.statusCode,
      statusMessage: result.statusMessage,
    );
  }

  /// Get documents of type that extends [SanityDocument]
  Future<SanityResponse<T>> getDocuments<T>(Iterable<String> ids) async {
    var path = _getDataUrl('doc', ids.join(','));
    var result = await _httpClient.get<T>(path);

    return SanityResponse(
      data: result.data,
      statusCode: result.statusCode,
      statusMessage: result.statusMessage,
    );
  }

  /// Get documents of type that extends [SanityDocument]
  Future<SanityResponse<T>> getDocument<T>(String id) async {
    var path = _getDataUrl('doc', id);
    var result = await _httpClient.get<T>(path);

    return SanityResponse(
      data: result.data,
      statusCode: result.statusCode,
      statusMessage: result.statusMessage,
    );
  }

  String _getDataUrl(String operation, String? path) {
    var catalog = hasDataset(_config);
    var baseUri = '/$operation/$catalog';
    var uri = path != null ? '$baseUri/$path' : baseUri;
    return uri;
  }
}
