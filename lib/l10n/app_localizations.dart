import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get start;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'STOP'**
  String get stop;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'RESUME'**
  String get resume;

  /// No description provided for @lap.
  ///
  /// In en, this message translates to:
  /// **'LAP'**
  String get lap;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @renameStopwatch.
  ///
  /// In en, this message translates to:
  /// **'Rename stopwatch'**
  String get renameStopwatch;

  /// No description provided for @renameGroup.
  ///
  /// In en, this message translates to:
  /// **'Rename group'**
  String get renameGroup;

  /// No description provided for @renameRecording.
  ///
  /// In en, this message translates to:
  /// **'Rename recording'**
  String get renameRecording;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cantSaveWhileRunning.
  ///
  /// In en, this message translates to:
  /// **'Can\'t save while running'**
  String get cantSaveWhileRunning;

  /// No description provided for @cantSaveEmptyStopwatch.
  ///
  /// In en, this message translates to:
  /// **'Can\'t save empty stopwatch'**
  String get cantSaveEmptyStopwatch;

  /// No description provided for @hasBeenSavedAndReseted.
  ///
  /// In en, this message translates to:
  /// **'\'{name}\' has been saved and reseted'**
  String hasBeenSavedAndReseted(String name);

  /// No description provided for @undoReset.
  ///
  /// In en, this message translates to:
  /// **'Undo reset'**
  String get undoReset;

  /// No description provided for @cantResetWhileRunning.
  ///
  /// In en, this message translates to:
  /// **'Can\'t reset while running'**
  String get cantResetWhileRunning;

  /// No description provided for @hasBeenReseted.
  ///
  /// In en, this message translates to:
  /// **'\'{name}\' has been reseted'**
  String hasBeenReseted(String name);

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @seperateRunningStoppedSetting.
  ///
  /// In en, this message translates to:
  /// **'In sort criterion \"by longest (lap) time\", do you want to have the stopped stopwatches at the bottom?'**
  String get seperateRunningStoppedSetting;

  /// No description provided for @defaultSortCriterion.
  ///
  /// In en, this message translates to:
  /// **'Default sort criterion:'**
  String get defaultSortCriterion;

  /// No description provided for @defaultSortDirection.
  ///
  /// In en, this message translates to:
  /// **'Default sort direction:'**
  String get defaultSortDirection;

  /// No description provided for @timeformatCsvExport.
  ///
  /// In en, this message translates to:
  /// **'Timeformat for .csv export:'**
  String get timeformatCsvExport;

  /// No description provided for @delimiterCsvFile.
  ///
  /// In en, this message translates to:
  /// **'Delimiter for .csv file:'**
  String get delimiterCsvFile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language:'**
  String get language;

  /// No description provided for @languageAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto (System)'**
  String get languageAuto;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageGerman;

  /// No description provided for @multiStopwatches.
  ///
  /// In en, this message translates to:
  /// **'MultiStopwatches'**
  String get multiStopwatches;

  /// No description provided for @addNewGroup.
  ///
  /// In en, this message translates to:
  /// **'Add a new group'**
  String get addNewGroup;

  /// No description provided for @recordings.
  ///
  /// In en, this message translates to:
  /// **'Recordings'**
  String get recordings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group {number}'**
  String group(int number);

  /// No description provided for @exportItem.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get exportItem;

  /// No description provided for @exportAll.
  ///
  /// In en, this message translates to:
  /// **'Export all'**
  String get exportAll;

  /// No description provided for @deleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete all'**
  String get deleteAll;

  /// No description provided for @deleteThisGroup.
  ///
  /// In en, this message translates to:
  /// **'Delete this group'**
  String get deleteThisGroup;

  /// No description provided for @saveAll.
  ///
  /// In en, this message translates to:
  /// **'Save all'**
  String get saveAll;

  /// No description provided for @resetAll.
  ///
  /// In en, this message translates to:
  /// **'Reset all'**
  String get resetAll;

  /// No description provided for @changeOrder.
  ///
  /// In en, this message translates to:
  /// **'Change order'**
  String get changeOrder;

  /// No description provided for @exportGroup.
  ///
  /// In en, this message translates to:
  /// **'Export Group'**
  String get exportGroup;

  /// No description provided for @deleteGroup.
  ///
  /// In en, this message translates to:
  /// **'Delete Group'**
  String get deleteGroup;

  /// No description provided for @aboutPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Hello, my name is Josua, and I\'m a computer science student. In my free time, I work as a triathlon coach, and I found the need to simultaneously record the times of my athletes during track intervals or swim races. That\'s why I developed this app. \n\nIf you have any feedback, suggestions for improvement, or encounter any issues, please don\'t hesitate to let me know! \n\nYour input is greatly appreciated.'**
  String get aboutPageDescription;

  /// No description provided for @contactMe.
  ///
  /// In en, this message translates to:
  /// **'Contact me'**
  String get contactMe;

  /// No description provided for @rateThisApp.
  ///
  /// In en, this message translates to:
  /// **'Rate this app'**
  String get rateThisApp;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @appVersionMessage.
  ///
  /// In en, this message translates to:
  /// **'Your app version is {version}+{buildNumber}'**
  String appVersionMessage(String version, String buildNumber);

  /// No description provided for @pleaseAddToStore.
  ///
  /// In en, this message translates to:
  /// **'Please add the app to the store first!'**
  String get pleaseAddToStore;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the MultiStopwatches app by Josua'**
  String get welcomeMessage;

  /// No description provided for @startAll.
  ///
  /// In en, this message translates to:
  /// **'START ALL'**
  String get startAll;

  /// No description provided for @addStopwatch.
  ///
  /// In en, this message translates to:
  /// **'Add Stopwatch'**
  String get addStopwatch;

  /// No description provided for @lapTime.
  ///
  /// In en, this message translates to:
  /// **'Lap time'**
  String get lapTime;

  /// No description provided for @splitTime.
  ///
  /// In en, this message translates to:
  /// **'Split time'**
  String get splitTime;

  /// No description provided for @fromGroup.
  ///
  /// In en, this message translates to:
  /// **'from {groupName}'**
  String fromGroup(String groupName);

  /// No description provided for @allRecordingsDeleted.
  ///
  /// In en, this message translates to:
  /// **'All recordings have been deleted'**
  String get allRecordingsDeleted;

  /// No description provided for @recordingDeleted.
  ///
  /// In en, this message translates to:
  /// **'Recording have been deleted'**
  String get recordingDeleted;

  /// No description provided for @recordingsDeleted.
  ///
  /// In en, this message translates to:
  /// **'Recordings have been deleted'**
  String get recordingsDeleted;

  /// No description provided for @deleteGroupTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete {name}'**
  String deleteGroupTitle(String name);

  /// No description provided for @areYouSureCannotUndo.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? This can not be undone'**
  String get areYouSureCannotUndo;

  /// No description provided for @youHaveToCheckBox.
  ///
  /// In en, this message translates to:
  /// **'You have to check the box'**
  String get youHaveToCheckBox;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM'**
  String get confirm;

  /// No description provided for @changeSorting.
  ///
  /// In en, this message translates to:
  /// **'Change sorting'**
  String get changeSorting;

  /// No description provided for @sortByName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sortByName;

  /// No description provided for @sortByLongestTime.
  ///
  /// In en, this message translates to:
  /// **'Longest Time'**
  String get sortByLongestTime;

  /// No description provided for @sortByLongestLapTime.
  ///
  /// In en, this message translates to:
  /// **'Longest Lap Time'**
  String get sortByLongestLapTime;

  /// No description provided for @sortByCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get sortByCustom;

  /// No description provided for @sortAscending.
  ///
  /// In en, this message translates to:
  /// **'Ascending'**
  String get sortAscending;

  /// No description provided for @sortDescending.
  ///
  /// In en, this message translates to:
  /// **'Descending'**
  String get sortDescending;

  /// No description provided for @customSortExplanation.
  ///
  /// In en, this message translates to:
  /// **'Drag stopwatches to reorder them manually'**
  String get customSortExplanation;

  /// No description provided for @athleteNumber.
  ///
  /// In en, this message translates to:
  /// **'Athlete {number}'**
  String athleteNumber(int number);

  /// No description provided for @cantDeleteWhileRunning.
  ///
  /// In en, this message translates to:
  /// **'Can\'t delete while running'**
  String get cantDeleteWhileRunning;

  /// No description provided for @allStopwatchesRemoved.
  ///
  /// In en, this message translates to:
  /// **'All stopwatches have been removed'**
  String get allStopwatchesRemoved;

  /// No description provided for @stopwatchRemoved.
  ///
  /// In en, this message translates to:
  /// **'\'{name}\' has been removed'**
  String stopwatchRemoved(String name);

  /// No description provided for @allStopwatchesReseted.
  ///
  /// In en, this message translates to:
  /// **'All stopwatches have been reseted'**
  String get allStopwatchesReseted;

  /// No description provided for @hereIsYourRecording.
  ///
  /// In en, this message translates to:
  /// **'Here is your recording!'**
  String get hereIsYourRecording;

  /// No description provided for @totalTime.
  ///
  /// In en, this message translates to:
  /// **'Total Time'**
  String get totalTime;

  /// No description provided for @lapNo.
  ///
  /// In en, this message translates to:
  /// **'Lap No.'**
  String get lapNo;

  /// No description provided for @nameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get nameCannotBeEmpty;

  /// No description provided for @nameAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Name already exists'**
  String get nameAlreadyExists;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
