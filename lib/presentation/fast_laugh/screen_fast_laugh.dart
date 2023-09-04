import 'package:flutter/material.dart';
import 'package:netflix/data/all_functions.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
          FutureBuilder(
            future: trendingMovieFastLaugh(),
            builder:(context, snapshot) {
               if (snapshot.connectionState == ConnectionState.waiting) {
            return const  Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }else{
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final movie=snapshot.data![index];
                  final imagepath=movie.posterPath;
                  return VideoListItemWidget(posterpath: imagepath!,);
                },);}
            },
            )
       
        ),
      );
    
  }
}
