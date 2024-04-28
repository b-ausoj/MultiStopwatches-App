import 'package:flutter/material.dart';
import 'package:flutter_stopwatch_app_v1/pages/pp_page.dart';
import 'package:flutter_stopwatch_app_v1/pages/tnc_page.dart';
import 'package:flutter_stopwatch_app_v1/services/launch_url_service.dart';
import 'package:flutter_stopwatch_app_v1/utils/snackbar_utils.dart';
import 'package:flutter_stopwatch_app_v1/widgets/icons/back_icon.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatelessWidget {
  final bool isBadgeVisible;
  const AboutPage(this.isBadgeVisible, {super.key});

  Future<void> getVersionNumber(BuildContext context) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String appVersion = packageInfo.version;
    final String appBuildNumber = packageInfo.buildNumber;
    if (context.mounted) {
      showShortSnackBar(
          context, "Your app version is $appVersion+$appBuildNumber");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Hello, my name is Josua, and I'm a computer science student. In my free time, I work as a triathlon coach, and I found the need to simultaneously record the times of my athletes during track intervals or swim races. That's why I developed this app. \n\nIf you have any feedback, suggestions for improvement, or encounter any issues, please don't hesitate to let me know! \n\nYour input is greatly appreciated.",
                textAlign: TextAlign.center,
              ),
            ),
            const SelectableText("josua.bu@gmail.com"),
            const SizedBox(height: 16.0),
            TextButton.icon(
                onPressed: () => launchMailApp(),
                icon: const Icon(Icons.rate_review_outlined),
                label: const Text("Contact me"),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFEFEFEF),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0))),
            const SizedBox(height: 16.0),
            TextButton.icon(
                onPressed: () => showShortSnackBar(
                    context, "Please add the app to the store first!"),
                icon: const Icon(Icons.star_border_outlined),
                label: const Text("Rate this app"),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFEFEFEF),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0))),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: const Text("Terms & conditions"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TnCPage()));
                  },
                ),
                const Text("|"),
                InkWell(
                  child: const Text("Privacy policy"),
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
