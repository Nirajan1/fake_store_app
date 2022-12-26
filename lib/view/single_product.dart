import 'package:flutter/material.dart';

import 'package:fake_store_app/controller/single_product_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SingleProductView extends StatelessWidget {
  const SingleProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var spController = Get.find<SingleProductConroller>();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          width: Get.size.width,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  print('chat is pressed');
                },
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.grey[100],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              MaterialButton(
                height: 40,
                textColor: Colors.grey[100],
                color: Colors.amber,
                onPressed: () {},
                child: const Text('Buy Now'),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: MaterialButton(
                  height: 40,
                  textColor: Colors.grey[100],
                  color: Colors.amber,
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.shopping_cart,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text('Add to Cart')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('singel Product'),
        ),
        body: Obx(
          () {
            if (spController.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '${spController.product.value.image}'),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0),
                      child: Container(
                        width: Get.size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.grey[100]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Text(
                                            "${spController.product.value.title}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 10,
                                  ),
                                  RatingBar.builder(
                                    initialRating: double.parse(spController
                                        .product.value.rating!.rate
                                        .toString()),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    glowRadius: 1,
                                    itemSize: 30,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    height: 10,
                                  ),
                                  Text(
                                    "Rs${spController.product.value.price}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${spController.product.value.description}"),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
