import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/wallpapers/wallpaper_widget.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => __WallpaperScreenStateState();
}

class __WallpaperScreenStateState extends State<WallpaperScreen> {

  void initState() {
    super.initState();
    // Initialize any data or state here
  }

  getImage() async{
    var client = http.Client();
    
    try {
      var response = await http.get(Uri.https('https://picsum.photos/id/237/200/300'));
      if (response.statusCode >=200 && response.statusCode<300){
          var result = Uri.parse(response.body);
          var imageUrl = result.toString();
          print(imageUrl);
      }
    }
    catch (e) {
      print('Error: $e');
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Wallpapers'),
      ),
      body: StreamBuilder(
        stream: getImage().asStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return WallpaperWidget(imageUrl: snapshot.data.toString());
          }
        },
      ),
    );
  }
}