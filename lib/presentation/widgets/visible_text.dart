import 'package:fastlink_app/presentation/utils/styles/color.dart';
import 'package:flutter/material.dart';

class VisibilityToggleText extends StatefulWidget {
  final String text; 
  final TextStyle? textStyle; 
  final bool initiallyVisible; 

  const VisibilityToggleText({
    Key? key,
    required this.text,
    this.textStyle,
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _isVisible ? widget.text : '* * * *', 
          style: widget.textStyle ?? TextStyle(fontSize: 16), 
        ),
        IconButton(
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
      ],
    );
  }
}
