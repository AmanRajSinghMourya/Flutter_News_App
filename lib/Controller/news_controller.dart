import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:newsapp/Model/news_model.dart';

class NewsController extends GetxController {
  void onInit() async {
    await getNews();
    await recommendationNews();
    super.onInit();
  }

  RxBool isTrendingLoading = false.obs;
  RxBool isRecommLoding = false.obs;
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> recommendationNewsList = <NewsModel>[].obs;
  Future<void> getNews() async {
    isTrendingLoading.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-02-26&sortBy=publishedAt&apiKey=6fc5e4ef604c4acfaaa62e359b5ddfe9";
    var response = await http.get(Uri.parse(baseUrl));
    // print(response.body);
    try {
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        //print(body["articles"]);

        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
        print("WORKING");
        isTrendingLoading.value = false;
        trendingNewsList.sublist(0, 5);
        print(trendingNewsList);
      } else {
        print("SOMETHING WENT WRONG");
        isTrendingLoading.value = false;
      }
    } catch (e) {
      print(e);
      isTrendingLoading.value = false;
    }
    isTrendingLoading.value = false;
  }

  Future<void> recommendationNews() async {
    isRecommLoding.value = true;
    var baseUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2024-03-24&to=2024-03-24&sortBy=popularity&apiKey=6fc5e4ef604c4acfaaa62e359b5ddfe9";
    var response = await http.get(Uri.parse(baseUrl));
    // print(response.body);
    try {
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        //print(body["articles"]);

        for (var news in articles) {
          recommendationNewsList.add(NewsModel.fromJson(news));
        }
        isRecommLoding.value = false;
      } else {
        print("SOMETHING WENT WRONG 2");
        isRecommLoding.value = false;
      }
    } catch (e) {
      isRecommLoding.value = false;
      print(e);
    }
    isRecommLoding.value = false;
  }
}
