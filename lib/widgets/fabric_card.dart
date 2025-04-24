import 'package:flutter/material.dart';



class FabricCard extends StatelessWidget {
  final String? image;
  final String? name;
  const FabricCard({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image ?? ""),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              name ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
