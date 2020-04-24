import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octodex_gallery/models/octodex.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.github),
        title: Text('Octodex'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          itemCount: data.length,
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          staggeredTileBuilder: (index) =>
              StaggeredTile.count(2, index.isEven ? 1 : 2),
          itemBuilder: (context, index) {
            var name = data[index]['name'];
            var url = data[index]['url'];
            var author = data[index]['author'];

            return AnimationConfiguration.staggeredGrid(
              columnCount: data.length,
              position: index,
              duration: Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: Octodex(name, url, author),
                    ),
                    child: Hero(
                      tag: name,
                      child: Card(
                        child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
