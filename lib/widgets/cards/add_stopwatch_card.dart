import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddStopwatchCard extends StatelessWidget {
  final void Function() addStopwatch;

  const AddStopwatchCard(this.addStopwatch, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFEFEFEF),
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 4),
      child: InkWell(
        onTap: () {
          addStopwatch();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.addStopwatch,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
              const Spacer(),
              const Icon(Icons.add)
            ],
          ),
        ),
      ),
    );
  }
}
