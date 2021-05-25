import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scopemodel/Model/Post.dart';

class DetailPages extends StatefulWidget {
  List<Post>  posts;
  DetailPages({this.posts});
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  widget.posts.first.title,style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10,),
              Text(
                  widget.posts.first.body
              )


            ],
          ),
        ),
      )
      ,
    );
  }
}
