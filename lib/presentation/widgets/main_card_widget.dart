
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

import '../../core/colors/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
    required this.imageUrl
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      //color: kwhiteColor,
      decoration: BoxDecoration(
        color: kwhiteColor,
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imageUrl,
            
          ),
        ),
      ),
    );
  }
}
