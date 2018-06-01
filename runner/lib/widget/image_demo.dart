import 'package:flutter/material.dart';
// import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("image"),
      ),
      body: new Stack(
        children: <Widget>[
          //渐隐
          //   children: <Widget>[
          //     new Center(
          //       child: CircularProgressIndicator(),
          //     ),
          //     new Center(
          //       child: FadeInImage.memoryNetwork(
          //         placeholder: kTransparentImage,
          //         image:
          //             'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
          //       ),
          //     )
          //   ],
          // );
          //gif
          //  new Image.network(
          //   'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
          // );
          //cache

          CachedNetworkImage(
            alignment: Alignment.center,
            placeholder: CircularProgressIndicator(),
            imageUrl:
                'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
          ),
        ],
      ),
    ); // TODO: implement build
  }
}
