import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItemWidget extends StatelessWidget {
  const VideoListItemWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_mute),
                  ),
                ),
                //options column
              const  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(),
                    VideoActionWidget(icon: Icons.emoji_emotions,title: "LOL",),
                    VideoActionWidget(icon: Icons.add, title: "Add"),
                    VideoActionWidget(icon: Icons.share, title: "Share"),
                    VideoActionWidget(icon: Icons.play_arrow, title: "Play"),
                  
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

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({super.key,required this.icon,required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
       children: [
        Icon(icon,color: Colors.white,size: 30,),
        Text(title,style: const TextStyle(color: kwhiteColor,fontSize: 16),),
       ],
    
      ),
    );
  }
}
