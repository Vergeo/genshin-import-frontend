import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:genshin_import/data/notifiers.dart';
import 'package:genshin_import/data/styles.dart';
import 'package:genshin_import/viewmodels/user/user_bestselling_list.dart';
import 'package:genshin_import/widgets/scrollable_page_widget.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final List<String> carouselImages = [
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS72uQWh-a2gFVvQu8m6kyT2yy8LQAgHSLTqJCfri2MOYliNfsf',
    'https://gamebrott.com/wp-content/uploads/2023/02/1-17-1024x647.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollablePageWidget(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Featured",
            style: TextStyle(fontSize: 20, color: GIStyle.text[darkMode.value]),
          ),
          CarouselSlider(
            items: carouselImages.map((url) {
              return Image.network(url, fit: BoxFit.cover);
            }).toList(),

            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1.0,
            ),
          ),
          Text(
            "Best-Selling",
            style: TextStyle(fontSize: 20, color: GIStyle.text[darkMode.value]),
          ),
          UserBestsellingList(),
        ],
      ),
    );
  }
}
