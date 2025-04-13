import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/wallpapers/wallpaper_widget.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => __WallpaperScreenStateState();
}

class __WallpaperScreenStateState extends State<WallpaperScreen> {
  Uint8List? imageUrl;

  void initState() {
    super.initState();
    // Initialize any data or state here
    getImage();
  }

  Future<void> getImage() async{
    var client = http.Client();
    
    try {
      var response = await http.get(Uri.parse('https://picsum.photos/id/237/200/300'));
      if (response.statusCode >=200 && response.statusCode<300){
          imageUrl = response.bodyBytes; // Here was the error firstly where I was trying to fetch image as body now have replaced it with bodyBytes.
          setState(() {                   // took refrence from Quora and stackoverflow.
            imageUrl = imageUrl;
          });
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
      //Firstly I have used the StreamBuilder widget to get the image from the API and then I have directly used the WallpaperWidget to display the image. 
      //As there is no need of stream builder here I have removed it and used the WallpaperWidget directly.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Image from API',
            ),
            imageUrl != null ? WallpaperWidget(imageUrl: imageUrl!) : CircularProgressIndicator(),
            ElevatedButton(onPressed: (){
              setState(() {
                getImage();
              });
            }, child: Text('Refresh Image')),
          ],
        ),
      ),
    );
  }
}