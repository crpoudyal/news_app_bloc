import 'package:flutter/material.dart';
import 'package:news_app_bloc/screens/business_news_screen.dart';
import 'package:news_app_bloc/screens/sport_news_screen.dart';
import 'package:news_app_bloc/screens/tech_news_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Bloc news.",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              )
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Sports",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
                Tab(
                  child: Text(
                    "Business",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
                Tab(
                  child: Text(
                    "Technology",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            SportNewsScreen(),
            BusinessNewsScreen(),
            TechNewsScreen(),
          ]),
        ),
      ),
    );
  }
}
