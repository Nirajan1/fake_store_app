import 'package:fake_store_app/controller/category_controller.dart';
import 'package:fake_store_app/controller/producr_controller.dart';
import 'package:fake_store_app/controller/single_product_controller.dart';
import 'package:fake_store_app/view/single_product.dart';
import 'package:fake_store_app/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cController = Get.find<CategoryController>();
    var pController = Get.find<ProductController>();
    var spController = Get.find<SingleProductConroller>();
    return Obx(
      () {
        if (cController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CarouselWidget(),
                const ListTile(
                  title: Text('Available Category'),
                  subtitle: Text('10% off on selected items'),
                  trailing: Icon(Icons.more_vert_outlined),
                ),
                Container(
                  width: Get.size.width,
                  height: 50,
                  decoration: const BoxDecoration(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: cController.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(3.0),
                        child: Chip(
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.grey[200],
                            label: Text(cController.categories[index])),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3.0),
                  child: const ListTile(
                    title: Text('Available Products'),
                    // subtitle: Text('10% off on selected items'),
                    trailing: Icon(Icons.more_vert_outlined),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(3.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: pController.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: const BoxDecoration(),
                        child: InkWell(
                          onTap: () {
                            spController
                                .getProduct(pController.products[index].id);
                            Get.to(() => const SingleProductView());
                          },
                          child: Card(
                            color: Colors.white,
                            shadowColor: Colors.white,
                            elevation: 2,
                            child: Stack(
                              children: [
                                Positioned(
                                  child: SizedBox(
                                    width: Get.size.width,
                                    height: 135,
                                    child: Image(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          pController.products[index].image),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  left: 150,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_outline),
                                    color: Colors.red,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 50,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            pController.products[index].title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            'Rs.${pController.products[index].price}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
