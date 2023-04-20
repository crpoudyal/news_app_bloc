import 'package:flutter/material.dart';
import 'package:news_app_bloc/screens/business_news_screen.dart';
import 'package:news_app_bloc/screens/sport_news_screen.dart';

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
            title: const Text("Bloc news."),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text("Sports"),
                ),
                Tab(
                  child: Text("Business"),
                ),
                Tab(
                  child: Text("Technology"),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            SportNewsScreen(),
            BusinessNewsScreen(),
            SportNewsScreen(),
          ]),
        ),
      ),
    );
  }
}
