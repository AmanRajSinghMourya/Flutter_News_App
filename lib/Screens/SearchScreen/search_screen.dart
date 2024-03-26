import 'package:flutter/material.dart';
import 'package:newsapp/Components/colors.dart';
import 'package:newsapp/Screens/HomeScreen/Widgets/new_card.dart';
import 'package:newsapp/Screens/SearchScreen/Widgets/search_box.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding / 2),
          child: Column(
            children: [
              SearchBox(),
              SizedBox(
                height: padding,
              ),
              NewsCard(
                ontap: () {},
                image: defaultUrl,
                title: "title",
                reporter: "AMan",
                time: "2 Days",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
