
import 'package:flutter/material.dart';

import '../../core/colors/constants.dart';
import '../../data/url.dart';
import 'main_card_widget.dart';
import 'main_title.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget({
    super.key,
    required this.title,
    required this.movieList,
  });
  final String title;
  final List movieList;
  //movielist
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitleWidget(
          title: title,
        ),
        kheight,
        SizedBox(
          height: 252,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            
            itemBuilder: (context, index) {
              print(movieList.length);
              
              final String movieImageUrl=imgBaseUrl + movieList[index].posterPath.toString();
              return MainCardWidget(imageUrl: movieImageUrl,);
              },
            separatorBuilder: (context, index) => kwidth,
            // children: List.generate(10, (index) => MainCardWidget(),),
          ),
        ),
        kheight20,
      ],
    );
  }
}
