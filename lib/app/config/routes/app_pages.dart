import 'package:get/get.dart';
import 'package:mobile_marketplace/app/features/dashboard/explore/views/screens/explore_screen.dart';
import 'package:mobile_marketplace/app/features/dashboard/index/view/screens/dashboard_screen.dart';
import 'package:mobile_marketplace/app/features/product/product_detail/views/screens/product_detail_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(name: _Paths.dashboard, page: () => DashboardScreen(), bindings: [
      DashboardBinding(),
      ExploreBinding(),
    ]),
    GetPage(
      name: _Paths.product + "/:id",
      page: () => ProductDetailScreen(),
      binding: ProductDetailBinding(), 
      transition: Transition.downToUp,
    )
  ];
}
