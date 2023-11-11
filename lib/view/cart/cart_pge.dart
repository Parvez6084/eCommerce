import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/cart/cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: SafeArea(
        child: Obx(() => Column(
          children: [
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.rxCartList.length,
                separatorBuilder: (BuildContext context, int index) {return const Divider(thickness: 1); },
                  itemBuilder: (_, index){
                    return Dismissible(
                      key: Key(controller.rxCartList.value[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction){controller.deleteItem(controller.rxCartList.value[index].id!);},
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.rxCartList.value[index].title!),
                            Text("Price ${controller.rxCartList.value[index].price}"),
                          ],
                        ),
                        subtitle: Text(controller.rxCartList.value[index].description!, overflow: TextOverflow.ellipsis,),
                        leading: Image.network(controller.rxCartList.value[index].image!),
                        trailing: Column(
                          children: [
                            Text('QN ${controller.rxCartList.value[index].quantity}'),
                            Text("Total ${controller.totalPrice(index)}"),
                          ],
                        ),
                      ),
                    );
                  },
              ),
            ),
            ElevatedButton(
                onPressed: (){controller.checkOut();},
                child: const Text('Checkout')
            )
          ],
        ),)
      ),
    );
  }
}
