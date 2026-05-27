import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:genshin_import/data/styles.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text("Welcome, Buahlil", style: TextStyle(fontSize: 20),),
            Text("Best-Selling", style: TextStyle(fontSize: 20),),

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
            ),

            Text("Newest Release", style: TextStyle(fontSize: 20),),

            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black54.withAlpha(20),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/asmoday.jpeg", fit: BoxFit.cover,),
                      Center(child: Text("Name", style: GIStyle.header,)),
                      Center(child: Text("\$10", style: GIStyle.subHeader)),
                    ],
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black54.withAlpha(20),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/asmoday.jpeg", fit: BoxFit.cover,),
                      Center(child: Text("Name", style: GIStyle.header,)),
                      Center(child: Text("\$10", style: GIStyle.subHeader)),
                    ],
                  ),
                ),
              ], 
            )
          ],
        ),
      ),
    );
  }
}