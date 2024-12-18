import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:condo_news/presenter/ui/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class NewsListTile extends StatefulWidget {
  final NewsModel data;

  const NewsListTile(this.data, {super.key});

  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(widget.data),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(12),
        height: 130,
        decoration: BoxDecoration(
          color: ColorsConstants.highlightColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Hero(
                tag: "${widget.data.title}",
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(widget.data.image!),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  Text(
                    widget.data.title!.trim(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: ColorsConstants.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.data.content!.trim(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ColorsConstants.white50,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
