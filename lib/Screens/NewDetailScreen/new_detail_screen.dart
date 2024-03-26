import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Components/colors.dart';
import 'package:newsapp/Model/news_model.dart';

class NewDetailPage extends StatelessWidget {
  final NewsModel newsModel;
  const NewDetailPage({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                child: Icon(
                  Icons.arrow_back_outlined,
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding / 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                padding: EdgeInsets.all(padding / 2),
                // color: Colors.red,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                newsModel.urlToImage ?? defaultUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 150.0,
                      child: Container(
                        padding: EdgeInsets.all(padding / 2),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          newsModel.title ?? "headLine",
                          style: Theme.of(context).textTheme.headlineSmall,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: padding / 2,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber,
                  ),
                  SizedBox(
                    width: padding / 2,
                  ),
                  Text(
                    newsModel.author ?? "Unkown",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Spacer(),
                  Text(newsModel.publishedAt ?? "2 days ago"),
                ],
              ),
              SizedBox(
                height: padding,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      newsModel.description ?? "Description",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
