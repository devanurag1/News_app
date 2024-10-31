import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/news_bloc.dart';
import '../../../bloc/news_event.dart';
import '../../cateogires_screen.dart';

enum FilterList { bbcNews, aryNews, independent, reuters, cnn, alJazeera }

FilterList? selectedMenu;

// ignore: must_be_immutable
class HomeAppBarWidget extends StatelessWidget {
  HomeAppBarWidget({Key? key}) : super(key: key);

  String name = 'bbc-news';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoriesScreen()));
        },
        icon: Image.asset(
          'images/category_icon.png',
          height: 30,
          width: 30,
        ),
      ),
      title: Text(
        'News',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
      ),
      actions: [
        PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (FilterList item) {
              if (FilterList.bbcNews.name == item.name) {
                name = 'bbc-news';
              }
              if (FilterList.cnn.name == item.name) {
                name = 'cnn-news';
              }

              if (FilterList.independent.name == item.name) {
                name = 'independent';
              }

              context.read<NewsBloc>()..add(FetchNewsChannelHeadlines(name));
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterList>>[
                  PopupMenuItem<FilterList>(
                    value: FilterList.bbcNews,
                    child: Text('BBC News'),
                  ),
                  PopupMenuItem<FilterList>(
                    value: FilterList.cnn,
                    child: Text('CNN News'),
                  ),
                  PopupMenuItem<FilterList>(
                    value: FilterList.independent,
                    child: Text('Independent News'),
                  ),
                ])
      ],
    );
  }
}
