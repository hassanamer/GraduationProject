import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class RegisterContainer extends StatelessWidget {
  String text;
  late String path;
  RegisterContainer(
    this.text,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: text),
              cursorWidth: 2,
            ))
          ],
        ),
      ),
      const SizedBox(
        height: 12,
      )
    ]);
  }
}
