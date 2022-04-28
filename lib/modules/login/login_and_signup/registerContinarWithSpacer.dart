import 'package:flutter/material.dart';

class registerContinarWithSpacer extends StatelessWidget {
  String text;

  registerContinarWithSpacer(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: text,
                    ),
                    cursorWidth: 15,
                    showCursor: false,
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
