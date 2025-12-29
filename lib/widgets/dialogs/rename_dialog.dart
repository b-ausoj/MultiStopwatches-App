import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

// TODO: add validation (non-empty name, unique name?)
class RenameDialog extends StatefulWidget {
  final String initialName;
  final String title;
  final void Function(String) onAccept;

  const RenameDialog(
      {required this.initialName,
      required this.title,
      required this.onAccept,
      super.key});

  @override
  State<RenameDialog> createState() => _RenameDialogState();
}

class _RenameDialogState extends State<RenameDialog> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);

    // Select all text after the widget is built and focused
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: widget.initialName.length,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        focusNode: _focusNode,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        controller: _controller,
        onSubmitted: (_) {
          widget.onAccept(_controller.text);
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context)!.ok),
          onPressed: () {
            widget.onAccept(_controller.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
