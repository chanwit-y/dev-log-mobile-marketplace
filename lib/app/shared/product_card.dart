import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_marketplace/app/constans/app_constants.dart';
import 'package:mobile_marketplace/app/utils/ui/ui_utils.dart';

class ProductCardData {
  final ImageProvider image;
  final double price;
  final String name;
  final bool initialFavorite;

  const ProductCardData({
    required this.image,
    required this.price,
    required this.name,
    required this.initialFavorite,
  });
}

class ProductCard extends StatelessWidget {
  final ProductCardData data;
  final Function()? onTap;
  final String heroTag;

  const ProductCard({required this.data, required this.heroTag, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: heroTag,
          child: GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  _buildImage(data.image),
                  _buildFavorite(
                    data.initialFavorite,
                    onChanged: (isFavorite) {
                      AppSnackbar.showStatusFavoriteProduc(
                          productImage: data.image,
                          productName: data.name,
                          isFavorite: isFavorite);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: kSpacing,
        ),
        _buildPriceText(data.price),
        _buildNameProduct(data.name),
      ],
    );
  }

  Widget _buildImage(ImageProvider image) {
    return Image(
      image: image,
      fit: BoxFit.cover,
    );
  }

  Widget _buildFavorite(bool initialFavorite,
      {required Function(bool isFavorite) onChanged}) {
    RxBool isFavorite = RxBool(initialFavorite);

    Color activeColor = Theme.of(Get.context!).primaryColor;
    Color? passiveColor = Theme.of(Get.context!).iconTheme.color;

    return Obx(
      () => Material(
        color: isFavorite.value ? activeColor : passiveColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kBorderRadius),
        ),
        child: Container(
          width: 40,
          height: 40,
          child: InkWell(
            onTap: () {
              isFavorite.toggle();
              onChanged(isFavorite.value);
            },
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceText(double price) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.dollarSign,
          size: 14,
          color: kFontColorPallets[0],
        ),
        Expanded(
          child: Text(
            "$price",
            style: TextStyle(
              color: kFontColorPallets[0],
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildNameProduct(String name) {
    return Text(
      name,
      style: TextStyle(
        color: kFontColorPallets[2],
      ),
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
