// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get start => 'START';

  @override
  String get stop => 'STOPP';

  @override
  String get resume => 'WEITER';

  @override
  String get lap => 'RUNDE';

  @override
  String get rename => 'Umbenennen';

  @override
  String get save => 'Speichern';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get delete => 'Löschen';

  @override
  String get cantSaveWhileRunning => 'Kann nicht speichern während läuft';

  @override
  String get cantSaveEmptyStopwatch => 'Kann keine leere Stoppuhr speichern';

  @override
  String hasBeenSavedAndReseted(String name) {
    return '\'$name\' wurde gespeichert und zurückgesetzt';
  }

  @override
  String get undoReset => 'Zurücksetzen rückgängig';

  @override
  String get cantResetWhileRunning => 'Kann nicht zurücksetzen während läuft';

  @override
  String hasBeenReseted(String name) {
    return '\'$name\' wurde zurückgesetzt';
  }

  @override
  String get undo => 'Rückgängig';

  @override
  String get settings => 'Einstellungen';

  @override
  String get seperateRunningStoppedSetting =>
      'Beim Sortierkriterium \"nach längster (Runden-)Zeit\", möchtest du die gestoppten Stoppuhren unten haben?';

  @override
  String get defaultSortCriterion => 'Standard-Sortierkriterium:';

  @override
  String get defaultSortDirection => 'Standard-Sortierrichtung:';

  @override
  String get timeformatCsvExport => 'Zeitformat für .csv Export:';

  @override
  String get delimiterCsvFile => 'Trennzeichen für .csv Datei:';

  @override
  String get language => 'Sprache:';

  @override
  String get languageAuto => 'Automatisch (System)';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get multiStopwatches => 'MultiStopwatches';

  @override
  String get addNewGroup => 'Neue Gruppe hinzufügen';

  @override
  String get recordings => 'Aufzeichnungen';

  @override
  String get about => 'Über';

  @override
  String group(int number) {
    return 'Gruppe $number';
  }

  @override
  String get exportItem => 'Exportieren';

  @override
  String get exportAll => 'Alle exportieren';

  @override
  String get deleteAll => 'Alle löschen';

  @override
  String get deleteThisGroup => 'Diese Gruppe löschen';

  @override
  String get saveAll => 'Alle speichern';

  @override
  String get resetAll => 'Alle zurücksetzen';

  @override
  String get changeOrder => 'Reihenfolge ändern';

  @override
  String get exportGroup => 'Gruppe exportieren';

  @override
  String get deleteGroup => 'Gruppe löschen';

  @override
  String get aboutPageDescription =>
      'Hallo, mein Name ist Josua und ich bin Informatik-Student. In meiner Freizeit arbeite ich als Triathlon-Trainer und hatte das Bedürfnis, die Zeiten meiner Athleten bei Bahnintervallen oder Schwimmwettkämpfen gleichzeitig aufzuzeichnen. Deshalb habe ich diese App entwickelt. \n\nWenn du Feedback, Verbesserungsvorschläge hast oder auf Probleme stösst, zögere bitte nicht, mir Bescheid zu geben! \n\nDeine Rückmeldung wird sehr geschätzt.';

  @override
  String get contactMe => 'Kontaktiere mich';

  @override
  String get rateThisApp => 'Bewerte diese App';

  @override
  String get termsAndConditions => 'Allgemeine Geschäftsbedingungen';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String appVersionMessage(String version, String buildNumber) {
    return 'Deine App-Version ist $version+$buildNumber';
  }

  @override
  String get pleaseAddToStore => 'Bitte füge die App zuerst zum Store hinzu!';

  @override
  String get welcomeMessage => 'Willkommen zur MultiStopwatches App von Josua';

  @override
  String get startAll => 'ALLE STARTEN';

  @override
  String get addStopwatch => 'Stoppuhr hinzufügen';

  @override
  String get lapTime => 'Rundenzeit';

  @override
  String get splitTime => 'Zwischenzeit';
}
