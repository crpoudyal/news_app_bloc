import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/bloc/news_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: Text(
                    "Bloc News".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.7),
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                )
              ],
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: height * 0.08),
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
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(state
                                            .newsList[index].urlToImage
                                            .toString()),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      state.newsList[index].title.toString(),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      state.newsList[index].description
                                          .toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
