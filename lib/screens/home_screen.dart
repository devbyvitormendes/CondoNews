import 'package:carousel_slider/carousel_slider.dart';
import 'package:condo_news/components/breaking_news_card.dart';
import 'package:condo_news/components/news_list_tile.dart';
import 'package:condo_news/models/news_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsData> breakingNews = [
    NewsData(
      title: "Convocação Urgente",
      content: "Assembléia Geral que será realizada em 02/12/2024, 19h.",
      urlToImage:
          "https://plus.unsplash.com/premium_photo-1672423154405-5fd922c11af2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      date: DateTime.now().toIso8601String(),
    ),
    NewsData(
      title: "Mercadinho",
      content: "Cupons de descontos no Mercadinho a partir de 2025.",
      urlToImage:
          "https://images.unsplash.com/photo-1516281717304-181e285c6e58?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      date: DateTime.now().toIso8601String(),
    ),
    NewsData(
      title: "Horários para barulho e reforma",
      content: "Qualquer barulho acima de 70dB deve ser evitado após as 17h até as 9h da manhã.",
      urlToImage:
          "https://images.unsplash.com/photo-1498036882173-b41c28a8ba34?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      date: DateTime.now().toIso8601String(),
    ),
  ];

  List<NewsData> news = [
    NewsData(
      title: "Ata da última Assembleia",
      content: "Foi decidido que o condominio deveria ser reformado.",
      urlToImage:
          "https://images.unsplash.com/photo-1630703178138-3e06b55d53b6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      date: DateTime.now().toIso8601String(),
    ),
    NewsData(
      title: "Prestação de contas 2024",
      content: "Divulgação da prestação de contas do ano de 2024.",
      urlToImage:
          "https://plus.unsplash.com/premium_photo-1722513619567-e9a50db61a64?q=80&w=1999&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      date: DateTime.now().toIso8601String(),
    ),
    NewsData(
      title: "Novos funcionários",
      content: "Novos funcionários contratados para compor nosso quadro.",
      urlToImage:
          "https://images.unsplash.com/photo-1700126689261-1f5bdfe5adcc?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      date: DateTime.now().toIso8601String(),
    ),
    NewsData(
      title: "Reserva do salão de festas para fim de ano",
      content: "Fiquem atentos à data para reserva do salão de festas.",
      urlToImage:
          "https://images.unsplash.com/photo-1618554717071-a80a2f641e60?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      date: DateTime.now().toIso8601String(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Condo News",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Últimas notícias",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                itemCount: breakingNews.length,
                itemBuilder: (context, index, id) =>
                    BreakingNewsCard(breakingNews[index]),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Notícias Recentes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: news.map((e) => NewsListTile(e)).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          selectedItemColor: Colors.blueGrey,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.bookmark),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.rss_feed_rounded),
              label: "Feed",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
