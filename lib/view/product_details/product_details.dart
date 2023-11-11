import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/product_details/details_controller.dart';

class ProductDetails extends GetView<DetailsController>{
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

   return Scaffold(
     appBar: myAppBar(),
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(16),
         child: Obx(() => Stack(
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Stack(
                   children: [
                     Container(
                         margin: const EdgeInsets.only(top: 16, bottom: 16),
                         height: size.height *0.3,
                         width: size.width,
                         child: Image.network(controller.args.image!)
                     ),
                     Positioned(
                       top: 10, right: 10,
                       child: Row(
                         children: [
                           const Icon(Icons.star, color: Colors.amber,),
                           const SizedBox(width: 8,),
                           Text('${controller.args.rating!.rate?? 0.00}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                         ],
                       ),
                     ),
                   ],
                 ),
                 Text(controller.args.title?? "NO NAME", style: const TextStyle(fontWeight: FontWeight.bold),),
                 const SizedBox(height:8),
                 Text(controller.args.description?? "NO NAME", style: const TextStyle(fontSize: 14),),
                 const SizedBox(height:8),
                 Text(controller.args.category?? "NO NAME", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                 const SizedBox(height:8),
                 Text('USD ${controller.args.price?? 0.00}', textAlign: TextAlign.end, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                 const Divider(thickness: 2,),
                 const Text('Product Quantity',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                 Row(
                   children: [
                     IconButton(onPressed: (){
                       controller.productQuantity.value = controller.productQuantity.value + 1;
                     }, icon: const Icon(Icons.add_circle)),
                     Text("${controller.productQuantity.value}", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                     IconButton(onPressed: (){
                       controller.removeItem();
                       }, icon: const Icon(Icons.remove_circle)),
                   ],
                 ),

               ],
             ),
             Positioned(
                 bottom: 40,left: 0,right: 0,
                 child:  ElevatedButton(onPressed: (){controller.selectedAddToCart(context);}, child: const Text('Add To Cart'))
             )
           ],
         ))
       ),
     ),
   );
  }


  AppBar myAppBar (){
    return AppBar(
      title: const Text('Details'),
    );
  }

}