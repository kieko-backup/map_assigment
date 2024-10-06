class EnvConfig {
  const EnvConfig._();
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://next-innovations.ltd',
  );

  static const String logLevel =  String.fromEnvironment(
    "LOG_LEVEL",
    defaultValue: "info",
  );
}
