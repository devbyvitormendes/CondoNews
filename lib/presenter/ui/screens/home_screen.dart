import 'package:carousel_slider/carousel_slider.dart';
import 'package:condo_news/domain/helper/messages.dart';
import 'package:condo_news/domain/models/response_page_model.dart';
import 'package:condo_news/presenter/ui/condo_news_icon.dart';
import 'package:condo_news/presenter/ui/condo_news_scaffold_messenger_key.dart';
import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:condo_news/presenter/ui/widget/app_bar_widget.dart';
import 'package:condo_news/presenter/ui/widget/breaking_news/breaking_news_card.dart';
import 'package:condo_news/presenter/ui/widget/news/news_list_tile.dart';
import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ResponsePageModel> breakingNews;
  late Future<ResponsePageModel> news;
  static const int pageSize = 2;

  final PagingController<int, NewsModel> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    breakingNews = _getBreakingNews();
    news = _getNews(0, pageSize);

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<ResponsePageModel> _getBreakingNews() async {
    try {
      return await NewsService().getBreakingNews();
    } catch (error) {
      Messages.showError("$error", context);
      return getEmptyNews();
    }
  }

  Future<ResponsePageModel> _getNews(int page, int pageSize) async {
    try {
      return await NewsService().getNews(page, pageSize);
    } catch (error) {
      Messages.showError("$error", context);
      return getEmptyNews();
    }
  }

  Future<ResponsePageModel> getEmptyNews() {
    return Future.value(ResponsePageModel.empty());
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final news = await _getNews(pageKey, pageSize);
      if (news.last) {
        pagingController.appendLastPage(
            news.content!.map((e) => NewsModel.fromMap(e)).toList());
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(
            news.content!.map((e) => NewsModel.fromMap(e)).toList(),
            nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    breakingNews = getEmptyNews();
    news = getEmptyNews();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: CondoNewsScaffoldMessengerKey.instance.scaffoldKey,
      backgroundColor: ColorsConstants.black,
      appBar: const AppBarWidget(
        showBack: false,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Destaques",
                  style: TextStyle(
                    color: ColorsConstants.lightGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    breakingNews = _getBreakingNews();
                  },
                  icon: const Icon(
                    size: 20,
                    CondoNewsIcon.refresh,
                    color: ColorsConstants.lightGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: breakingNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CarouselSlider.builder(
                    itemCount: snapshot.data!.totalElements,
                    itemBuilder: (context, index, id) =>
                        BreakingNewsCard(snapshot.data!.content![index]),
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                    ),
                  );
                } else if (snapshot.hasError) {
                  Messages.showError(
                    "Erro ao buscar notícias",
                    context,
                  );
                }

                return const SpinKitSpinningLines(
                  color: ColorsConstants.lightGrey,
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text(
                  "Recentes",
                  style: TextStyle(
                    color: ColorsConstants.lightGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    news = _getNews(0, pageSize);
                  },
                  icon: const Icon(
                    size: 20,
                    CondoNewsIcon.refresh,
                    color: ColorsConstants.lightGrey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: news,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                child: PagedListView<int, NewsModel>(
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<NewsModel>(
                    animateTransitions: true,
                    itemBuilder: (context, item, index) => NewsListTile(item),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const SpinKitSpinningLines(
                      color: ColorsConstants.lightGrey,
                    ),
                    newPageProgressIndicatorBuilder: (context) =>
                        const SpinKitSpinningLines(
                      color: ColorsConstants.lightGrey,
                    ),
                    noMoreItemsIndicatorBuilder: (context) => const Padding(
                      padding: EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: Center(
                        child: Text(
                          "Sem mais notícias",
                          style: TextStyle(color: ColorsConstants.lightGrey),
                        ),
                      ),
                    ),
                  ),
                ),
              );
                } else if (snapshot.hasError) {
                  Messages.showError(
                    "Erro ao buscar notícias",
                    context,
                  );
                }
                return const SpinKitSpinningLines(
                  color: ColorsConstants.lightGrey,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
