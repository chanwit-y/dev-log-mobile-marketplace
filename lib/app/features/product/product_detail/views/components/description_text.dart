part of product_detail;

class _Description extends StatelessWidget {
  const _Description(this.data, {Key? key}) : super(key: key);

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(data, style: TextStyle(
      color: kFontColorPallets[2],
      fontSize: 15,
    ));
  }
}
