import 'dart:convert';
import 'dart:html' as html;

Future<void> saveAndShareCsv(String csvContent, String fileName) async {
  // Create a blob from the CSV content
  final bytes = utf8.encode(csvContent);
  final blob = html.Blob([bytes]);

  // Create a download link
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', fileName)
    ..style.display = 'none';

  // Add to document, click, and remove
  html.document.body?.children.add(anchor);
  anchor.click();
  html.document.body?.children.remove(anchor);

  // Clean up the URL
  html.Url.revokeObjectUrl(url);
}
