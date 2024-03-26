import 'package:flutter/material.dart';
import 'package:newsapp/Components/colors.dart';
import 'package:newsapp/Screens/Shimmer/shimmer_container.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: darkDivColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(padding / 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ShimmerContainer(height: 120, width: 120),
              ),
              SizedBox(width: padding / 2),
              // Right side: Title and description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: padding / 2,
                    ),
                    Row(
                      children: [
                        ShimmerContainer(
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: padding / 2),
                        ShimmerContainer(
                          height: 10,
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                      ],
                    ),
                    SizedBox(height: padding / 2),
                    ShimmerContainer(
                      height: 15,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    SizedBox(height: padding / 2),
                    ShimmerContainer(
                      height: 15,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    SizedBox(height: padding),
                    ShimmerContainer(
                      height: 10,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
