import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mooviapp/store/movie_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieStore _movieStore = MovieStore();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movieStore.fetchDiscover();
  }
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'MooviApp',
          style: TextStyle(color: Colors.red,),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  autoPlay: true
                ),
                items: list
                    .map((item) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/pxOiKwRvNp3zFOiuwpYpzlbmEgC.jpg',
                      ),
                    )
                  ),
                ))
                    .toList(),
              )),
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Observer(builder: (_) {
              switch( _movieStore.discoverMovies?.status) {
                case FutureStatus.pending:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case FutureStatus.fulfilled:
                  print( _movieStore.discoverMovies?.result);
                  return ListView.builder(
                    itemBuilder: (context, i) {
                      return Text(i.toString());
                    },
                    itemCount: _movieStore.discoverMovies?.result.length,
                  );
                default:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          )
        ],
      )
    );
  }
}

