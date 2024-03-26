import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Components/colors.dart';
import 'package:newsapp/Controller/news_controller.dart';
import 'package:newsapp/Screens/FavouriteScreen/favourite_screen.dart';
import 'package:newsapp/Screens/HomeScreen/Widgets/bottom_nav_bar.dart';
import 'package:newsapp/Screens/HomeScreen/Widgets/home_body.dart';
import 'package:newsapp/Screens/SearchScreen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = 0.obs;
    final PageController pageController = PageController(initialPage: 0);
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        leading: Obx(
          () => IconButton(
            onPressed: () {
              newsController.getNews();
              newsController.recommendationNews();
            },
            icon: newsController.isTrendingLoading.value
                ? CircularProgressIndicator()
                : Icon(Icons.add),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: padding,
            vertical: padding / 2,
          ),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentIndex.value = index; // Update the index using GetX
            },
            children: [
              HomeWidget(),
              SearchScreen(),
              HomeWidget(),
              FavouriteScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        pageController: pageController,
      ),
    );
  }
}
