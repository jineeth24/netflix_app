import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/data/all_functions.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/GetModel.dart';
import 'package:netflix/data/url.dart';
 

class ScreenSearch extends StatefulWidget {
  ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List searchResult = [];
  TextEditingController query = TextEditingController();
  final Debouncer _debouncer = Debouncer(
    Duration(milliseconds: 500),
  );

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: query,
              
              backgroundColor: kGreyColor.withOpacity(0.5),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: kGreyColor,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: kGreyColor,
              ),
              style: const TextStyle(color: kwhiteColor),
              onChanged: (value) {
                _debouncer.run(() {
                  _fetchSearchResults(value);
                });
              },
          //     onChanged: (value) {
          //       _debouncer.run(() {
          //        FutureBuilder(
          //         future:  fetchSearchResults(query.text),
          //         builder:(context, snapshot) {
          //      if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const  Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (snapshot.hasError) {
          //   return Center(
          //     child: Text('Error: ${snapshot.error}'),
          //   );
          // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            
          //   return const Center(
          //     child: Text('No data available'),
          //   );
          // }else{
          //   print("success");
          //   searchResult=snapshot.data!.toList();
          //     return
          //      Expanded(
          //        child: SearchIdleWidget(
          //          searchIdleMovies: searchResult
          //        ),
          //      ); }
                   
          //         },
          //        );
          //       });
          //     },
           ),



            kheight20,
            //two widgets,before search and after search
           searchResult.isNotEmpty? Expanded(
              child: SearchIdleWidget(
                searchIdleMovies: searchResult,
              ),
              //child: SearchResultWidget(),
            ):const Expanded(child: Center(child: Text("Not found"),))
            
            // after search
            // kheight,
            
          ],
        ),
      ),
    );
  }

  Future<void> _fetchSearchResults(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<dynamic> data = jsonData['results'];
        // final movie=data[1];
        // final image=movie["backdrop_path"];

        //print(image);

        setState(() {
          searchResult.clear();

          for (Map<String, dynamic> i in data) {
            searchResult.add(GetModel.fromJson(i));
          }
        });
      }
    }
  }

//
 }
  class Debouncer {
  final Duration delay;
   Timer? _timer;

  Debouncer(this.delay){
  // _timer = Timer(Duration(seconds: 0), () {});
  }

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
} 



