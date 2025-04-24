import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //--------------------------variable -------------------------//
  bool isLoading = false;
  HomeProvider get homeProvider =>Provider.of<HomeProvider>(context,  listen: false);
  ValueNotifier loadingNotifier = ValueNotifier(true);
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
      body: SafeArea(
        child: ValueListenableBuilder(
             valueListenable: loadingNotifier,   
          builder: (context, value, child) {
            return Consumer<HomeProvider>(builder:  (context, value, child) {
              return isLoading? Center(
                 child: CircularProgressIndicator(),
              ): SingleChildScrollView(
                scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 135,
                  child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemCount: value.topViewModel?.mainStickyMenu?.length ??0,itemBuilder: (context, index) {
                   return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                     child: Column(
                      spacing: 2,
                       children: [
                         Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                         image: DecorationImage(image: NetworkImage(value.topViewModel?.mainStickyMenu?[index].image ?? "" ,),fit: BoxFit.cover)
                          ),
                          // margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 150,
                          height: 100,
                            
                         ),
                          Text(value.topViewModel?.mainStickyMenu?[index] .title ?? "", style: TextStyle(
                            fontSize: 16
                          ),)
                       ],
                     ),
                   ); 
                  }),
                )
              ],
            ),
              );
            },);
          }
        ),
      ),
    );
  }
  //-------------------- function ----------------//
  Future<void> fetchData() async {
    try {
      isLoading = true;
      loadingNotifier.notifyListeners();
      await homeProvider.fetchTopViewData();
    } catch (e) {
       Fluttertoast.showToast(msg: e.toString());
    }finally{
        isLoading = false;
      loadingNotifier.notifyListeners();
    }
  }
}