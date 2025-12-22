import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> saveAndShareCsv(String csvContent, String fileName) async {
  final path = (await getApplicationDocumentsDirectory()).path;
  final filePath = "$path/$fileName";
  final file = File(filePath);

  await file.writeAsString(csvContent);

  await Share.shareXFiles([XFile(filePath)], text: "Here is your recording!");
}
