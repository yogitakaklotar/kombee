import 'package:flutter/material.dart';
import 'package:interview/widgets/fabric_card.dart';

import '../model/bottom_view_model.dart';

class PatternCard extends StatelessWidget {
 final List<RangeOfPattern>?  rangeOfPattern;
   PatternCard({super.key , this.rangeOfPattern});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Range Of Pattern",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black45,),
        ),
        SizedBox(height: 10),

        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                (rangeOfPattern?.isEmpty ?? true)
                    ? 0
                    : ((rangeOfPattern?.length ?? 0) / 2).ceil(),
            itemBuilder: (context, index) {
              final list = rangeOfPattern ?? [];
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
                      height: 140,
                      width: 140,
                      child: FabricCard(image:  first.image,name: first.name,),
                    ),
                    SizedBox(height: 10),
                    if (second != null)
                      SizedBox(
                        height: 140,
                        width: 140,
                        child: FabricCard(image:  second.image,name: second.name,),
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
}