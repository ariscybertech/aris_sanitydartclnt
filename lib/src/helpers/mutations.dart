part of 'package:sanity_client_flutter/sanity_client_flutter.dart';

/// Get mutation query
MutationQueryOptions getMutationQuery(BaseMutationOptions options) {
  var rsp = MutationQueryOptions();
  rsp.returnDocuments = options.returnDocuments;
  rsp.visibility =
      options.visibility != null ? options.visibility : MutationVisibility.sync;
  rsp.returnIds = true;
  return rsp;
}
