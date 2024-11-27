import 'package:condo_news/models/news_model.dart';
import 'package:condo_news/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class BreakingNewsCard extends StatefulWidget {
  final NewsData data;

  const BreakingNewsCard(this.data, {super.key});

  @override
  State<BreakingNewsCard> createState() => _BreakingNewsCardState();
}

class _BreakingNewsCardState extends State<BreakingNewsCard> {
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
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(widget.data.urlToImage!),
            )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.black],
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
                widget.data.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.data.date!,
                style: const TextStyle(
                  color: Colors.white54,
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
