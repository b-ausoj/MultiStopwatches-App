import 'package:flutter/material.dart';
import 'package:multistopwatches/config/app_config.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class TnCPage extends StatelessWidget {
  const TnCPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.termsAndConditions),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.tncTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncLastUpdated),
              Text(l10n.tncIntro),
              Text(
                l10n.tncTermsOfUseTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncTermsOfUse),
              Text(
                l10n.tncServicePricingTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncServicePricing),
              Text(
                l10n.tncYourResponsibilitiesTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncYourResponsibilities),
              Text(
                l10n.tncDataStorageTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncDataStorage),
              Text(
                l10n.tncLimitationLiabilityTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncLimitationLiability),
              Text(l10n.tncLimitationLiabilityPoint1),
              Text(l10n.tncLimitationLiabilityPoint2),
              Text(l10n.tncLimitationLiabilityPoint3),
              Text(l10n.tncLimitationLiabilityPoint4),
              Text(
                l10n.tncGoverningLawTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncGoverningLaw),
              Text(
                l10n.tncChangesTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncChanges),
              Text(
                l10n.tncContactTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(l10n.tncContact),
              const SelectableText(AppConfig.contactEmail),
              const SizedBox(height: 40.0)
            ],
          ),
        ),
      ),
    );
  }
}
