library product_detail;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_marketplace/app/constans/app_constants.dart';
import 'package:mobile_marketplace/app/shared/custom_icon_button.dart';
import 'package:mobile_marketplace/app/shared/indicator.dart';
import 'package:mobile_marketplace/app/utils/services/rest_api_service.dart';
import 'package:mobile_marketplace/app/utils/ui/ui_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

part '../../bindings/product_detail_binding.dart';

part '../../controllers/product_detail_controller.dart';

part '../components/body_content.dart';
part '../components/product_image.dart';
part '../components/favorite_button.dart';
part '../components/back_button.dart';
part '../components/share_button.dart';
part '../components/price_text.dart';
part '../components/views_text.dart';
part '../components/name_text.dart';
part '../components/rating.dart';
part '../components/reviews_text.dart';
part '../components/description_text.dart';
part '../components/buy_button.dart';
part '../components/chat_button.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>
            (controller.data.value == null || controller.dataUser.value == null)
                ? Text("Product or User not found")
                : _buildProductDetail(
                    product: controller.data.value!,
                    user: controller.dataUser.value!),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(kSpacing),
        child: Row(
          children: [
            SizedBox(
              width: kSpacing / 2,
            ),
            _ChatButton(onPressed: () {}),
            SizedBox(
              width: kSpacing,
            ),
            _BuyButton(
              onPressed: () {},
            ),
            SizedBox(
              width: kSpacing / 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductDetail({
    required Product product,
    required User user,
  }) {
    return Stack(
      children: [
        // Background image
        SingleChildScrollView(
          controller: controller.scroll,
          child: Stack(
            children: [
              Hero(tag: product.id, child: _ProductImage(product.images)),
              //Body
              _BodyContent(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: _PriceText(
                              product.price.toString(),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: _ViewsText("${product.totalViews} Views")),
                        ],
                      ),
                      SizedBox(
                        height: kSpacing,
                      ),
                      _NameText(product.name),
                      SizedBox(
                        height: kSpacing,
                      ),
                      Row(
                        children: [
                          _Rating(product.rating),
                          SizedBox(
                            width: kSpacing,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          _ReviewText("${product.totalReview} Review"),
                        ],
                      ),
                      SizedBox(
                        height: kSpacing * 2,
                      ),
                      _Description(product.description),
                      SizedBox(
                        height: kSpacing,
                      ),
                      Material(
                        child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: user.profilImage,
                            ),
                            title: Text(user.name),
                            subtitle: Text("${user.country} (${user.city})"),
                            trailing: Icon(Icons.keyboard_arrow_right_outlined),
                            onTap: () {}),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Header button
        Obx(
          () => AnimatedOpacity(
            opacity: controller.opacityActionButton.value,
            duration: Duration(milliseconds: 200),
            child: Visibility(
              visible: controller.isVisibleActionButton.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 40,
                ),
                child: Row(
                  children: [
                    _BackButton(onPressed: () => controller.back()),
                    Spacer(),
                    _FavoriteButton(
                        initial: product.isFavorite,
                        onChanged: (isFavorite) => controller
                            .changeFavoriteProduct(product, isFavorite)),
                    SizedBox(
                      width: 15,
                    ),
                    _ShareButton(onPressed: () {})
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
