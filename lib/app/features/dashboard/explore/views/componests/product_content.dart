part of explore;

class _ProductContent extends StatelessWidget {
  const _ProductContent(this.data, {Key? key, required this.onPressed})
      : super(key: key);

  final List<Product> data;
  final Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 4,
        itemCount: data.length,
        itemBuilder: (context, index) => ProductCard(
          heroTag: data[index].id,
          data: ProductCardData(
            image: data[index].images[0],
            name: data[index].name,
            price: data[index].price,
            initialFavorite: data[index].isFavorite,
          ),
          onTap: () => onPressed(data[index]),
        ),
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
