import 'package:flutter/material.dart';
import 'package:newsapp/Components/colors.dart';
import 'package:newsapp/Screens/Shimmer/shimmer_container.dart';

class TrendingShimmer extends StatelessWidget {
  const TrendingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: padding / 2, left: padding / 2),
      padding: EdgeInsets.all(padding / 4),
      // height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(height: 200, width: 300),
          SizedBox(
            height: padding / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShimmerContainer(
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: padding / 2,
              ),
              ShimmerContainer(
                  height: 10, width: MediaQuery.of(context).size.width / 5),
            ],
          ),
          SizedBox(
            height: padding / 2,
          ),
          ShimmerContainer(
            height: 15,
            width: MediaQuery.of(context).size.width / 1.8,
          ),
          SizedBox(
            height: padding / 2,
          ),
          ShimmerContainer(
            height: 15,
            width: MediaQuery.of(context).size.width / 1.8,
          ),
        ],
      ),
    );
  }
}
