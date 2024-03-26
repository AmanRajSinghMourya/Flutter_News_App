import 'package:flutter/material.dart';
import 'package:newsapp/Components/colors.dart';

class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String reporter;
  final String time;
  final VoidCallback ontap;
  const NewsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.reporter,
    required this.time,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
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
                  child: Image.network(
                    image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: padding / 2),
                // Right side: Title and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.amber,
                          ),
                          SizedBox(width: padding / 2),
                          Text(
                            reporter.length > 20 ? "Reporter" : reporter,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
