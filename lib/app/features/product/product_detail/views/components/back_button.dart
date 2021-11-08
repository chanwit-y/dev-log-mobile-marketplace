part of product_detail;

class _BackButton extends StatelessWidget {
  const _BackButton({Key? key, required this.onPressed,}) : super(key: key);

final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(FontAwesomeIcons.chevronLeft),
      onPressed: onPressed,
      size: 40,
      borderRadius: 10,
      tooltip: "back",
    );
  }
}
