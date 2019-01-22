import 'package:flutter/material.dart';
import '../../models/ImageModels.dart';

class ImageList extends StatelessWidget{
  final List<ImageModels> images;  
  ImageList(this.images);

  Widget build(context){
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index){
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModels imageModel){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(imageModel.url),
            padding: EdgeInsets.only(
              bottom : 10.0
            ),
          ),
          
          Text(imageModel.title, textAlign: TextAlign.center, style: TextStyle(color: Colors.blue,), ),
        ],

      )
        
    );
  }
} 
