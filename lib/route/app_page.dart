import 'package:get/get.dart';
import 'package:todo/route/app_routes.dart';
import 'package:todo/view/cart/cart_binding.dart';
import 'package:todo/view/cart/cart_pge.dart';
import 'package:todo/view/home_page/home_binding.dart';
import 'package:todo/view/home_page/home_page.dart';
import 'package:todo/view/login_page/Login_binding.dart';
import 'package:todo/view/login_page/login_page.dart';
import 'package:todo/view/product_details/details_binding.dart';
import 'package:todo/view/product_details/product_details.dart';


class AppPages{

  AppPages._();


  static final pages = [

    GetPage(
        name: AppRoutes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()
    ),
    GetPage(
        name: AppRoutes.DETAILS,
        page: () => const ProductDetails(),
        binding: DetailsBinding()
    ),
    GetPage(
        name: AppRoutes.CartPage,
        page: () => const CartPage(),
        binding: CartBinding()
    ),

  ];


}
