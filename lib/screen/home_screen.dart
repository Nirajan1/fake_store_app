import 'package:fake_store_app/controller/category_controller.dart';
import 'package:fake_store_app/controller/producr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cController = Get.find<CategoryController>();
    var pController = Get.find<ProductController>();
    return Obx(
      () {
        if (pController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: [
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2022/03/03/17/53/thuja-7045798__340.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2022/12/04/18/15/pesto-7635158__340.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2022/11/23/16/03/butterfly-7612383__340.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
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
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 600,
                                          width: Get.size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.amber.shade200,
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text('BottomSheetModel'),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                      'Close BottomSheetModel'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Positioned(
                                  child: SizedBox(
                                    width: Get.size.width,
                                    height: 140,
                                    child: Image(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          pController.products[index].image),
                                    ),
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
