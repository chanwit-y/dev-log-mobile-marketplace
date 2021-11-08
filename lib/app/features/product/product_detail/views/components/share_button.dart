part of product_detail;

class _ShareButton extends StatelessWidget {
  const _ShareButton({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icon(FontAwesomeIcons.share),
      onPressed: onPressed,
      size: 40,
      borderRadius: 10,
      tooltip: "share",
    );
  }
}
