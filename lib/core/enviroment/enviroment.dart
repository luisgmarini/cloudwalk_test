class Environment {
  Environment._({
    required this.apiKey,
  });

  final String apiKey;

  factory Environment.initialize({
    required String apiKey,
  }) {
    _instance ??= Environment._(
      apiKey: apiKey,
    );
    return _instance!;
  }

  static Environment? get instance => _instance;

  static Environment? _instance;
}
