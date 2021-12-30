part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// Interact with sanity dataset
class DatasetClient
    implements
        Crud<CreateUpdateDatasetDto, DatasetResponse, CreateUpdateDatasetDto,
            DeleteResponse> {
  /// HTTP client
  late HttpClient _httpClient;

  /// [DatasetClient] Default constructor
  DatasetClient(HttpClient httpClient) {
    _httpClient = httpClient;
  }

  @override
  Future<DatasetResponse> create(CreateUpdateDatasetDto data) async {
    var body = <String, dynamic>{};
    body['aclMode'] = data.aclMode.toString();

    var result = await _httpClient.put<DatasetResponse>(
      '/datasets/${data.name}',
      data: body,
    );
    return result.data;
  }

  @override
  Future<DeleteResponse> delete(String name) async {
    var result = await _httpClient.delete<DeleteResponse>(
      '/datasets/$name',
    );
    return result.data;
  }

  @override
  Future<Iterable<DatasetResponse>> list() async {
    var result = await _httpClient.get<Iterable<DatasetResponse>>('/datasets');
    return result.data;
  }

  @override
  Future<DatasetResponse?> update(CreateUpdateDatasetDto data) async {
    if (_httpClient != null) {
      var body = <String, dynamic>{};
      body['aclMode'] = data.aclMode.toString();

      var result = await _httpClient.patch<DatasetResponse>(
        '/datasets/${data.name}',
        data: body,
      );
      return result.data;
    }
  }
}
