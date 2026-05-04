import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final List<String> carouselImages = [

  ];
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Dashboard"));
  }
}