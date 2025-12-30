import 'package:flutter/material.dart';
import 'package:multistopwatches/pages/pp_page.dart';
import 'package:multistopwatches/pages/tnc_page.dart';
import 'package:multistopwatches/services/launch_url_service.dart';
import 'package:multistopwatches/utils/snackbar_utils.dart';
import 'package:multistopwatches/widgets/icons/back_icon.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';
import 'package:multistopwatches/config/app_config.dart';

class AboutPage extends StatelessWidget {
  final bool isBadgeVisible;
  const AboutPage(this.isBadgeVisible, {super.key});

  Future<void> getVersionNumber(BuildContext context) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String appVersion = packageInfo.version;
    final String appBuildNumber = packageInfo.buildNumber;
    if (context.mounted) {
      showShortSnackBar(
          context,
          AppLocalizations.of(context)!
              .appVersionMessage(appVersion, appBuildNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about),
        leading: BackIcon(isBadgeVisible),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            InkWell(
                borderRadius: BorderRadius.circular(12.0),
                onTap: () => getVersionNumber(context),
                splashColor: Colors.white10,
                child: Ink.image(
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    image: const AssetImage("assets/images/rect39.png"))),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                AppLocalizations.of(context)!.aboutPageDescription,
                textAlign: TextAlign.center,
              ),
            ),
            SelectableText(AppConfig.contactEmail),
            const SizedBox(height: 16.0),
            TextButton.icon(
                onPressed: () => launchMailApp(),
                icon: const Icon(Icons.rate_review_outlined),
                label: Text(AppLocalizations.of(context)!.contactMe),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFEFEFEF),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0))),
            // const SizedBox(height: 16.0),
            // TextButton.icon(
            //     onPressed: () => showShortSnackBar(
            //         context, AppLocalizations.of(context)!.pleaseAddToStore),
            //     icon: const Icon(Icons.star_border_outlined),
            //     label: Text(AppLocalizations.of(context)!.rateThisApp),
            //     style: TextButton.styleFrom(
            //         foregroundColor: Colors.black,
            //         backgroundColor: const Color(0xFFEFEFEF),
            //         padding: const EdgeInsets.symmetric(horizontal: 16.0))),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Text(AppLocalizations.of(context)!.termsAndConditions),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TnCPage()));
                  },
                ),
                const Text("|"),
                InkWell(
                  child: Text(AppLocalizations.of(context)!.privacyPolicy),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PPPage()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
