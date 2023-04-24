import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String author;
  final String description;
  final String content;
  final String publishedAt;
  final String urlToImage;
  final Uri url;
  final String tag;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.tag,
    required this.author,
    required this.content,
    required this.publishedAt,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Hero(
                tag: tag,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40)),
                        image: DecorationImage(
                            image: NetworkImage(urlToImage), fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 230,
                      bottom: 15,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            author == "null" ? "Author" : author,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    description == "null" ? "Description" : description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    content == "null" ? "Content" : content,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (!await launchUrl(url)) {
              throw Exception("Couldn't launch");
            }
          },
          child: const Icon(Icons.read_more),
        ),
      ),
    );
  }
}
