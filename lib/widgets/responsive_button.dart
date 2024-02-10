import 'package:flutter/material.dart';
import 'package:travel_buddy/utils/app_color.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  String? text;

  ResponsiveButton(
      {super.key,
      required this.width,
      this.isResponsive = false,
      this.text = "Book trip now"});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.mainColor),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Text(
                  text!,
                  style: const TextStyle(color: Colors.white),
                )
              : Container(),
          const Icon(
            Icons.keyboard_double_arrow_right_rounded,
            color: Colors.white54,
            size: 22,
          ),
        ],
      ),
    );
  }
}
