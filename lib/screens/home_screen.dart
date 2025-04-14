import 'package:flutter/material.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4K Prime'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          MovieCard(
            title: 'Inception',
            imageUrl: 'https://image.tmdb.org/t/p/w500/example.jpg',
            rating: 8.8,
          ),
        ],
      ),
    );
  }
}
