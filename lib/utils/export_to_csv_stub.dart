// Stub implementation for platforms that don't support file export
Future<void> saveAndShareCsv(String csvContent, String fileName) async {
  throw UnsupportedError('CSV export is not supported on this platform');
}
