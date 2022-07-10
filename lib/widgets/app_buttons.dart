// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  String? text;
  IconData? icon;
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  bool? isIcon;

  AppButton({
    Key? key,
    this.text = '1',
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
