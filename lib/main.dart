import'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//
import 'package:newsproject/views/NewsFirstScreen.dart';


    void main(){
  runApp(const ProviderScope(child: HackerNews()));


    }


    class HackerNews extends StatefulWidget {
      const HackerNews({Key? key}) : super(key: key);

      @override
      State<HackerNews> createState() => _HackerNewsState();
    }

    class _HackerNewsState extends State<HackerNews> {
      @override

      Widget build(BuildContext context) {


        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: FirstScreen(),
        );
      }
    }




