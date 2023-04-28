import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/bloc/tech_bloc.dart';
import 'package:news_app_bloc/screens/details_screen.dart';

class TechNewsScreen extends StatefulWidget {
  const TechNewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TechNewsScreenState createState() => _TechNewsScreenState();
}

class _TechNewsScreenState extends State<TechNewsScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 1);
  }

  late PageController _pageController;
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TechBloc, TechState>(
        builder: (context, state) {
          if (state is TechLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TechLoadedState) {
            return Column(
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Breaking News".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                BlocBuilder<TechBloc, TechState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        itemCount: 5,
                        pageSnapping: true,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            activePage = page;
                          });
                        },
                        itemBuilder: (context, pagePosition) {
                          if (state is TechLoadedState) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      state.newsList[pagePosition].urlToImage
                                          .toString(),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.black
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.newsList[pagePosition].title
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        state.newsList[pagePosition].author
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white54,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "All News".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
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
                                  url: Uri.parse(
                                      state.newsList[index].url.toString()),
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
                      }),
                ),
              ],
            );
          } else if (state is TechErrorState) {
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
    );
  }
}
