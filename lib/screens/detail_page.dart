import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octodex_gallery/models/octodex.dart';
import 'package:share/share.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Octodex args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(FontAwesomeIcons.arrowLeft),
          onTap: () => Navigator.pop(context),
        ),
        title: Text('Octodex'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: args.name,
              child: Card(
                child: CachedNetworkImage(imageUrl: args.url),
                elevation: 4.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24.0),
              child: Text(
                args.name,
                style: TextStyle(fontSize: 28.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Text(
                'Author : ${args.author}',
                style: TextStyle(fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Share'),
                onPressed: () => Share.share(
                  "View this octocat art: ${args.name} by ${args.author}\n${args.url}",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
