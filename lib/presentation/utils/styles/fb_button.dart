import 'package:fastlink_app/presentation/utils/styles/extra_style.dart';
import 'package:flutter/material.dart';

class FBButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Widget? trailing; // New parameter for trailing widget
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;

  const FBButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
    this.trailing, // Initialize the new parameter
    this.color,
    this.textColor,
    this.height,
    this.width
  }) : outline = false, super(key: key);

  const FBButton.outline({
    Key? key,
    required this.title,
    this.onTap,
    this.leading,
    this.trailing, // Initialize the new parameter
    this.color,
    this.textColor,
    this.height,
    this.width
  })  : disabled = false,
        busy = false,
        outline = true, super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        )
            : BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: color!,
              width: 1,
            )),
        child: !busy
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) leading!,
            if (leading != null) const SizedBox(width: 5),
            Text(
              title,
              style: bodyStyle.copyWith(
                fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                color: textColor,
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 5),
              trailing!, // Display trailing widget if provided
            ],
          ],
        )
            : const CircularProgressIndicator(
          strokeWidth: 8,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}
