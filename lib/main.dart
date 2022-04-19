import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

int a_index = 0;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoView_408630167',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final assets = [
    'assets/1.jpg',
    'assets/2.png',
    'assets/3.png',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('PhotoView_408630167',
        style:TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
    );

    final eachWidget = Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/1.jpg'),
              onTap: () => setGallery(0,context),
            ),

          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/2.png'),
              onTap: () => setGallery(1,context),
            ),

          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/3.png'),
              onTap: () => setGallery(2,context),
            ),

          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/4.jpg'),
              onTap: () => setGallery(3,context),
            ),

          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/5.jpg'),
              onTap: () => setGallery(4,context),
            ),

          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/6.jpg'),
              onTap: () => setGallery(5,context),
            ),

          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/7.jpg'),
              onTap: () => setGallery(6,context),
            ),

          ),
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(20),

            child: InkWell(
              child: Image.asset('assets/8.jpg'),
              onTap: () => setGallery(7,context),
            ),

          ),
        ],
      ),
    );

    final homepage = Scaffold(
      appBar: appBar,
      body: eachWidget,
    );

    return homepage;
  }

  void setGallery(int i, BuildContext context) {
    a_index = i;
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
        GalleryWidget(assets: assets, index: i,),),);
  }
}

class GalleryWidget extends StatefulWidget{
  final List<String> assets;
  final int index;

  const GalleryWidget({this.assets,this.index});

  @override
  State<StatefulWidget> createState() {
    return _GalleryWidgetState();
  }

}
class _GalleryWidgetState extends State<GalleryWidget>{
  PageController pc =PageController(initialPage: a_index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        pageController: pc,
        itemCount: widget.assets.length,

        builder: (context,index){
          final _assets = widget.assets[index];
          return PhotoViewGalleryPageOptions(
            minScale: PhotoViewComputedScale.contained*0.5,
            maxScale: PhotoViewComputedScale.contained*2.5,
            imageProvider: AssetImage(_assets),
          );
        },

        onPageChanged: (int index){
          setState(() {
            a_index=index;
          });
        },
      ),

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('photo'+(a_index+1).toString()),
      ),
    );
  }
}