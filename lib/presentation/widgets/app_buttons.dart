import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../core/extentions.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
// import 'package:skeletonizer/skeletonizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.title, this.onPressed});

  final String? title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        child: Text('OK'));
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.foregroundColor,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: kRoundedRectangularBorder(radius: 10),
        textStyle:
            TextStyle(fontSize: 16, height: kLineHeight(24, fontSize: 16)),
        foregroundColor: foregroundColor ?? AppColors.primary,
        minimumSize: Size(0, 0),
      ),
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width = 56,
  });

  final String text;
  final String? icon;
  final VoidCallback onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: kRoundedRectangularBorder(radius: 10),
        fixedSize: Size(0, width),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) SvgPicture.asset(icon!),
          if (icon != null) const Gap(8),
          Text(text),
        ],
      ),
      onPressed: onPressed,
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.width = 30,
    this.iconWidth = 20,
    required this.assetName,
    this.onPressed,
  });

  final double width;
  final double iconWidth;
  final String assetName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: width,
      child: IconButton(
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: ImageIcon2.asset(
          assetName,
          size: iconWidth,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class AppIconButton2 extends StatelessWidget {
  const AppIconButton2({
    super.key,
    this.width,
    this.iconWidth = 24,
    required this.assetName,
    this.onPressed,
  });

  final double? width;
  final double iconWidth;
  final String assetName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // return Skeleton.ignore(

    return Container(
      height: width ?? iconWidth + 20,
      width: width ?? iconWidth + 20,
      child: IconButton(
        iconSize: 10,
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        icon: Image.asset(
          assetName,
          width: iconWidth,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
