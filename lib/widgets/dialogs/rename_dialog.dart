import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class RenameDialog extends StatefulWidget {
  final String initialName;
  final String title;
  final void Function(String) onAccept;
  final List<String> existingNames;

  const RenameDialog(
      {required this.initialName,
      required this.title,
      required this.onAccept,
      this.existingNames = const [],
      super.key});

  @override
  State<RenameDialog> createState() => _RenameDialogState();
}

class _RenameDialogState extends State<RenameDialog> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  final isIOS = !kIsWeb && Platform.isIOS;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);

    _errorMessage = _validateName(widget.initialName);

    // Select all text after the widget is built and focused
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();

      // Only auto-select on non-iOS platforms because of Flutter bug on iOS:
      if (!isIOS) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: widget.initialName.length,
        );
      }
    });
  }

  String? _validateName(String value) {
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return AppLocalizations.of(context)!.nameCannotBeEmpty;
    }

    if (widget.existingNames.any((name) =>
        name.toLowerCase() == trimmed.toLowerCase() &&
        name.toLowerCase() != widget.initialName.toLowerCase())) {
      return AppLocalizations.of(context)!.nameAlreadyExists;
    }

    return null;
  }

  void _handleAccept() {
    if (_errorMessage == null) {
      widget.onAccept(_controller.text.trim());
      Navigator.of(context).pop();
    }
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
        autofocus: !isIOS,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: _errorMessage,
        ),
        controller: _controller,
        onChanged: (text) {
          setState(() {
            _errorMessage = _validateName(text);
          });
        },
        onSubmitted: (_) => _handleAccept(),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: _errorMessage == null ? _handleAccept : null,
          child: Text(AppLocalizations.of(context)!.ok),
        ),
      ],
    );
  }
}
