import 'package:dio/dio.dart';
import 'package:sanity_client_flutter/sanity_client_flutter.dart';
import 'package:test/test.dart';

void main() {
  var opts = SanityClientOptions(projectId: 'exx11uq', dataset: 'rex-test');

  group('Dataset Client', () {
    var client = SanityClient(opts);

    test('requires auth to fetch dataset list', () async {
      // expect(, 'Http status error [404]');
      dynamic error;

      try {
        await client.dataset.list();
        fail("did not throw");
      } on DioError catch (e) {
        error = e;
      }

      expect(error, isNotNull);
      expect(error.message, 'Http status error [404]');
      expect(error is Exception, isTrue);
    });

    opts.token = '';
    client = SanityClient(opts);
    test('fetches dataset list with auth token', () async {
      // expect(, 'Http status error [404]');
      dynamic error;

      try {
        await client.dataset.list();
        fail("did not throw");
      } on DioError catch (e) {
        error = e;
      }

      expect(error, isNotNull);
      expect(error.message, 'Http status error [404]');
      expect(error is Exception, isTrue);
    });
  });
}
