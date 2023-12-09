import 'package:flutter/material.dart';
import 'package:webant/screens/news_details/news_details.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Все новостии',
        style: TextStyle(
          fontSize: 20
        ),
        ),
      ),

      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index)=>
          ListTile(
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewsDetailsScreen()));
            } ,
            leading: Image.network(
              'https://optavideo.com/images/chart/Test_chart_11.jpg'),
            title: Text(
              'Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.',
              maxLines: 1,
              overflow: TextOverflow.ellipsis ,),
            subtitle: Text('bbbbbbbbb'),
          ),        
      ),
    );
  }
}