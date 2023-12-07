import 'package:flutter/material.dart';
import 'package:news/repository/models.dart';

class ArticleScreen extends StatelessWidget {
  final Article articleItem;
  ArticleScreen({required this.articleItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(12),
        child: ListView(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage (articleItem.urlToImage ?? "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg")

                  )
              ),
              // child: Image.network(
              //   articleItem.urlToImage ??
              //       "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg",
              //   height: 250,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              //
              //
              // ),
            ),

            ListTile(
              title: Text(articleItem.author ?? ""),
              subtitle: Text(articleItem.publishedAt.toString()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                articleItem.description ?? "No description",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
