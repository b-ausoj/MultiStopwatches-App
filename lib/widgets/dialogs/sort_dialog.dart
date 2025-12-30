import 'package:flutter/material.dart';
import 'package:multistopwatches/enums/sort_criterion.dart';
import 'package:multistopwatches/enums/sort_direction.dart';
import 'package:multistopwatches/l10n/app_localizations.dart';

class SortDialog extends StatefulWidget {
  final SortCriterion initialCriterion;
  final SortDirection initialDirection;
  final void Function(SortCriterion, SortDirection) onValueChange;

  const SortDialog(
      this.initialCriterion, this.initialDirection, this.onValueChange,
      {super.key});

  @override
  State<SortDialog> createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  late SortCriterion _selectedCriterion = widget.initialCriterion;
  late SortDirection _selectedDirection = widget.initialDirection;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(AppLocalizations.of(context)!.changeSorting),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadioGroup<SortCriterion>(
              groupValue: _selectedCriterion,
              onChanged: (SortCriterion? value) {
                if (value == null) return;
                setState(() {
                  _selectedCriterion = value;
                });
                widget.onValueChange(_selectedCriterion, _selectedDirection);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: SortCriterion.values
                    .map((SortCriterion criterion) => RadioListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        title: Text(criterion.label(context)),
                        value: criterion))
                    .toList(),
              ),
            ),
            if (_selectedCriterion != SortCriterion.customReordable) ...[
              const Divider(),
              RadioGroup<SortDirection>(
                groupValue: _selectedDirection,
                onChanged: (SortDirection? value) {
                  if (value == null) return;
                  setState(() {
                    _selectedDirection = value;
                  });
                  widget.onValueChange(_selectedCriterion, _selectedDirection);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: SortDirection.values
                      .map((SortDirection direction) => RadioListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          title: Text(direction.label(context)),
                          value: direction))
                      .toList(),
                ),
              ),
            ] else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.customSortExplanation,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ));
  }
}
