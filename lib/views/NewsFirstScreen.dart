import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsproject/main.dart';
//import 'pakage:newsproject/models/newsclass.dart';

import '../provider/newsprovider.dart';
import '../services/newsservices.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HackerNews'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final news = ref.watch(newsProvider);

        return ListView.builder(
      scrollDirection: Axis.vertical,
          itemCount: news.length,
          itemBuilder: (context, index) {
            final hackerNews= news[index];

            return Card(
              child: ListTile(

                title: Text(hackerNews.title!,style: TextStyle(color: Colors.black),),
                subtitle: SizedBox(
                  
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(hackerNews.by!),
                      Column(

                        children: [
                          Icon(Icons.comment),
                          Text(hackerNews.kids?.length== null
                              ? '0'
                              : hackerNews.kids!.length.toString())
                        ],
                      )


                    ],
                  ) ,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
