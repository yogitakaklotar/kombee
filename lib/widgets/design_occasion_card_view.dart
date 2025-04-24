import 'package:flutter/material.dart';
import 'package:interview/widgets/occasion_card.dart';

import '../model/bottom_view_model.dart';
import 'category_card.dart';

class DesignOccasionCardView extends StatelessWidget {
 final List<DesignOccasion>? designOccasion;
  const DesignOccasionCardView({super.key,required this.designOccasion}); 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Design As Per Occasion",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black45,),
        ),
        SizedBox(height: 10),

        SizedBox(
          height: 430,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                (designOccasion?.isEmpty ?? true)
                    ? 0
                    : ((designOccasion?.length ?? 0) / 2)
                        .ceil(),
            itemBuilder: (context, index) {
              final list = designOccasion ?? [];
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
                      child: OccasionCard(image: first.image,name: first.name,tintColor: "#FBFBFB",),
                    ),
                    SizedBox(height: 10),
                    if (second != null)
                      SizedBox(
                        height: 200,
                        width: 140,
                        child: OccasionCard(image: second.image,name: second.name,tintColor: "#FBFBFB",),
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