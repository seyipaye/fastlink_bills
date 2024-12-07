import 'package:fastlink_app/presentation/utils/constants.dart';
import 'package:fastlink_app/presentation/utils/strings.dart';
import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/styles/text_size.dart';

class VisibilityToggleText extends StatefulWidget {
  final String text;
  final bool initiallyVisible;

  const VisibilityToggleText({
    Key? key,
    required this.text,
    this.initiallyVisible = false,
  }) : super(key: key);

  @override
  _VisibilityToggleTextState createState() => _VisibilityToggleTextState();
}

class _VisibilityToggleTextState extends State<VisibilityToggleText> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = widget.initiallyVisible;
  }

  String get getStars {
    int length = widget.text.length;

    return '*' * (length - 2);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _isVisible
              ? Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: kRaleway500,
                  ),
                )
              : Text(
                  getStars,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: kRaleway500,
                    height: kLineHeight(50, fontSize: 40),
                  ),
                ),
          Gap(20),
          Container(
            height: 20,
            width: 20,
            child: IconButton(
              iconSize: 16,
              padding: EdgeInsets.zero,
              icon: Icon(
                _isVisible ? Icons.visibility : Icons.visibility_off,
                color: FBColors.blackColor,
              ),
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
