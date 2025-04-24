import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {

  final String? image;
  final String? name;
  final String? tintColor;
  const CategoryCard({ this.image, this.name, this.tintColor});

  @override
  Widget build(BuildContext context) {
  // String?   hex = tintColor?.replaceAll("#", "");
  //  if (hex?.length == 6) hex = "FF$hex";
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse("0xffe7e3e7"))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(image ??"", fit: BoxFit.cover, width: double.infinity),
          ),
          Expanded(
            child: Container(
             
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                     name ??"",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "+EXPLORE",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}