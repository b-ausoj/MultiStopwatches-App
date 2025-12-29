import 'package:flutter/material.dart';

// TODO: Localize strings
// TODO: this dialog is used for renaming stopwatches and groups, but text says "Rename stopwatch" only. Fix that (pass the title as parameter? or make two classes?)
// TODO: add validation (non-empty name, unique name?)
class RenameDialog extends StatefulWidget {
  final String initialName;
  final void Function(String) onAccept;

  const RenameDialog(this.initialName, this.onAccept, {super.key});

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
      title: const Text("Rename stopwatch"),
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
          child: const Text("CANCEL"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            widget.onAccept(_controller.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
