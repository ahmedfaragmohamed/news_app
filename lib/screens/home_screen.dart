import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/repository/models.dart';
import 'package:news/repository/news_repository.dart';
import 'package:news/screens/article_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Response<dynamic>> newsRepository;

  @override
  void initState() {
    super.initState();
    newsRepository = NewsRepository().getTopBusinessNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News",
          style:
              TextStyle(color: Color(0xff231F20), fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            newsRepository = NewsRepository().getTopBusinessNews();
          });
        },
        child: FutureBuilder(
          future: NewsRepository().getTopBusinessNews(),
          builder: ( context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final response = snapshot.data;
              final data = response!.data ;
              final newsModel = NewsGeneralResponse.fromJson(data);
              return ListView.builder(
                itemCount: newsModel.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = newsModel.articles[index];
                  return ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleScreen(articleItem: item,)));

                    },
                    leading: Container(
                      width: 60,
                      height: 60,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage (item.urlToImage ?? "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg")

                        )
                      ),
                    ),


                    // trailing:  Container(
                    //   width: 50 ,
                    //   height: 50,
                    //   child: Card(

                          // child: Image.network(item.urlToImage ?? "https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/red_prodpictxmark_2_1484336301-1.png",
                          // fit: BoxFit.cover),
                      // ),
                    // ),
                    title: Text(
                      item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                      // style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 16
                      // )
                      ),
                    subtitle: Text(item.description ?? "Empty Description",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey
                        ),
                    ),
                    // trailing: Icon(Icons.home),
                  );
                },
              );
            }

              return Center(
                child: Text("try again"),
              );

          },
        ),
      ),
    );
  }
}
