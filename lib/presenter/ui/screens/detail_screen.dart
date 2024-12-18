import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:condo_news/presenter/ui/widget/app_bar_widget.dart';
import 'package:condo_news/domain/models/news_model.dart';
import 'package:condo_news/domain/utils/string_utils.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final NewsModel data;
  const DetailsScreen(this.data, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.black,
      appBar: const AppBarWidget(
        showBack: true,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.title!,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.textColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                StringUtils().formatDate(widget.data.date!),
                style: const TextStyle(
                  fontSize: 18,
                  color: ColorsConstants.textColor,
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
                    widget.data.image!,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.data.content!,
                style: const TextStyle(
                  color: ColorsConstants.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
