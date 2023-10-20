import 'package:exam_reminder/global_methods.dart';
import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    required this.onDateSelected,
    required this.controller,
    required this.helpText,
    super.key,
  });

  final void Function(DateTime? value) onDateSelected;
  final TextEditingController controller;
  final String helpText;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  bool tapped = false;
  String? get checkFormat {
    if (!tapped) {
      return null;
    }
    if (widget.controller.text.isEmpty) {
      return AppLocalizations.of(context)!.textFiledRequiredErrorText;
    }
    if (!isDateValid(widget.controller.text.split('-'))) {
      return AppLocalizations.of(context)!.datePickerWrongFormat;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: TextFormField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: widget.controller,
              onTap: () {
                if (!tapped) {
                  tapped = true;
                }
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: widget.helpText,
                errorText: checkFormat,
              ),
              onChanged: (value) {
                List<String> sdate = widget.controller.text.split('-');
                if (isDateValid(sdate)) {
                  widget.onDateSelected(
                    DateTime(
                      int.parse(sdate[0]),
                      int.parse(sdate[1]),
                      int.parse(sdate[2]),
                    ),
                  );
                }
                setState(() {});
              },
            ),
          ),
          IconButton(
            onPressed: () async {
              if (await onSelectDatePressed(
                context,
                widget.onDateSelected,
                widget.controller,
              )) {
                setState(() {});
              }
            },
            icon: const Icon(Icons.date_range),
          ),
        ],
      ),
    );
  }
}
