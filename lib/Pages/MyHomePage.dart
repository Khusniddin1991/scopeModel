

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopemodel/Model/Post.dart';
import 'package:scopemodel/ModelView/ViewModel.dart';
import 'package:scopemodel/ModelView/ViewModel.dart';
import 'package:scopemodel/ModelView/ViewModel.dart';
import 'package:scopemodel/Pages/updatePage.dart';



import 'DetailPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeScopedModel viewModel  = HomeScopedModel();
  Future openDetail() async{
    Map results = await Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context){
          return new DetailPage();
        }
    ));
    if(results != null && results.containsKey("data")){
      print(results['data']);
      viewModel.apiPostList();
    }
  }
  Future openDetails() async{
    Map results = await Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context){
          return new UpdatePage();
        }
    ));
    if(results != null && results.containsKey("data")){
      print(results['data']);
      viewModel.apiPostList();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scoped Model"),
        ),
        body: ScopedModel<HomeScopedModel>(
          model: viewModel,
          child: ScopedModelDescendant<HomeScopedModel>(
            builder: (context, child, model){
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: viewModel.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfPost(viewModel, viewModel.items[index]);
                    },
                  ),
                  viewModel.isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            openDetail();
          },
          child: Icon(Icons.add),
        ));
  }
  Widget itemOfPost(HomeScopedModel viewModel, Post post) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title.toUpperCase(),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(post.body),
            ],
          ),
        ),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Update',
            color: Colors.indigo,
            icon: Icons.edit,
            onTap: () {
              openDetails();
            },
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              viewModel.apiPostDelete(post).then((value) => {
                if(value) viewModel.apiPostList(),
              });
            },
          ),
        ],
      );
    }
}
// Loading complete
