import 'package:condo_news/models/news_model.dart';
import 'package:condo_news/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class NewsListTile extends StatefulWidget {
  final NewsData data;

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
          color: Colors.black,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Hero(
                tag: "${widget.data.title}",
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(widget.data.urlToImage!),
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
                    widget.data.title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.data.content!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white54,
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
