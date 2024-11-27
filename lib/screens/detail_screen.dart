import 'package:condo_news/models/news_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final NewsData data;
  const DetailsScreen(this.data, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blueGrey.shade900,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.title!,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.data.date!,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Hero(
              tag: "${widget.data.title}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  widget.data.urlToImage!,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.data.content!,
            ),
          ],
        ),
      ),
    );
  }
}
