import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

enum CSVDelimiter {
  comma(","),
  semicolon(";"),
  space(" ");

  final String delimiter;

  const CSVDelimiter(this.delimiter);

  String label(BuildContext context) {
    switch (this) {
      case CSVDelimiter.comma:
        return AppLocalizations.of(context)!.delimiterComma;
      case CSVDelimiter.semicolon:
        return AppLocalizations.of(context)!.delimiterSemicolon;
      case CSVDelimiter.space:
        return AppLocalizations.of(context)!.delimiterSpace;
    }
  }
}
