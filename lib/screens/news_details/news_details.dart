import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 58),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                height: 235,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://optavideo.com/images/chart/Test_chart_11.jpg',
                    )
                  )
                ),
              ),              
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Здоровый образ жизни: советы и инструменты по питанию и упражнениям для достижения успеха',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'data',
              ),
            ),
            
            MaterialButton(
              onPressed: (){},
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              elevation: 6,
              child: const Row(
                mainAxisSize: MainAxisSize.min ,
                children: [
                  
                  Text('Перетйи в источник'),
                ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}