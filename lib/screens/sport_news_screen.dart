import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/bloc/news_bloc.dart';
import 'package:news_app_bloc/screens/details_screen.dart';

class SportNewsScreen extends StatefulWidget {
  const SportNewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SportNewsScreenState createState() => _SportNewsScreenState();
}

class _SportNewsScreenState extends State<SportNewsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: height * 0.01),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NewsLoadedState) {
                  return ListView.builder(
                      itemCount: state.newsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  description: state.newsList[index].description
                                      .toString(),
                                  title: state.newsList[index].title.toString(),
                                  urlToImage: state.newsList[index].urlToImage
                                      .toString(),
                                  tag: 'news$index',
                                  author:
                                      state.newsList[index].author.toString(),
                                  content:
                                      state.newsList[index].content.toString(),
                                  publishedAt: state.newsList[index].publishedAt
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Hero(
                                  tag: "news$index",
                                  child: Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(state
                                              .newsList[index].urlToImage
                                              .toString()),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      state.newsList[index].title == "null"
                                          ? "Unknown"
                                          : state.newsList[index].title
                                              .toString(),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else if (state is NewsErrorState) {
                  String error = state.errorMessage;

                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 100,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        error,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
