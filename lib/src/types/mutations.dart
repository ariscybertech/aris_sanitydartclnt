class MutationOperation {
  String? operation;
  String? documentId;
  Object? document;
}

class SingleMutationResult {
  String? transactionId;
  String? documentId;
  Iterable<Map<String, dynamic>>? results;
}

///
class MultipleMutationResult {
  String? transactionId;
  Iterable<String>? documentIds;
  Iterable<Map<String, dynamic>>? results;
}

class IdentifiedSanityDocumentStub {}
