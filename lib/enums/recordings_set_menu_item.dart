import 'package:flutter/material.dart';

enum RecordingsSetMenuItem {
  exportAll("Export", Icons.save_alt_outlined),
  deleteAll("Delete", Icons.delete_outlined);

  final String label;
  final IconData icon;
  const RecordingsSetMenuItem(this.label, this.icon);
}
