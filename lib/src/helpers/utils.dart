part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// convert maps to query string
String encodeQueryString(Map params,
    {String prefix = '&', bool inRecursion = false}) {
  var query = '';

  params.forEach((key, value) {
    if (inRecursion) {
      key = '[$key]';
    }

    if (value is String || value is int || value is double || value is bool) {
      query += '$prefix$key=$value';
    } else if (value is List || value is Map) {
      if (value is List) value = value.asMap();
      value.forEach((k, v) {
        query += encodeQueryString(
          {k: v},
          prefix: '$prefix$key',
          inRecursion: true,
        );
      });
    }
  });

  return query;
}
