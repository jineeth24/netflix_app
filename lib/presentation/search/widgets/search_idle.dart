import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

//const imageUrl =  "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/jMTvYnFr89K0RxO9K2sz4poWCCc.jpg";

class SearchIdleWidget extends StatelessWidget {
   SearchIdleWidget({super.key,required this.searchIdleMovies});

   final List<dynamic> searchIdleMovies;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchScreenTitle(title: "Top Searches",),
        kheight20,
        //listview of available shows
        Expanded(
          child: ListView.separated(
            //shrinkWrap: true,
            itemBuilder: (context, index) {
              return  TopSearchItemTile(imageurl: searchIdleMovies[index].posterPath,moviename: searchIdleMovies[index].title! ,);
            },
            separatorBuilder: (context, index) {
              return kheight20;
            },
            itemCount:searchIdleMovies.length ,
          ),
        ),
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
   TopSearchItemTile({super.key,required this.imageurl,required this.moviename});
  String imageurl;
  String moviename;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: screenWidth * 0.35,
          height: screenWidth * 0.25,
          decoration:  BoxDecoration(
            color: kwhiteColor,
            image: DecorationImage(
              image: NetworkImage("https://image.tmdb.org/t/p/original/$imageurl"),
              fit: BoxFit.cover,
            ),
          ),
        ),
         kwidth,
         Expanded(
          child: Text(moviename),
        ),
       
        CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 27,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 26,
            child: IconButton(
              alignment: Alignment.center,
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.play_fill,
              ),
              color: kwhiteColor,
              iconSize: 25,
            ),
          ),
        )
      ],
    );
  }
}
