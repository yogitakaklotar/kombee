import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview/model/middle_view_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';
import '../widgets/category_card.dart';
import '../widgets/design_occasion_card_view.dart';
import '../widgets/fabric_card.dart';
import '../widgets/pattern_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //--------------------------variable -------------------------//
  bool isLoading = false;
  HomeProvider get homeProvider =>
      Provider.of<HomeProvider>(context, listen: false);
  ValueNotifier loadingNotifier = ValueNotifier(true);
  ValueNotifier typeNotifier = ValueNotifier(true);
  ValueNotifier boutiqueNotifier = ValueNotifier(true);
  int selectedIndex = 0;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  //--------------------------variable -------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
       
        title: Text("FABCURATẺ"),
        
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
              Positioned(
                left: 25,
                top: 7,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.grey,
                  child: Text("1", style: TextStyle( fontSize: 8),),
                ),
              )
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: loadingNotifier,
          builder: (context, value, child) {
            return Skeletonizer(
              enabled: isLoading,
              child: Consumer<HomeProvider>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: _buildTopMainCategoryView(value),
                        ),
                        SizedBox(height: 10),
                        _buildchildCategoryView(value),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: _shopbyCategoryview(value),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: _shopbyMaterialview(
                            value.middleViewModel?.shopByFabric,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Unstitched",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              _buildUnstitchedView(
                                value.middleViewModel?.unstitched,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Boutique Collection",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildBoutiqueView(
                              value.middleViewModel?.boutiqueCollection,
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: PatternCard(
                                rangeOfPattern:
                                    value.bottomViewModel?.rangeOfPattern,
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: DesignOccasionCardView(
                                designOccasion:
                                    value.bottomViewModel?.designOccasion,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopMainCategoryView(HomeProvider value) {
    return SizedBox(
      height: 135,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: value.topViewModel?.mainStickyMenu?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              typeNotifier.notifyListeners();
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Column(
                spacing: 2,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(
                          value.topViewModel?.mainStickyMenu?[index].image ??
                              "",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),

                    width: 150,
                    height: 100,
                  ),
                  Text(
                    value.topViewModel?.mainStickyMenu?[index].title ?? "",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildchildCategoryView(HomeProvider value) {
    return ValueListenableBuilder(
      valueListenable: typeNotifier,
      builder: (context, _, child) {
        return CarouselSlider(
          items: List.generate(
            value
                    .topViewModel
                    ?.mainStickyMenu?[selectedIndex]
                    .sliderImages
                    ?.length ??
                0,
            (index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        value
                                .topViewModel
                                ?.mainStickyMenu?[selectedIndex]
                                .sliderImages?[index]
                                .image ??
                            "",
                        fit: BoxFit.cover,
                        width: 700,
                          height: 200,

                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        value
                                .topViewModel
                                ?.mainStickyMenu?[selectedIndex]
                                .sliderImages?[index]
                                .title ??
                            "0",
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          options: CarouselOptions(
            height: 200,

            viewportFraction: 0.8,
            initialPage: 0,

            autoPlayInterval: Duration(seconds: 3),

            enlargeCenterPage: true,
            enlargeFactor: 0.3,

            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  Widget _shopbyCategoryview(HomeProvider value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shop By Category",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black45,),
        ),
        SizedBox(height: 10),

        SizedBox(
          height: 430,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                (value.middleViewModel?.shopByCategory?.isEmpty ?? true)
                    ? 0
                    : ((value.middleViewModel?.shopByCategory?.length ?? 0) / 2)
                        .ceil(),
            itemBuilder: (context, index) {
              final list = value.middleViewModel?.shopByCategory ?? [];
              final first = list[index * 2];
              final second =
                  (index * 2 + 1 < (list.length ))
                      ? (list.isEmpty )
                          ? null
                          : list[index * 2 + 1]
                      : null;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 140,
                      child: CategoryCard(image: first.image,name: first.name,tintColor: first.tintColor,),
                    ),
                    SizedBox(height: 10),
                    if (second != null)
                      SizedBox(
                        height: 200,
                        width: 140,
                        child: CategoryCard(image: second.image,name: second.name,tintColor: second.tintColor,),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _shopbyMaterialview(List<ShopBy>? shopByFabric) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shop By Fabric Material",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black45,),
        ),
        SizedBox(height: 10),

        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                (shopByFabric?.isEmpty ?? true)
                    ? 0
                    : ((shopByFabric?.length ?? 0) / 2).ceil(),
            itemBuilder: (context, index) {
              final list = shopByFabric ?? [];
              final first = list[index * 2];
              final second =
                  (index * 2 + 1 < (list.length))
                      ? (list.isEmpty )
                          ? null
                          : list[index * 2 + 1]
                      : null;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: FabricCard(image: first.image, name: first.name),
                    ),
                    SizedBox(height: 10),
                    if (second != null)
                      SizedBox(
                        height: 140,
                        width: 140,
                        child: FabricCard(
                          image: second.image,
                          name: second.name,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUnstitchedView(List<Unstitched>? unstitched) {
    return ValueListenableBuilder(
      valueListenable: typeNotifier,
      builder: (context, _, child) {
        return CarouselSlider(
          items: List.generate(unstitched?.length ?? 0, (index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    height: 400,
                    unstitched?[index].image ?? "",
                    fit: BoxFit.cover,
                    width: 600,
                  ),
                ),
              ],
            );
          }),
          options: CarouselOptions(
            height: 400,

            viewportFraction: 0.8,
            initialPage: 0,

            autoPlayInterval: Duration(seconds: 3),

            enlargeCenterPage: true,
            enlargeFactor: 0.2,

            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  Widget _buildBoutiqueView(List<BoutiqueCollection>? unstitched) {
    return ValueListenableBuilder(
      valueListenable: boutiqueNotifier,
      builder: (context, _, child) {
        return Column(
          children: [
            CarouselSlider(
              items: List.generate(unstitched?.length ?? 0, (index) {
                return Stack(
                  children: [
                    // Background Image
                    SizedBox(
                      height: 600,
                      width: double.infinity,
                      child: Image.network(
                        unstitched?[index].bannerImage ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Gradient overlay at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Text now appears on top of gradient
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 50,
                      child: Text(
                        unstitched?[index].name ?? "",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }),
              options: CarouselOptions(
                height: 600,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                  boutiqueNotifier.notifyListeners();
                },
                viewportFraction: 1,
                initialPage: 0,

                autoPlayInterval: Duration(seconds: 3),

                enlargeCenterPage: true,
                enlargeFactor: 0.3,

                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(unstitched?.length ?? 0, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: currentIndex == index ? 12 : 8,
                  width: currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.black : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  //-------------------- function ----------------//
  Future<void> fetchData() async {
    try {
      isLoading = true;
      loadingNotifier.notifyListeners();
      await homeProvider.fetchTopViewData();
      await homeProvider.fetchMiddleViewData();
      await homeProvider.fetchBottomViewData();
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading = false;
      loadingNotifier.notifyListeners();
    }
  }
}
