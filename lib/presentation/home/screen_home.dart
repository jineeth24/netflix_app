import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:netflix/presentation/widgets/main_card_widget.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../data/all_functions.dart';
import '../widgets/main_title_card_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Netflix,",)),
        body: Padding(
      padding: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // MainTitleCardWidget(
            //   title: "Released in the past year",
            // ),

            //trending listview
             FutureBuilder(
            future:getTrendingMovieApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              } else {
                return MainTitleCardWidget(title:"Trending Now" ,movieList: snapshot.data!,);
              }
            },
          ),
           FutureBuilder(
            future:getTrendingTvApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              } else {
                return MainTitleCardWidget(title:"Trending TV shows" ,movieList: snapshot.data!,);
              }
            },
          ),

  FutureBuilder(
            future:getMovieApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              } else {
                return MainTitleCardWidget(title:"All Movies" ,movieList: snapshot.data!,);
              }
            },
          ),

            // MainTitleCardWidget(
            //   title: "Trending Now",
            //   //list trendinglist
            // ),



            // MainTitleCardWidget(
            //   title: "Top 10 Tv shows in India ",
            // ),
            // MainTitleCardWidget(title: "Tense Dramas")
          ],
        ),
      ),
    ));
  }
}
