class AppConfig {
  static const String contactEmail = String.fromEnvironment(
    'CONTACT_EMAIL',
    defaultValue: 'contact@example.com',
  );
}
