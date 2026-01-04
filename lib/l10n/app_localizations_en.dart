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
  String hasBeenSavedAndReset(String name) {
    return '\'$name\' has been saved and reset';
  }

  @override
  String get undoReset => 'Undo reset';

  @override
  String get cantResetWhileRunning => 'Can\'t reset while running';

  @override
  String hasBeenReset(String name) {
    return '\'$name\' has been reset';
  }

  @override
  String get undo => 'Undo';

  @override
  String get settings => 'Settings';

  @override
  String get separateRunningStoppedSetting =>
      'In sort criterion by \"Longest Time / Lap Time\", do you want to have the stopped stopwatches at the bottom?';

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
  String get themeMode => 'Theme:';

  @override
  String get themeModeSystem => 'Auto (System)';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeDark => 'Dark';

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
  String get allStopwatchesReset => 'All stopwatches have been reset';

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

  @override
  String get delimiterComma => 'Comma ,';

  @override
  String get delimiterSemicolon => 'Semicolon ;';

  @override
  String get delimiterSpace => 'Space';

  @override
  String get tncTitle => 'Terms and Conditions for MultiStopwatches';

  @override
  String get tncLastUpdated => 'Last updated: 29.12.2025';

  @override
  String get tncIntro =>
      'Please read these terms and conditions (\"terms\") carefully before using the MultiStopwatches web application (\"service\") operated by Josua B. (\"us\", \"we\", or \"our\").';

  @override
  String get tncTermsOfUseTitle => 'Terms of Use';

  @override
  String get tncTermsOfUse =>
      'By accessing or using the web application, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You\'re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You\'re not allowed to make derivative versions of the app. The app itself, and all the trademarks, copyright, and other intellectual property rights related to it, belong to Josua B.';

  @override
  String get tncServicePricingTitle => 'Service and Pricing';

  @override
  String get tncServicePricing =>
      'MultiStopwatches is currently provided free of charge as a web application. We reserve the right to introduce optional donation features or change the pricing model in the future, with prior notice to users.';

  @override
  String get tncYourResponsibilitiesTitle => 'Your Responsibilities';

  @override
  String get tncYourResponsibilities =>
      'You are responsible for ensuring that your browser is compatible with the web application. An internet connection is required to initially load the application. If you install the app as a Progressive Web App (PWA), it can be used offline after the initial load. All your data is stored locally in your browser\'s storage and is your responsibility to backup if needed.';

  @override
  String get tncDataStorageTitle => 'Data Storage';

  @override
  String get tncDataStorage =>
      'All application data is stored exclusively in your browser\'s local storage. No data is transmitted to or stored on our servers. You are responsible for your own data management, including backups. Clearing your browser data will delete all application data.';

  @override
  String get tncLimitationLiabilityTitle => 'Limitation of Liability';

  @override
  String get tncLimitationLiability =>
      'Josua B is not responsible for any direct, indirect, incidental, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the service. We do not warrant that:';

  @override
  String get tncLimitationLiabilityPoint1 =>
      '•the service will function uninterrupted, secure or available at any particular time or location;';

  @override
  String get tncLimitationLiabilityPoint2 =>
      '•any errors or defects will be corrected;';

  @override
  String get tncLimitationLiabilityPoint3 =>
      '•the service is free of viruses or other harmful components;';

  @override
  String get tncLimitationLiabilityPoint4 =>
      '•your data stored in browser storage will be preserved (you are responsible for backups).';

  @override
  String get tncGoverningLawTitle => 'Governing Law';

  @override
  String get tncGoverningLaw =>
      'These terms shall be governed by and construed in accordance with the laws of Switzerland, without regard to its conflict of law provisions.';

  @override
  String get tncChangesTitle => 'Changes to These Terms and Conditions';

  @override
  String get tncChanges =>
      'We reserve the right to modify these terms at any time. We will notify you of any changes by updating the \"Last updated\" date. Your continued use of the app after any such changes constitutes your acceptance of the new terms.';

  @override
  String get tncContactTitle => 'Contact Us';

  @override
  String get tncContact =>
      'If you have any questions about these Terms and Conditions, please contact us at:';

  @override
  String get ppTitle => 'Privacy Policy for MultiStopwatches';

  @override
  String get ppLastUpdated => 'Last updated: 29.12.2025';

  @override
  String get ppIntro =>
      'Thank you for choosing to use MultiStopwatches. We take your privacy seriously and are committed to protecting it. This privacy policy explains how we handle information in relation to the MultiStopwatches web application.';

  @override
  String get ppInfoCollectTitle => 'Information We Collect and Store';

  @override
  String get ppInfoCollect =>
      'MultiStopwatches does not collect, transmit, or store any personal data on external servers. The application stores all user data (including stopwatch configurations, recordings, and settings) exclusively in your browser\'s local storage (localStorage/IndexedDB). This data never leaves your device and is not transmitted to us or any third party.';

  @override
  String get ppInternetTitle => 'Internet Connection';

  @override
  String get ppInternet =>
      'An internet connection is required only to initially load the web application. Once loaded, or if installed as a Progressive Web App (PWA), the application can function completely offline. No data is transmitted during usage, whether online or offline.';

  @override
  String get ppCookiesTitle => 'Cookies and Tracking';

  @override
  String get ppCookies =>
      'MultiStopwatches does not use cookies, analytics, tracking scripts, or any other data collection technologies. We do not track your usage or collect any information about how you use the application.';

  @override
  String get ppDataSecurityTitle => 'Data Security and Control';

  @override
  String get ppDataSecurity =>
      'Your data is stored locally in your browser\'s storage and remains under your complete control. You can delete all application data at any time by clearing your browser\'s storage or cache. We recommend backing up important data, as we have no access to or copies of your data and cannot recover it if lost.';

  @override
  String get ppYourRightsTitle => 'Your Rights';

  @override
  String get ppYourRights =>
      'Since all data is stored locally on your device and no data is collected by us, you have complete control over your information. You can access, modify, export, or delete your data at any time through the application or your browser settings. We do not process any personal data, so GDPR data subject requests are not applicable.';

  @override
  String get ppThirdPartyTitle => 'Third-Party Services';

  @override
  String get ppThirdParty =>
      'MultiStopwatches does not integrate with or share data with any third-party services, analytics platforms, or external APIs.';

  @override
  String get ppChangesTitle => 'Changes to This Privacy Policy';

  @override
  String get ppChanges =>
      'We may update our Privacy Policy from time to time. We will notify you of any changes by updating the \"Last updated\" date on this page. You are advised to review this Privacy Policy periodically for any changes.';

  @override
  String get ppContactTitle => 'Contact Us';

  @override
  String get ppContact =>
      'If you have any questions about this Privacy Policy, please contact us at:';

  @override
  String get dataLoadErrorTitle => 'Data Loading Error';

  @override
  String dataLoadErrorMessage(int count) {
    return 'Could not load $count recording(s) due to corrupted data. These recordings have been skipped and won\'t appear in your list.';
  }

  @override
  String get dataLoadErrorContactDev =>
      'If this problem persists, please contact the developer:';

  @override
  String get emailCopied => 'Email copied to clipboard';

  @override
  String get exportFailed => 'Export failed. Please try again.';

  @override
  String get exportFailedBrowser =>
      'Export failed. Browser blocked the download.';

  @override
  String get exportFailedShare => 'Export failed. Could not share the file.';

  @override
  String get exportFailedEncoding =>
      'Export failed. Data could not be encoded.';

  @override
  String get exportCancelled => 'Export was cancelled.';

  @override
  String get noGroupsHint =>
      'To get started, please add a group. You can then create stopwatches within that group.';
}
