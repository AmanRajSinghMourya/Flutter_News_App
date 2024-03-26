import 'package:flutter/material.dart';
import 'package:newsapp/Components/colors.dart';

class TopCard extends StatelessWidget {
  final String imageUrl;
  final String headLine;
  final String reporter;
  final String time;
  final VoidCallback ontap;
  const TopCard({
    super.key,
    required this.imageUrl,
    required this.headLine,
    required this.reporter,
    required this.time,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
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
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(fit: BoxFit.cover, imageUrl),
                  ),
                ),
                //Type of News
                Positioned(
                  top: 10,
                  left: 5,
                  child: Chip(
                    label: Text("Category"),
                  ),
                ),
                Positioned(
                  top: 150.0,
                  child: Container(
                    height: 100,
                    width: 300,
                    child: Text(
                      headLine,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headlineSmall,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
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
                  reporter.length > 20 ? "Reporter" : reporter,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: padding,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
