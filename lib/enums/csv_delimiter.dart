enum CSVDelimiter {
  comma("Comma", ","),
  semicolon("Semicolon", ";"),
  space("Space", " ");

  final String label;
  final String delimiter;

  const CSVDelimiter(this.label, this.delimiter);
}
