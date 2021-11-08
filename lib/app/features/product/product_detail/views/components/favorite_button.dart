part of product_detail;

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton(
      {Key? key, required this.initial, required this.onChanged})
      : super(key: key);

  final bool initial;
  final Function(bool isFavorite) onChanged;

  @override
  Widget build(BuildContext context) {
    final RxBool isFavorite = RxBool(initial);

    return Obx(() => CustomIconButton(
          icon: Icon(FontAwesomeIcons.solidStar,
              color: isFavorite.value
                  ? Colors.white
                  : Theme.of(context).iconTheme.color),
          onPressed: () {
            isFavorite.toggle();
            onChanged(isFavorite.value);
          },
          color: isFavorite.value ? Theme.of(context).primaryColor : null,
          size: 40,
          borderRadius: 10,
          tooltip: "favorite",
        ));
  }
}
