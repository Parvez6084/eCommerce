import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/route/app_routes.dart';
import 'package:todo/view/home_page/home_controller.dart';
import 'package:todo/utils/app_images.dart';
import 'package:todo/view/widgets/search_bar.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SafeArea(
        child: Obx(() => Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySearchBar(controller: controller.searchController),
              const Text('ALL Product', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index){
                    return buildCard(index);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                  ),
                ),
              ),
            ],
          ),
        )
        )
      ),
    );
  }

  Widget buildCard(int index) {
    return InkWell(
      onTap: (){
        Get.toNamed(
            AppRoutes.DETAILS,
            arguments: controller.productList[index]
        );
        },
      child: Card(
          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          elevation: 8,
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                child:controller.productList[index].image =="null"
                    ? Image.asset(AppImage.NO_Images)
                    : Image.network(controller.productList[index].image!),
              ),
              Positioned(
                bottom: 0,left: 0, right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.productList[index].title ??" NO Name", style: const TextStyle(fontSize: 12, color: Colors.white),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("USD ${controller.productList[index].price ?? 0.00 }", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,  color: Colors.white),),
                          IconButton(onPressed: (){print(controller.productList[index]);}, icon: const Icon(Icons.shopping_cart,color: Colors.white,))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }

  AppBar myAppBar (){
   return AppBar(
      title: const Text('Home'),
      actions: [
        IconButton(onPressed: (){Get.toNamed(AppRoutes.CartPage);}, icon: const Icon(Icons.shopping_cart,color: Colors.white,))
      ],
    );
  }

}
