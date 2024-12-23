import 'package:carousel_slider/carousel_slider.dart';
import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:condo_news/presenter/ui/widget/app_bar_widget.dart';
import 'package:condo_news/presenter/ui/widget/breaking_news/breaking_news_card.dart';
import 'package:condo_news/presenter/ui/widget/news/news_list_tile.dart';
import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<NewsModel>> breakingNews;
  late Future<List<NewsModel>> news;

  @override
  void initState() {
    breakingNews = NewsService().getBreakingNews();
    news = NewsService().getNews();
    super.initState();
  }

  @override
  void dispose() {
    breakingNews = Future.value([]);
    news = Future.value([]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.black,
      appBar: const AppBarWidget(
        showBack: false,
        showActions: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Importante",
                style: TextStyle(
                  color: ColorsConstants.lightGrey,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: breakingNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CarouselSlider.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index, id) =>
                          BreakingNewsCard(snapshot.data![index]),
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const SpinKitSpinningLines(
                    color: ColorsConstants.lightGrey,
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Recentes",
                style: TextStyle(
                  color: ColorsConstants.lightGrey,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children:
                          snapshot.data!.map((e) => NewsListTile(e)).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const SpinKitSpinningLines(
                    color: ColorsConstants.lightGrey,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.all(16),
      //   decoration: BoxDecoration(
      //     color: Colors.black,
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   child: BottomNavigationBar(
      //     elevation: 0,
      //     selectedItemColor: Colors.blueGrey,
      //     items: const [
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.transparent,
      //         icon: Icon(Icons.home),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.transparent,
      //         icon: Icon(Icons.bookmark),
      //         label: "Bookmark",
      //       ),
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.transparent,
      //         icon: Icon(Icons.rss_feed_rounded),
      //         label: "Feed",
      //       ),
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.transparent,
      //         icon: Icon(Icons.person),
      //         label: "Profile",
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
