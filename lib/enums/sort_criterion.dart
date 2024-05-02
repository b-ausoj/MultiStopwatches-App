enum SortCriterion {
  name("Name"),
  longestTime("Longest Time"),
  longestLapTime("Longest Lap Time"),
  customReordable("Custom");

  final String label;
  const SortCriterion(this.label);
}
