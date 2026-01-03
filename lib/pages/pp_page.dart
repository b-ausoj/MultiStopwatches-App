import 'package:flutter/material.dart';
import 'package:multistopwatches/config/app_config.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class PPPage extends StatelessWidget {
  const PPPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(l10n.privacyPolicy),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.ppTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppLastUpdated),
              Text(l10n.ppIntro),
              Text(
                l10n.ppInfoCollectTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppInfoCollect),
              Text(
                l10n.ppInternetTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppInternet),
              Text(
                l10n.ppCookiesTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppCookies),
              Text(
                l10n.ppDataSecurityTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppDataSecurity),
              Text(
                l10n.ppYourRightsTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppYourRights),
              Text(
                l10n.ppThirdPartyTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppThirdParty),
              Text(
                l10n.ppChangesTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppChanges),
              Text(
                l10n.ppContactTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.ppContact),
              const SelectableText(AppConfig.contactEmail),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
