import 'package:flutter/material.dart';

enum RecordingsGroupMenuItem {
  exportAll("Export Group", Icons.save_alt_outlined),
  deleteAll("Delete Group", Icons.delete_outlined);

  final String label;
  final IconData icon;
  const RecordingsGroupMenuItem(this.label, this.icon);
}
