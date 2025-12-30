import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class DeleteGroupDialog extends StatefulWidget {
  final void Function() onAccept;
  final String name;

  const DeleteGroupDialog(this.name, {required this.onAccept, super.key});

  @override
  State<DeleteGroupDialog> createState() => _DeleteGroupDialogState();
}

class _DeleteGroupDialogState extends State<DeleteGroupDialog> {
  bool confirmed = false;
  bool red = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.deleteGroupTitle(widget.name)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Checkbox(
                value: confirmed,
                onChanged: (bool? value) {
                  confirmed = value ?? false;
                  setState(() {});
                },
              ),
              SizedBox(
                width: 180,
                child: Text(
                  AppLocalizations.of(context)!.areYouSureCannotUndo,
                ),
              )
            ],
          ),
          red
              ? Text(
                  AppLocalizations.of(context)!.youHaveToCheckBox,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                )
              : Container(),
          //Container(),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context)!.confirm),
          onPressed: () {
            if (confirmed) {
              widget.onAccept();
              Navigator.of(context).pop();
            } else {
              // show little red text or make checkbox red
              red = true;
              setState(() {});
            }
          },
        ),
      ],
    );
  }
}
