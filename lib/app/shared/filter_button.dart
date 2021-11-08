import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_marketplace/app/shared/custom_icon_button.dart';

class FilterButton extends StatelessWidget {
  final double size;
  final Function() onPressed;

  const FilterButton({
    required this.onPressed,
    this.size = 60,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(
        FontAwesomeIcons.slidersH,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: this.onPressed,
      // color: Colors.red,
      size: this.size,
      tooltip: 'filter',
    );
  }
}
