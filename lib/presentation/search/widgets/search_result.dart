import 'package:flutter/material.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kVG8zFFYrpyYLoHChuEeOGAd6Ru.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchScreenTitle(
          title: "Movies&TV",
        ),
        kheight20,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1/1.6,
            children: List.generate(20, (index) {
              return const MainCard();
            }),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Container(
      
      decoration: BoxDecoration(
        image:const DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
