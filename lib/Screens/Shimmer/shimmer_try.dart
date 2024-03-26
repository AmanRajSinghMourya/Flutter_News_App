import 'package:flutter/material.dart';
import 'package:newsapp/Screens/Shimmer/news_shimmer.dart';
import 'package:newsapp/Screens/Shimmer/trending_shimmer.dart';

class TrendingShimmer1 extends StatelessWidget {
  const TrendingShimmer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [NewsShimmer(), TrendingShimmer()],
        ),
      ),
    );
  }
}
