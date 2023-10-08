import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopbils/core.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    bool viewTextField = controller.textField;

    controller.view = this;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 280,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                            horizontal: 12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              if (viewTextField == false)
                                Icon(
                                  Icons.search,
                                  size: 24.0,
                                  color: Colors.grey[700],
                                ),
                              if (viewTextField == true)
                                InkWell(
                                  onTap: () => controller.disableTextfield(),
                                  child: const Icon(
                                    Icons.arrow_back_outlined,
                                    size: 24.0,
                                  ),
                                ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Builder(builder: (context) {
                                  List images = [
                                    "Skincare Terbaru",
                                    "Knalpot Ninja R",
                                    "Seragam Sekolah",
                                    "Perabotan rumah tangga"
                                  ];

                                  return Stack(
                                    children: [
                                      if (viewTextField == false)
                                        InkWell(
                                          onTap: () =>
                                              controller.viewTextfield(),
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: 200.0,
                                              autoPlay: true,
                                              enlargeCenterPage: true,
                                              scrollDirection: Axis.vertical,
                                            ),
                                            items: images.map((texturl) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return Text(
                                                    "$texturl",
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.orange,
                                                    ),
                                                  );
                                                },
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      if (viewTextField == true)
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                initialValue: null,
                                                decoration:
                                                    const InputDecoration
                                                        .collapsed(
                                                  filled: true,
                                                  fillColor: Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  hintText: "",
                                                ),
                                                onFieldSubmitted: (value) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Badge(
                      label: Text(
                        "4",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(Icons.shopping_bag_outlined),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Badge(
                      label: Text(
                        "4",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Icon(Icons.chat_outlined),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Cari apa kak ${FirebaseAuth.instance.currentUser!.displayName ?? ""}",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Builder(builder: (context) {
                List images = [
                  "https://cf.shopee.co.id/file/id-50009109-4f4f4f2659467508c0d190516a6ce1a8",
                  "https://cf.shopee.co.id/file/id-50009109-c81c4b35e9dfb74f3f0c362fe494b2fe_xxhdpi",
                  "https://cf.shopee.co.id/file/id-50009109-6a9dcdf230bbf8d3fcfb78d4b64002ff_xxhdpi",
                  "https://cf.shopee.co.id/file/id-50009109-7a6bcbf19148b2f89cb6d182a4c1307d_xxhdpi",
                ];
                return Column(
                  children: [
                    CarouselSlider(
                      carouselController: controller.carouselController,
                      options: CarouselOptions(
                        height: 160.0,
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          controller.currentIndex = index;
                          controller.setState(() {});
                        },
                      ),
                      items: images.map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    imageUrl,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: images.asMap().entries.map((entry) {
                        bool isSelected = controller.currentIndex == entry.key;
                        return GestureDetector(
                          onTap: () => controller.carouselController
                              .animateToPage(entry.key),
                          child: Container(
                            width: isSelected ? 40 : 6.0,
                            height: 6.0,
                            margin: const EdgeInsets.only(
                              right: 6.0,
                              top: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : const Color(0xff6a696e),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              }),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  child: Row(
                    children: List.generate(
                      controller.categoryList.length,
                      (index) {
                        var item = controller.categoryList[index];
                        bool selected = controller.indexCategory == index;
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () => controller.updateCategory(index),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      color: selected
                                          ? Colors.black
                                          : Color(0xfff6f6f6)),
                                  child: AnimatedRotation(
                                    turns: 1 / 160,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    child: Icon(item["icon"],
                                        size: 24.0,
                                        color: selected
                                            ? Colors.white
                                            : Color(0xff6a696e)),
                                  ),
                                ),
                              ),
                              Text(
                                item["title"],
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Best Sale Product",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "See More",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff7cb1a4)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount: controller.products.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = controller.products[index];
                        bool selected = item["selected"] == true;
                        return InkWell(
                          onDoubleTap: () => controller.updateFavorite(index),
                          onTap: () => Get.to(ProductDetailView(
                            item: item,
                          )),
                          child: Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 100.0,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              item["photo"],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: InkWell(
                                          onTap: () =>
                                              controller.updateFavorite(index),
                                          child: selected
                                              ? Icon(
                                                  Icons.favorite,
                                                  size: 24.0,
                                                  color: Colors.red,
                                                )
                                              : const Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  size: 24.0,
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["category"],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Color(0xffc0c2c3)),
                                          ),
                                          Text(
                                            item["product_name"],
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3.0,
                                          ),
                                          Wrap(
                                            runSpacing: 10,
                                            spacing: 10,
                                            children: [
                                              Text(
                                                item["description"],
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 3.0,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 18.0,
                                                color: Color(0xfff6a442),
                                              ),
                                              const SizedBox(
                                                width: 1.0,
                                              ),
                                              Text(
                                                "4.9",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Color(0xffc0c2c3)),
                                              ),
                                              const SizedBox(
                                                width: 3.0,
                                              ),
                                              Container(
                                                width: 1,
                                                height: 12,
                                                color: Color(0xffc0c2c3),
                                              ),
                                              const SizedBox(
                                                width: 3.0,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "2356",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Color(0xffc0c2c3)),
                                                ),
                                              ),
                                              Text(
                                                "\$ ${item["price"]}",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff7cb1a4)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
