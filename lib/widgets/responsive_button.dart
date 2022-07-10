// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResposive;
  final double? width;
  const ResponsiveButton({
    Key? key,
    this.isResposive = false,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResposive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: isResposive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResposive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: "Book Trip Now",
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Image.asset(
              'img/button-one.png',
            )
          ],
        ),
      ),
    );
  }
}
