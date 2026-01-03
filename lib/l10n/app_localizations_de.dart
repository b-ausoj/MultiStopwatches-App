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
  String get renameStopwatch => 'Stoppuhr umbenennen';

  @override
  String get renameGroup => 'Gruppe umbenennen';

  @override
  String get renameRecording => 'Aufzeichnung umbenennen';

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
  String get separateRunningStoppedSetting =>
      'Beim Sortierkriterium nach \"Längste Zeit/Rundenzeit\", möchtest du die gestoppten Stoppuhren zu unterst haben?';

  @override
  String get defaultSortCriterion => 'Standard Sortierkriterium:';

  @override
  String get defaultSortDirection => 'Standard Sortierrichtung:';

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
  String get themeMode => 'Design:';

  @override
  String get themeModeSystem => 'Automatisch (System)';

  @override
  String get themeModeLight => 'Hell';

  @override
  String get themeModeDark => 'Dunkel';

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
  String get termsAndConditions => 'AGBs';

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

  @override
  String fromGroup(String groupName) {
    return 'von $groupName';
  }

  @override
  String get allRecordingsDeleted => 'Alle Aufzeichnungen wurden gelöscht';

  @override
  String get recordingDeleted => 'Aufzeichnung wurde gelöscht';

  @override
  String get recordingsDeleted => 'Aufzeichnungen wurden gelöscht';

  @override
  String deleteGroupTitle(String name) {
    return '$name löschen';
  }

  @override
  String get areYouSureCannotUndo =>
      'Bist du sicher? Das kann nicht rückgängig gemacht werden';

  @override
  String get youHaveToCheckBox => 'Du musst das Kästchen ankreuzen';

  @override
  String get cancel => 'ABBRECHEN';

  @override
  String get ok => 'OK';

  @override
  String get confirm => 'BESTÄTIGEN';

  @override
  String get changeSorting => 'Sortierung ändern';

  @override
  String get sortByName => 'Name';

  @override
  String get sortByLongestTime => 'Längste Zeit';

  @override
  String get sortByLongestLapTime => 'Längste Rundenzeit';

  @override
  String get sortByCustom => 'Benutzerdefiniert';

  @override
  String get sortAscending => 'Aufsteigend';

  @override
  String get sortDescending => 'Absteigend';

  @override
  String get customSortExplanation =>
      'Ziehe Stoppuhren, um sie manuell neu anzuordnen';

  @override
  String athleteNumber(int number) {
    return 'Athlet $number';
  }

  @override
  String get cantDeleteWhileRunning => 'Kann nicht löschen während läuft';

  @override
  String get allStopwatchesRemoved => 'Alle Stoppuhren wurden entfernt';

  @override
  String stopwatchRemoved(String name) {
    return '\'$name\' wurde entfernt';
  }

  @override
  String get allStopwatchesReseted => 'Alle Stoppuhren wurden zurückgesetzt';

  @override
  String get hereIsYourRecording => 'Hier ist deine Aufzeichnung!';

  @override
  String get totalTime => 'Gesamtzeit';

  @override
  String get lapNo => 'Runde Nr.';

  @override
  String get nameCannotBeEmpty => 'Name darf nicht leer sein';

  @override
  String get nameAlreadyExists => 'Name existiert bereits';

  @override
  String get delimiterComma => 'Komma ,';

  @override
  String get delimiterSemicolon => 'Semikolon ;';

  @override
  String get delimiterSpace => 'Leerzeichen';

  @override
  String get tncTitle => 'Allgemeine Geschäftsbedingungen für MultiStopwatches';

  @override
  String get tncLastUpdated => 'Letzte Aktualisierung: 29.12.2025';

  @override
  String get tncIntro =>
      'Bitte lies diese Allgemeinen Geschäftsbedingungen (\"Bedingungen\") sorgfältig durch, bevor du die MultiStopwatches-Webanwendung (\"Dienst\") verwendest, die von Josua B. (\"uns\", \"wir\" oder \"unser\") betrieben wird.';

  @override
  String get tncTermsOfUseTitle => 'Nutzungsbedingungen';

  @override
  String get tncTermsOfUse =>
      'Durch den Zugriff auf oder die Nutzung der Webanwendung gelten diese Bedingungen automatisch für dich – du solltest sie daher sorgfältig lesen, bevor du die App verwendest. Es ist dir nicht gestattet, die App, Teile der App oder unsere Markenzeichen in irgendeiner Weise zu kopieren oder zu modifizieren. Es ist dir nicht gestattet, abgeleitete Versionen der App zu erstellen. Die App selbst sowie alle damit verbundenen Markenzeichen, Urheberrechte und andere geistige Eigentumsrechte gehören Josua B.';

  @override
  String get tncServicePricingTitle => 'Dienst und Preisgestaltung';

  @override
  String get tncServicePricing =>
      'MultiStopwatches wird derzeit kostenlos als Webanwendung bereitgestellt. Wir behalten uns das Recht vor, optionale Spendenfunktionen einzuführen oder das Preismodell in Zukunft zu ändern, mit vorheriger Benachrichtigung der Nutzer.';

  @override
  String get tncYourResponsibilitiesTitle => 'Deine Verantwortlichkeiten';

  @override
  String get tncYourResponsibilities =>
      'Du bist dafür verantwortlich, sicherzustellen, dass dein Browser mit der Webanwendung kompatibel ist. Eine Internetverbindung ist erforderlich, um die Anwendung anfänglich zu laden. Wenn du die App als Progressive Web App (PWA) installierst, kann sie nach dem ersten Laden offline verwendet werden. Alle deine Daten werden lokal im Speicher deines Browsers gespeichert und es liegt in deiner Verantwortung, sie bei Bedarf zu sichern.';

  @override
  String get tncDataStorageTitle => 'Datenspeicherung';

  @override
  String get tncDataStorage =>
      'Alle Anwendungsdaten werden ausschließlich im lokalen Speicher deines Browsers gespeichert. Es werden keine Daten an unsere Server übertragen oder dort gespeichert. Du bist für deine eigene Datenverwaltung verantwortlich, einschließlich Backups. Das Löschen deiner Browserdaten löscht alle Anwendungsdaten.';

  @override
  String get tncLimitationLiabilityTitle => 'Haftungsbeschränkung';

  @override
  String get tncLimitationLiability =>
      'Josua B ist nicht verantwortlich für direkte, indirekte, zufällige, Folge- oder Strafschäden, einschließlich, aber nicht beschränkt auf, Verlust von Gewinnen, Daten, Nutzung, Goodwill oder anderen immateriellen Verlusten, die sich aus deinem Zugriff auf oder der Nutzung von oder der Unfähigkeit, auf den Dienst zuzugreifen oder ihn zu nutzen, ergeben. Wir garantieren nicht, dass:';

  @override
  String get tncLimitationLiabilityPoint1 =>
      '•der Dienst ununterbrochen, sicher oder zu einem bestimmten Zeitpunkt oder an einem bestimmten Ort verfügbar sein wird;';

  @override
  String get tncLimitationLiabilityPoint2 =>
      '•Fehler oder Mängel korrigiert werden;';

  @override
  String get tncLimitationLiabilityPoint3 =>
      '•der Dienst frei von Viren oder anderen schädlichen Komponenten ist;';

  @override
  String get tncLimitationLiabilityPoint4 =>
      '•deine im Browser-Speicher gespeicherten Daten erhalten bleiben (du bist für Backups verantwortlich).';

  @override
  String get tncGoverningLawTitle => 'Anwendbares Recht';

  @override
  String get tncGoverningLaw =>
      'Diese Bedingungen unterliegen den Gesetzen der Schweiz und werden nach diesen ausgelegt, ohne Berücksichtigung von Kollisionsnormen.';

  @override
  String get tncChangesTitle =>
      'Änderungen dieser Allgemeinen Geschäftsbedingungen';

  @override
  String get tncChanges =>
      'Wir behalten uns das Recht vor, diese Bedingungen jederzeit zu ändern. Wir werden dich über Änderungen informieren, indem wir das Datum \"Letzte Aktualisierung\" aktualisieren. Deine fortgesetzte Nutzung der App nach solchen Änderungen stellt deine Zustimmung zu den neuen Bedingungen dar.';

  @override
  String get tncContactTitle => 'Kontakt';

  @override
  String get tncContact =>
      'Wenn du Fragen zu diesen Allgemeinen Geschäftsbedingungen hast, kontaktiere uns bitte unter:';

  @override
  String get ppTitle => 'Datenschutzerklärung für MultiStopwatches';

  @override
  String get ppLastUpdated => 'Letzte Aktualisierung: 29.12.2025';

  @override
  String get ppIntro =>
      'Vielen Dank, dass du dich für MultiStopwatches entschieden hast. Wir nehmen deine Privatsphäre ernst und verpflichten uns, sie zu schützen. Diese Datenschutzerklärung erklärt, wie wir mit Informationen in Bezug auf die MultiStopwatches-Webanwendung umgehen.';

  @override
  String get ppInfoCollectTitle =>
      'Informationen, die wir sammeln und speichern';

  @override
  String get ppInfoCollect =>
      'MultiStopwatches sammelt, überträgt oder speichert keine persönlichen Daten auf externen Servern. Die Anwendung speichert alle Benutzerdaten (einschließlich Stoppuhr-Konfigurationen, Aufzeichnungen und Einstellungen) ausschließlich im lokalen Speicher deines Browsers (localStorage/IndexedDB). Diese Daten verlassen niemals dein Gerät und werden nicht an uns oder Dritte übermittelt.';

  @override
  String get ppInternetTitle => 'Internetverbindung';

  @override
  String get ppInternet =>
      'Eine Internetverbindung ist nur erforderlich, um die Webanwendung anfänglich zu laden. Sobald sie geladen ist oder als Progressive Web App (PWA) installiert wurde, kann die Anwendung vollständig offline funktionieren. Während der Nutzung werden keine Daten übertragen, weder online noch offline.';

  @override
  String get ppCookiesTitle => 'Cookies und Tracking';

  @override
  String get ppCookies =>
      'MultiStopwatches verwendet keine Cookies, Analytics, Tracking-Skripte oder andere Datenerfassungstechnologien. Wir verfolgen deine Nutzung nicht und sammeln keine Informationen darüber, wie du die Anwendung verwendest.';

  @override
  String get ppDataSecurityTitle => 'Datensicherheit und Kontrolle';

  @override
  String get ppDataSecurity =>
      'Deine Daten werden lokal im Speicher deines Browsers gespeichert und bleiben unter deiner vollständigen Kontrolle. Du kannst alle Anwendungsdaten jederzeit löschen, indem du den Speicher oder Cache deines Browsers löschst. Wir empfehlen, wichtige Daten zu sichern, da wir keinen Zugriff auf deine Daten haben oder Kopien davon besitzen und sie nicht wiederherstellen können, wenn sie verloren gehen.';

  @override
  String get ppYourRightsTitle => 'Deine Rechte';

  @override
  String get ppYourRights =>
      'Da alle Daten lokal auf deinem Gerät gespeichert werden und keine Daten von uns erfasst werden, hast du die vollständige Kontrolle über deine Informationen. Du kannst deine Daten jederzeit über die Anwendung oder deine Browsereinstellungen einsehen, ändern, exportieren oder löschen. Wir verarbeiten keine persönlichen Daten, daher sind DSGVO-Betroffenenanfragen nicht anwendbar.';

  @override
  String get ppThirdPartyTitle => 'Dienste von Drittanbietern';

  @override
  String get ppThirdParty =>
      'MultiStopwatches integriert keine Dienste von Drittanbietern und teilt keine Daten mit Analyseplattformen oder externen APIs.';

  @override
  String get ppChangesTitle => 'Änderungen dieser Datenschutzerklärung';

  @override
  String get ppChanges =>
      'Wir können unsere Datenschutzerklärung von Zeit zu Zeit aktualisieren. Wir werden dich über Änderungen informieren, indem wir das Datum \"Letzte Aktualisierung\" auf dieser Seite aktualisieren. Es wird empfohlen, diese Datenschutzerklärung regelmäßig auf Änderungen zu überprüfen.';

  @override
  String get ppContactTitle => 'Kontakt';

  @override
  String get ppContact =>
      'Wenn du Fragen zu dieser Datenschutzerklärung hast, kontaktiere uns bitte unter:';
}
