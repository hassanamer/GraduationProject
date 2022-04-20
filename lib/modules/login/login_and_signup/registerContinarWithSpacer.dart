import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

class registerContinarWithSpacer extends StatelessWidget {
  String text;

  registerContinarWithSpacer(this.text);
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: text,
                  ),
                  cursorWidth: 15,
                  showCursor: false,
                )),
            const Spacer(),
            const Icon(
              Icons.arrow_drop_down,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
      const SizedBox(
        height: 12,
      )
    ]);
  }
}
