import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../provider/category_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  //------------------------- var ------------------------//
  bool isLoading = false;
  CategoryProvider get categoryProvider =>
      Provider.of<CategoryProvider>(context, listen: false);
  ValueNotifier loadingNotifier = ValueNotifier(true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left_sharp),
        title: Text("Category"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: loadingNotifier,
        builder: (context, value, child) {
          return Consumer<CategoryProvider>(
            builder: (context, value, child) {
              return Skeletonizer(
                enabled: isLoading,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 1,
                    children: List.generate(
                      value.categoryModel?.categories?.length ?? 0,
                      (index) {
                        return Container(
                          height: 150,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                value.categoryModel?.bannerImage ?? "",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                value
                                        .categoryModel
                                        ?.categories?[index]
                                        .categoryName ??
                                    "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;
      loadingNotifier.notifyListeners();
      await categoryProvider.fetchCategoryData();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading = false;
      loadingNotifier.notifyListeners();
    }
  }
}
