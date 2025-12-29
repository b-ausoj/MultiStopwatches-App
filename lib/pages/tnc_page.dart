import 'package:flutter/material.dart';
import 'package:multistopwatches/config/app_config.dart';

class TnCPage extends StatelessWidget {
  const TnCPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms and Conditions for MultiStopwatches",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text("Last updated: 27.04.2024"),
              Text(
                  "Please read these terms and conditions (\"terms\") carefully before using the MultiStopwatches application (\"service\") operated by Josua B. (\"us\", \"we\", or \"our\")."),
              Text(
                "Terms of Use",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, and other intellectual property rights related to it, belong to Josua B."),
              Text(
                "Purchases",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "MultiStopwatches is available for a one-time fee of 5 CHF, payable through the Google Play App Store. The fee grants you a non-exclusive, non-transferable right to use the app on your device in accordance with these terms."),
              Text(
                "Your Responsibilitie",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "You are responsible for ensuring that your device meets the minimum system requirements of the app."),
              Text(
                "Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "Since MultiStopwatches does not collect or store any personal data, the app's functionality is outlined in our Privacy Policy."),
              Text(
                "Limitation of Liability",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "Josua B is not responsible for any direct, indirect, incidental, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the service. We do not warrant that:"),
              Text(
                  "\u2022the service will function uninterrupted, secure or available at any particular time or location;"),
              Text("\u2022any errors or defects will be corrected;"),
              Text(
                  "\u2022the service is free of viruses or other harmful components."),
              Text("Changes to This Terms and Conditions",
                  style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
              Text(
                  "We reserve the right to modify these terms at any time. Thus, you should check the terms regularly. Your continued use of the app after any such changes constitutes your acceptance of the new terms."),
              Text(
                "Contact Us",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "If you have any questions about this Privacy Policy, please contact us at:"),
              SelectableText(AppConfig.contactEmail),
              SizedBox(height: 40.0)
            ],
          ),
        ),
      ),
    );
  }
}
