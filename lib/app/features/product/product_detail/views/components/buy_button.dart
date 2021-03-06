part of product_detail;

class _BuyButton extends StatelessWidget {
  const _BuyButton({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text("Buy Now"),
      ),
    );
  }
}
