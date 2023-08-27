import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/jMTvYnFr89K0RxO9K2sz4poWCCc.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

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
              return const TopSearchItemTile();
            },
            separatorBuilder: (context, index) {
              return kheight20;
            },
            itemCount: 15,
          ),
        ),
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: screenWidth * 0.35,
          height: screenWidth * 0.25,
          decoration: const BoxDecoration(
            color: kwhiteColor,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
         kwidth,
        const Expanded(
          child: Text("Movie Name "),
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
