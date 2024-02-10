import 'package:flutter/material.dart';
import 'package:travel_buddy/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final String? text;
  final IconData? icon;
  final Color backGroundColor;
  final double size;
  final Color borderColor;
  final bool isIcon;

  AppButton({
    Key? key,
    this.icon,
    this.text,
    this.isIcon = false,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
        color: backGroundColor,
      ),
      child: isIcon
          ? Center(
        child: Icon(
          icon,
          color: color,
        ),
      )
          : Center(
        child: AppText(
          text: text ?? '', // Handling null text
          color: color,
        ),
      ),
    );
  }
}
