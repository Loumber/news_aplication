import 'package:flutter/material.dart';
import 'package:web_ant_project/bloc/news/news_bloc.dart';
import 'package:web_ant_project/screens/news_details/news_details.screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Все новости', style: TextStyle(fontSize: 20)),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return switch (state) {
            final NewsInitial _ => const SizedBox.shrink(),
            final NewsLoading _ =>
              const Center(child: CircularProgressIndicator()),
            final NewsFailure _ => const Center(child: Text('ошибка')),
            final NewsSuccess state => ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  final newsItem = state.news[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NewsDetailsScreen(
                          newsId: newsItem.id,
                        );
                      }));
                    },
                    leading: (newsItem.imageUrl != null)
                        ? Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      newsItem.imageUrl!,
                                    ),
                                    fit: BoxFit.cover)),
                          )
                        : Container(
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                    image: AssetImage (
                                      'assets/images/news_image.jpeg'
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                    title: Text(
                      newsItem.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      newsItem.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                })
          };
        },
      ),
    );
  }
}
