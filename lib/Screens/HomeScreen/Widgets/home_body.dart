import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Components/colors.dart';
import 'package:newsapp/Controller/news_controller.dart';
import 'package:newsapp/Screens/HomeScreen/Widgets/new_card.dart';
import 'package:newsapp/Screens/HomeScreen/Widgets/trending_card.dart';
import 'package:newsapp/Screens/NewDetailScreen/new_detail_screen.dart';
import 'package:newsapp/Screens/Shimmer/news_shimmer.dart';
import 'package:newsapp/Screens/Shimmer/trending_shimmer.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hottest News",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "See all",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          SizedBox(
            height: padding / 2,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => newsController.isTrendingLoading.value
                  ? Row(
                      children: [TrendingShimmer(), TrendingShimmer()],
                    )
                  : Row(
                      children: newsController.trendingNewsList
                          .map(
                            (element) => TopCard(
                              ontap: () {
                                Get.to(NewDetailPage(
                                  newsModel: element,
                                ));
                              },
                              imageUrl: element.urlToImage ?? defaultUrl,
                              headLine: element.title ?? "Headline",
                              reporter: element.author ?? "Unknown",
                              time: element.publishedAt ?? "Unknwn",
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
          SizedBox(
            height: padding / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendation",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "See all",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          SizedBox(
            height: padding / 2,
          ),
          Obx(
            () => newsController.isRecommLoding.value
                ? Column(
                    children: [NewsShimmer(), NewsShimmer(), NewsShimmer()],
                  )
                : Column(
                    children: newsController.recommendationNewsList
                        .map(
                          (element) => NewsCard(
                            ontap: () {
                              Get.to(NewDetailPage(newsModel: element));
                            },
                            image: element.urlToImage ?? defaultUrl,
                            title: element.title ?? "Title",
                            reporter: element.author ?? "Unknowm",
                            time: element.publishedAt ?? "Unknown",
                          ),
                        )
                        .toList(),
                  ),
          ),
          SizedBox(
            height: padding,
          ),
        ],
      ),
    );
  }
}
