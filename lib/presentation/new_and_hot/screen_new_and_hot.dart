import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/data/all_functions.dart';
import 'package:netflix/data/url.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
       const  Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("title",style: TextStyle(fontSize: 22),),
         ),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return NewAndHotMainCardWidget();
        //     },
        //   ),
        // ),
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
                return NewAndHotMainCardWidget(movieList: snapshot.data!,);
               // return MainTitleCardWidget(title:"Trending TV shows" ,movieList: snapshot.data!,);
              }
            },
          ),
      ],
      ),
        
      
    );
  }
}

class NewAndHotMainCardWidget extends StatelessWidget {
  const NewAndHotMainCardWidget({
    super.key,
    required this.movieList,
  });
  final List movieList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:5,
        itemBuilder:(context, index) {
          final String movieImageUrl=imgBaseUrl + movieList[index].posterPath.toString();
          final String movieReview=movieList[index].overview.toString();
          return NewAndHotCardWidget(imageurl: movieImageUrl,overview: movieReview,);
        },
          
        
      ),
    );
  }
}

class NewAndHotCardWidget extends StatelessWidget {
  const NewAndHotCardWidget({
    super.key,required this.imageurl,required this.overview
  });
  final String imageurl;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              //color: Colors.white,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(imageurl),
               ),
             ),
            ),
          ),
       const Padding(
          padding:  EdgeInsets.all(8.0),
          child:   Row(
              children: [
                Text("title",style: TextStyle(fontSize: 22),),
                Spacer(),
                Icon(Icons.share,color: kwhiteColor,size: 30.0,),
                Icon(Icons.add,color: kwhiteColor,size: 40.0,),
                Icon(Icons.play_arrow,color: kwhiteColor,size: 40.0,),
              ],
            ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(overview,maxLines: 4,),
        ),
        ],
      ),
    );
  }
}
