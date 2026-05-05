import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final List<String> carouselImages = [
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS72uQWh-a2gFVvQu8m6kyT2yy8LQAgHSLTqJCfri2MOYliNfsf',
    'https://gamebrott.com/wp-content/uploads/2023/02/1-17-1024x647.jpg',

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
            
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,   //rata kiri

          children: [
            const Padding(padding: EdgeInsetsGeometry.directional(top: 10)),
            const Text("Best-Selling", style: TextStyle(fontSize: 20),),
            const SizedBox(height: 8),
            // const Text('3. Carousel Image'),
            const SizedBox(height: 4),
            CarouselSlider(
              items: carouselImages.map((url){
                return Image.network(
                  url,
                  fit: BoxFit.fitWidth
                );
              }).toList(), 
              
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0
              )
            )
          ],
        ),
      ),
    );
  }
}