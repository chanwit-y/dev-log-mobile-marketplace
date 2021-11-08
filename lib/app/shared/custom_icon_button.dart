import 'package:flutter/material.dart';
import 'package:mobile_marketplace/app/constans/app_constants.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final double size;
  final double borderRadius;
  final String? tooltip;
  final Color? color;
  final Function() onPressed;

  const CustomIconButton(
      {required this.icon,
      required this.onPressed,
      this.size = 50,
      this.borderRadius = kBorderRadius,
      this.tooltip,
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.size,
      width: this.size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          this.borderRadius,
        ),
        child: Material(
          color: this.color ?? Theme.of(context).inputDecorationTheme.fillColor,
          child: IconButton(
            icon: this.icon,
            iconSize: size * .4,
            tooltip: tooltip,
            onPressed: this.onPressed,
          ),
        ),
      ),
    );
  }
}
