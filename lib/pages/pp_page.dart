import 'package:flutter/material.dart';
import 'package:multistopwatches/config/app_config.dart';

class PPPage extends StatelessWidget {
  const PPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy for MultiStopwatches",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text("Last updated: 27.04.2024"),
              Text(
                  "Thank you for choosing to use the app MultiStopwatches. We take your privacy seriously and are committed to protecting it. This privacy policy explains how we handle information in relation to the app MultiStopwatches."),
              Text(
                "Information We Collect",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "The app MultiStopwatches is an offline application that does not collect or store any personal data from its users. As an offline app, it does not require internet access and does not have the capability to transmit data externally."),
              Text(
                "How We Use Information",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "Since we do not collect any personal information, there is no use of data to describe in this section."),
              Text(
                "Data Security",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "The app MultiStopwatches is designed to operate without storing or transmitting data, ensuring that your use of the app remains private and secure."),
              Text(
                "Changes to This Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes."),
              Text(
                "Contact Us",
                style: TextStyle(fontWeight: FontWeight.bold, height: 2),
              ),
              Text(
                  "If you have any questions about this Privacy Policy, please contact us at:"),
              SelectableText(AppConfig.contactEmail),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
