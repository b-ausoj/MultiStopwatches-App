// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get start => 'START';

  @override
  String get stop => 'STOP';

  @override
  String get resume => 'RESUME';

  @override
  String get lap => 'LAP';

  @override
  String get rename => 'Rename';

  @override
  String get renameStopwatch => 'Rename stopwatch';

  @override
  String get renameGroup => 'Rename group';

  @override
  String get renameRecording => 'Rename recording';

  @override
  String get save => 'Save';

  @override
  String get reset => 'Reset';

  @override
  String get delete => 'Delete';

  @override
  String get cantSaveWhileRunning => 'Can\'t save while running';

  @override
  String get cantSaveEmptyStopwatch => 'Can\'t save empty stopwatch';

  @override
  String hasBeenSavedAndReseted(String name) {
    return '\'$name\' has been saved and reseted';
  }

  @override
  String get undoReset => 'Undo reset';

  @override
  String get cantResetWhileRunning => 'Can\'t reset while running';

  @override
  String hasBeenReseted(String name) {
    return '\'$name\' has been reseted';
  }

  @override
  String get undo => 'Undo';

  @override
  String get settings => 'Settings';

  @override
  String get seperateRunningStoppedSetting =>
      'In sort criterion \"by longest (lap) time\", do you want to have the stopped stopwatches at the bottom?';

  @override
  String get defaultSortCriterion => 'Default sort criterion:';

  @override
  String get defaultSortDirection => 'Default sort direction:';

  @override
  String get timeformatCsvExport => 'Timeformat for .csv export:';

  @override
  String get delimiterCsvFile => 'Delimiter for .csv file:';

  @override
  String get language => 'Language:';

  @override
  String get languageAuto => 'Auto (System)';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageGerman => 'German';

  @override
  String get multiStopwatches => 'MultiStopwatches';

  @override
  String get addNewGroup => 'Add a new group';

  @override
  String get recordings => 'Recordings';

  @override
  String get about => 'About';

  @override
  String group(int number) {
    return 'Group $number';
  }

  @override
  String get exportItem => 'Export';

  @override
  String get exportAll => 'Export all';

  @override
  String get deleteAll => 'Delete all';

  @override
  String get deleteThisGroup => 'Delete this group';

  @override
  String get saveAll => 'Save all';

  @override
  String get resetAll => 'Reset all';

  @override
  String get changeOrder => 'Change order';

  @override
  String get exportGroup => 'Export Group';

  @override
  String get deleteGroup => 'Delete Group';

  @override
  String get aboutPageDescription =>
      'Hello, my name is Josua, and I\'m a computer science student. In my free time, I work as a triathlon coach, and I found the need to simultaneously record the times of my athletes during track intervals or swim races. That\'s why I developed this app. \n\nIf you have any feedback, suggestions for improvement, or encounter any issues, please don\'t hesitate to let me know! \n\nYour input is greatly appreciated.';

  @override
  String get contactMe => 'Contact me';

  @override
  String get rateThisApp => 'Rate this app';

  @override
  String get termsAndConditions => 'Terms & conditions';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String appVersionMessage(String version, String buildNumber) {
    return 'Your app version is $version+$buildNumber';
  }

  @override
  String get pleaseAddToStore => 'Please add the app to the store first!';

  @override
  String get welcomeMessage => 'Welcome to the MultiStopwatches app by Josua';

  @override
  String get startAll => 'START ALL';

  @override
  String get addStopwatch => 'Add Stopwatch';

  @override
  String get lapTime => 'Lap time';

  @override
  String get splitTime => 'Split time';

  @override
  String fromGroup(String groupName) {
    return 'from $groupName';
  }

  @override
  String get allRecordingsDeleted => 'All recordings have been deleted';

  @override
  String get recordingDeleted => 'Recording have been deleted';

  @override
  String get recordingsDeleted => 'Recordings have been deleted';

  @override
  String deleteGroupTitle(String name) {
    return 'Delete $name';
  }

  @override
  String get areYouSureCannotUndo => 'Are you sure? This can not be undone';

  @override
  String get youHaveToCheckBox => 'You have to check the box';

  @override
  String get cancel => 'CANCEL';

  @override
  String get ok => 'OK';

  @override
  String get confirm => 'CONFIRM';

  @override
  String get changeSorting => 'Change sorting';

  @override
  String get sortByName => 'Name';

  @override
  String get sortByLongestTime => 'Longest Time';

  @override
  String get sortByLongestLapTime => 'Longest Lap Time';

  @override
  String get sortByCustom => 'Custom';

  @override
  String get sortAscending => 'Ascending';

  @override
  String get sortDescending => 'Descending';

  @override
  String get customSortExplanation =>
      'Drag stopwatches to reorder them manually';

  @override
  String athleteNumber(int number) {
    return 'Athlete $number';
  }

  @override
  String get cantDeleteWhileRunning => 'Can\'t delete while running';

  @override
  String get allStopwatchesRemoved => 'All stopwatches have been removed';

  @override
  String stopwatchRemoved(String name) {
    return '\'$name\' has been removed';
  }

  @override
  String get allStopwatchesReseted => 'All stopwatches have been reseted';

  @override
  String get hereIsYourRecording => 'Here is your recording!';

  @override
  String get totalTime => 'Total Time';

  @override
  String get lapNo => 'Lap No.';

  @override
  String get nameCannotBeEmpty => 'Name cannot be empty';

  @override
  String get nameAlreadyExists => 'Name already exists';
}
