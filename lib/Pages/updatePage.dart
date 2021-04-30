import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopemodel/ModelView/ViewModel.dart';
import 'package:sizer/sizer.dart';



class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  HomeScopedModel model=HomeScopedModel();
  bool isLoading = false;
  final titleController =new TextEditingController();
  final bodyController =new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading=false;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.purple,
        body:ScopedModel<HomeScopedModel>(
            model: model,
            child: ScopedModelDescendant<HomeScopedModel>(
              builder: (context, child, model){
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 70),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: 6.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)
                              ),child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Title",
                                  hintStyle: TextStyle(color: Colors.white,fontSize: 16)
                              ),
                            ),
                            ),SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: 6.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)
                              ),child: TextField(
                              controller: bodyController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Body",
                                  hintStyle: TextStyle(color: Colors.white,fontSize: 16)
                              ),
                            ),
                            ),
                            SizedBox(height: 50,),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              height: 9.h,
                              decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10)
                              ),child: FlatButton(
                              splashColor: Colors.blue,
                              onPressed: (){
                                model.sendApiToServers(titleController, bodyController, context);
                                Navigator.of(context).pop();
                              },child: Text("update  it",style: TextStyle(
                                color: Colors.grey,fontSize: 16
                            ),),

                            ),
                            )



                          ],),),
                    ),model.isLoading?Center(child: CircularProgressIndicator(),):SizedBox.shrink()
                  ],
                );
              },)));

  }

}













