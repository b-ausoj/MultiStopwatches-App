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

  /// No description provided for @hasBeenSavedAndReset.
  ///
  /// In en, this message translates to:
  /// **'\'{name}\' has been saved and reset'**
  String hasBeenSavedAndReset(String name);

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

  /// No description provided for @hasBeenReset.
  ///
  /// In en, this message translates to:
  /// **'\'{name}\' has been reset'**
  String hasBeenReset(String name);

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

  /// No description provided for @separateRunningStoppedSetting.
  ///
  /// In en, this message translates to:
  /// **'In sort criterion by \"Longest Time / Lap Time\", do you want to have the stopped stopwatches at the bottom?'**
  String get separateRunningStoppedSetting;

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

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme:'**
  String get themeMode;

  /// No description provided for @themeModeSystem.
  ///
  /// In en, this message translates to:
  /// **'Auto (System)'**
  String get themeModeSystem;

  /// No description provided for @themeModeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeModeLight;

  /// No description provided for @themeModeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeModeDark;

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

  /// No description provided for @allStopwatchesReset.
  ///
  /// In en, this message translates to:
  /// **'All stopwatches have been reset'**
  String get allStopwatchesReset;

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

  /// No description provided for @delimiterComma.
  ///
  /// In en, this message translates to:
  /// **'Comma ,'**
  String get delimiterComma;

  /// No description provided for @delimiterSemicolon.
  ///
  /// In en, this message translates to:
  /// **'Semicolon ;'**
  String get delimiterSemicolon;

  /// No description provided for @delimiterSpace.
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get delimiterSpace;

  /// No description provided for @tncTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions for MultiStopwatches'**
  String get tncTitle;

  /// No description provided for @tncLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: 29.12.2025'**
  String get tncLastUpdated;

  /// No description provided for @tncIntro.
  ///
  /// In en, this message translates to:
  /// **'Please read these terms and conditions (\"terms\") carefully before using the MultiStopwatches web application (\"service\") operated by Josua B. (\"us\", \"we\", or \"our\").'**
  String get tncIntro;

  /// No description provided for @tncTermsOfUseTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get tncTermsOfUseTitle;

  /// No description provided for @tncTermsOfUse.
  ///
  /// In en, this message translates to:
  /// **'By accessing or using the web application, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You\'re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You\'re not allowed to make derivative versions of the app. The app itself, and all the trademarks, copyright, and other intellectual property rights related to it, belong to Josua B.'**
  String get tncTermsOfUse;

  /// No description provided for @tncServicePricingTitle.
  ///
  /// In en, this message translates to:
  /// **'Service and Pricing'**
  String get tncServicePricingTitle;

  /// No description provided for @tncServicePricing.
  ///
  /// In en, this message translates to:
  /// **'MultiStopwatches is currently provided free of charge as a web application. We reserve the right to introduce optional donation features or change the pricing model in the future, with prior notice to users.'**
  String get tncServicePricing;

  /// No description provided for @tncYourResponsibilitiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Responsibilities'**
  String get tncYourResponsibilitiesTitle;

  /// No description provided for @tncYourResponsibilities.
  ///
  /// In en, this message translates to:
  /// **'You are responsible for ensuring that your browser is compatible with the web application. An internet connection is required to initially load the application. If you install the app as a Progressive Web App (PWA), it can be used offline after the initial load. All your data is stored locally in your browser\'s storage and is your responsibility to backup if needed.'**
  String get tncYourResponsibilities;

  /// No description provided for @tncDataStorageTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Storage'**
  String get tncDataStorageTitle;

  /// No description provided for @tncDataStorage.
  ///
  /// In en, this message translates to:
  /// **'All application data is stored exclusively in your browser\'s local storage. No data is transmitted to or stored on our servers. You are responsible for your own data management, including backups. Clearing your browser data will delete all application data.'**
  String get tncDataStorage;

  /// No description provided for @tncLimitationLiabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get tncLimitationLiabilityTitle;

  /// No description provided for @tncLimitationLiability.
  ///
  /// In en, this message translates to:
  /// **'Josua B is not responsible for any direct, indirect, incidental, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the service. We do not warrant that:'**
  String get tncLimitationLiability;

  /// No description provided for @tncLimitationLiabilityPoint1.
  ///
  /// In en, this message translates to:
  /// **'•the service will function uninterrupted, secure or available at any particular time or location;'**
  String get tncLimitationLiabilityPoint1;

  /// No description provided for @tncLimitationLiabilityPoint2.
  ///
  /// In en, this message translates to:
  /// **'•any errors or defects will be corrected;'**
  String get tncLimitationLiabilityPoint2;

  /// No description provided for @tncLimitationLiabilityPoint3.
  ///
  /// In en, this message translates to:
  /// **'•the service is free of viruses or other harmful components;'**
  String get tncLimitationLiabilityPoint3;

  /// No description provided for @tncLimitationLiabilityPoint4.
  ///
  /// In en, this message translates to:
  /// **'•your data stored in browser storage will be preserved (you are responsible for backups).'**
  String get tncLimitationLiabilityPoint4;

  /// No description provided for @tncGoverningLawTitle.
  ///
  /// In en, this message translates to:
  /// **'Governing Law'**
  String get tncGoverningLawTitle;

  /// No description provided for @tncGoverningLaw.
  ///
  /// In en, this message translates to:
  /// **'These terms shall be governed by and construed in accordance with the laws of Switzerland, without regard to its conflict of law provisions.'**
  String get tncGoverningLaw;

  /// No description provided for @tncChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Changes to These Terms and Conditions'**
  String get tncChangesTitle;

  /// No description provided for @tncChanges.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to modify these terms at any time. We will notify you of any changes by updating the \"Last updated\" date. Your continued use of the app after any such changes constitutes your acceptance of the new terms.'**
  String get tncChanges;

  /// No description provided for @tncContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get tncContactTitle;

  /// No description provided for @tncContact.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about these Terms and Conditions, please contact us at:'**
  String get tncContact;

  /// No description provided for @ppTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy for MultiStopwatches'**
  String get ppTitle;

  /// No description provided for @ppLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: 29.12.2025'**
  String get ppLastUpdated;

  /// No description provided for @ppIntro.
  ///
  /// In en, this message translates to:
  /// **'Thank you for choosing to use MultiStopwatches. We take your privacy seriously and are committed to protecting it. This privacy policy explains how we handle information in relation to the MultiStopwatches web application.'**
  String get ppIntro;

  /// No description provided for @ppInfoCollectTitle.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect and Store'**
  String get ppInfoCollectTitle;

  /// No description provided for @ppInfoCollect.
  ///
  /// In en, this message translates to:
  /// **'MultiStopwatches does not collect, transmit, or store any personal data on external servers. The application stores all user data (including stopwatch configurations, recordings, and settings) exclusively in your browser\'s local storage (localStorage/IndexedDB). This data never leaves your device and is not transmitted to us or any third party.'**
  String get ppInfoCollect;

  /// No description provided for @ppInternetTitle.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection'**
  String get ppInternetTitle;

  /// No description provided for @ppInternet.
  ///
  /// In en, this message translates to:
  /// **'An internet connection is required only to initially load the web application. Once loaded, or if installed as a Progressive Web App (PWA), the application can function completely offline. No data is transmitted during usage, whether online or offline.'**
  String get ppInternet;

  /// No description provided for @ppCookiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Cookies and Tracking'**
  String get ppCookiesTitle;

  /// No description provided for @ppCookies.
  ///
  /// In en, this message translates to:
  /// **'MultiStopwatches does not use cookies, analytics, tracking scripts, or any other data collection technologies. We do not track your usage or collect any information about how you use the application.'**
  String get ppCookies;

  /// No description provided for @ppDataSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Security and Control'**
  String get ppDataSecurityTitle;

  /// No description provided for @ppDataSecurity.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored locally in your browser\'s storage and remains under your complete control. You can delete all application data at any time by clearing your browser\'s storage or cache. We recommend backing up important data, as we have no access to or copies of your data and cannot recover it if lost.'**
  String get ppDataSecurity;

  /// No description provided for @ppYourRightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get ppYourRightsTitle;

  /// No description provided for @ppYourRights.
  ///
  /// In en, this message translates to:
  /// **'Since all data is stored locally on your device and no data is collected by us, you have complete control over your information. You can access, modify, export, or delete your data at any time through the application or your browser settings. We do not process any personal data, so GDPR data subject requests are not applicable.'**
  String get ppYourRights;

  /// No description provided for @ppThirdPartyTitle.
  ///
  /// In en, this message translates to:
  /// **'Third-Party Services'**
  String get ppThirdPartyTitle;

  /// No description provided for @ppThirdParty.
  ///
  /// In en, this message translates to:
  /// **'MultiStopwatches does not integrate with or share data with any third-party services, analytics platforms, or external APIs.'**
  String get ppThirdParty;

  /// No description provided for @ppChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Changes to This Privacy Policy'**
  String get ppChangesTitle;

  /// No description provided for @ppChanges.
  ///
  /// In en, this message translates to:
  /// **'We may update our Privacy Policy from time to time. We will notify you of any changes by updating the \"Last updated\" date on this page. You are advised to review this Privacy Policy periodically for any changes.'**
  String get ppChanges;

  /// No description provided for @ppContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get ppContactTitle;

  /// No description provided for @ppContact.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about this Privacy Policy, please contact us at:'**
  String get ppContact;
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
