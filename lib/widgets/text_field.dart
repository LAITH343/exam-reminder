import 'package:exam_reminder/localization/app_localizations.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputField extends StatefulWidget {
  CustomInputField({
    required this.controller,
    required this.helpText,
    super.key,
  });

  TextEditingController controller;
  final String helpText;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool tapped = false;
  String? get checkEmpty {
    if (!tapped) {
      return null;
    }
    if (widget.controller.text.isEmpty) {
      return AppLocalizations.of(context)!.textFiledRequiredErrorText;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.helpText,
              errorText: checkEmpty,
            ),
            onChanged: (value) {
              if (!tapped) {
                tapped = true;
              }
              setState(() {});
            },
            onTap: () {
              tapped = true;
              setState(() {});
            },
          ),
        )
      ],
    );
  }
}
