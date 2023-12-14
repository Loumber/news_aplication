import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_ant_project/models/news.dart';
import 'package:web_ant_project/bloc/news_details/news_details_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({
    super.key,
    required this.newsId,
  });

  final int newsId;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsDetailsBloc>().add(LoadNewsById(
          id: widget.newsId,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<NewsDetailsBloc, NewsDetailsState>(
            builder: (context, state) {
              return switch (state) {
                final NewsDetailsInitialState _ =>
                  const Center(child: CircularProgressIndicator()),
                final NewsDetailsLoadingState _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
                final NewsDetailsFailureState _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
                final NewsDetailsSuccessState state => SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 58),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (state.news.imageUrl != null)
                              ? Container(
                                  height: 235,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),),
                                      child: Text(state.news.imageUrl!),
                                      
                                      //image: DecorationImage(
                                      //    image: NetworkImage(
                                      //      state.news.imageUrl!,
                                      //    ),
                                      //    fit: BoxFit.cover)),
                                )
                              : Container(
                                  height: 235,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            'assets/images/news_image.jpeg',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              state.news.title,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          state.news.updateDate != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                          'Date of publication: ${state.news.createDate.hour}:${state.news.createDate.minute} ${state.news.createDate.day}-${state.news.createDate.month}-${state.news.createDate.year}'),
                                      Text(
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                          //Здесь можно news.updateDate! так как уже news.updateDate проверена на не null
                                          'Date of change: ${state.news.updateDate!.hour}:${state.news.updateDate!.minute} ${state.news.updateDate!.day}-${state.news.updateDate!.month}-${state.news.updateDate!.year}'),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                      'Date of publication: ${state.news.createDate.hour}:${state.news.createDate.minute} ${state.news.createDate.day}-${state.news.createDate.month}-${state.news.createDate.year}'),
                                ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              state.news.description,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: MaterialButton(
                              onPressed: () {
                                final link = state.news.sourceUrl;
                                context.read<NewsDetailsBloc>().add(OpenNewsSourceLink(link: link));
                              }, 
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              color: Colors.white,
                              elevation: 1,
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.link, size: 20),
                                  Text('Перейти в источник'),
                                ],
                              ),
                            ),
                          )
                        ]),
                  ),
              };
            },
          )),
    );
  }
}
