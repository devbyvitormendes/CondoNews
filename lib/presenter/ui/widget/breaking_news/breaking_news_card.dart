import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:condo_news/presenter/ui/screens/detail_screen.dart';
import 'package:condo_news/domain/utils/string_utils.dart';
import 'package:flutter/material.dart';

class BreakingNewsCard extends StatefulWidget {
  final dynamic data;

  const BreakingNewsCard(this.data, {super.key});

  @override
  State<BreakingNewsCard> createState() => _BreakingNewsCardState();
}

class _BreakingNewsCardState extends State<BreakingNewsCard> {
  late NewsModel news = NewsModel();

  @override
  void initState() {
    news = NewsModel.fromJson(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(news),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(news.image!),
            )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Colors.transparent, ColorsConstants.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title!,
                style: const TextStyle(
                  color: ColorsConstants.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                StringUtils().formatDate(news.date!),
                style: const TextStyle(
                  color: ColorsConstants.white50,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
