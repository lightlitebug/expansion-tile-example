import 'package:expansion_video/models/pixabay_photo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String PIXABAY_KEY = '13403350-e8adfc746702c4a06a2a67655';

class PixabayTwoScreen extends StatefulWidget {
  @override
  _PixabayTwoScreenState createState() => _PixabayTwoScreenState();
}

class _PixabayTwoScreenState extends State<PixabayTwoScreen> {
  List<dynamic> _photos = [];

  @override
  void initState() {
    super.initState();
    getPixabayPhotos();
  }

  Future<void> getPixabayPhotos() async {
    try {
      final String url =
          'https://pixabay.com/api/?key=${PIXABAY_KEY}&q=yellow+flowers&image_type=photo';

      final http.Response response = await http.get(url);

      final items = json.decode(response.body)['hits'];

      items.forEach((item) {
        final newPhoto = PixabayPhoto.fromJson(item);
        _photos.add(newPhoto);
      });

      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exapnsion Tile'),
      ),
      body: ListView.builder(
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            key: PageStorageKey<int>(_photos[index].id),
            title: Text(_photos[index].user),
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(_photos[index].userImageURL),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    _photos[index].stat.views > 100000
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            children: <Widget>[
              Image.network(
                _photos[index].webformatURL,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(
                    'size: ${_photos[index].webformatWidth} x ${_photos[index].webformatHeight}'),
              ),
              ExpansionTile(
                key: PageStorageKey<int>(_photos[index].id),
                title: Text('Stats'),
                children: <Widget>[
                  ListTile(
                    title: Text('views: ${_photos[index].stat.views}'),
                  ),
                  ListTile(
                    title: Text('favorites: ${_photos[index].stat.favorites}'),
                  ),
                  ListTile(
                    title: Text('downloads: ${_photos[index].stat.downloads}'),
                  ),
                  ListTile(
                    title: Text('likes: ${_photos[index].stat.likes}'),
                  ),
                  ListTile(
                    title: Text('comments: ${_photos[index].stat.comments}'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
