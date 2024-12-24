class CondoException implements Exception {
  final String message;
  const CondoException(this.message);

  @override
  String toString() => message;
}