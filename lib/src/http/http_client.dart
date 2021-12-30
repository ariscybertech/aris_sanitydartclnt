part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// [HttpClient] options
class HttpClientOption {
  /// auth token
  String? authToken;

  /// content type
  String? contentType;

  /// headers
  Map<String, dynamic>? headers;

  /// Request base url, it can contain sub path.
  String? baseUrl;

  /// Timeout in milliseconds for opening url.
  ///  when time out.
  int connectTimeout;

  /// Default constructor
  HttpClientOption({
    this.baseUrl,
    this.authToken,
    this.headers,
    this.contentType,
    this.connectTimeout = 5 * 60 * 1000,
  });
}

/// An RxDart http client
class HttpClient {
  HttpClient._internal();

  late HttpClientOption _option;

  /// Singleton lock instance
  bool _lock = false;
  late Dio _dio;

  /// [HttpClient] constructor that creates a singleton
  factory HttpClient(HttpClientOption option) {
    assert(!_instance._lock, "it's a singleton that can't re-defined");
    _instance._option = option;
    _instance._init();
    _instance._lock = true;
    return _instance;
  }

  static final HttpClient _instance = HttpClient._internal();

  _init() {
    var options = BaseOptions(
      baseUrl: _option.baseUrl,
      headers: _option.headers,
      contentType: _option.contentType,
      connectTimeout: _option.connectTimeout,
    );

    _dio = Dio(options);
  }

  /// Handy method to make http POST request..
  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post<T>(
      path,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
    );
  }

  /// Handy method to make http HEAD request..
  Future<Response<T>> head<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.head<T>(
      path,
      options: options,
      cancelToken: cancelToken,
      data: data,
      queryParameters: queryParameters,
    );
  }

  /// Handy method to make http PUT request..
  Future<Response<T>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.put<T>(
      path,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
    );
  }

  /// Handy method to make http PATCH request..
  Future<Response<T>> patch<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.patch<T>(
      path,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      data: data,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
    );
  }

  /// Handy method to make http GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get<T>(
      path,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
    );
  }

  /// Handy method to make http GET request.
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      options: options,
      cancelToken: cancelToken,
      queryParameters: queryParameters,
    );
  }

  /// Make http request with options.
  ///
  /// [path] The url path.
  /// [data] The request data
  /// [options] The request options.
  Future<Response<T>> request<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio.request<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
