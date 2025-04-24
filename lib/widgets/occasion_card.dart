import 'package:flutter/material.dart';


class OccasionCard extends StatelessWidget {

  final String? image;
  final String? name;
  final String? tintColor;
  const OccasionCard({ this.image, this.name, this.tintColor});

  @override
  Widget build(BuildContext context) {
  String?   hex = tintColor?.replaceAll("#", "");
   if (hex?.length == 6) hex = "FFe7f3f6";
    return Stack(
      children: [
        Image.network(image ??"", fit: BoxFit.cover, width: double.infinity, height: 150,),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(int.parse("0x$hex"))
              ),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 name ??"",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COLLECTION",
                      style: TextStyle(color: Colors.grey, fontSize: 6),
                    ),
                      Text(
                      "+EXPLORE",
                      style: TextStyle(color: Colors.grey, fontSize: 6),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}