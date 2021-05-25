import 'package:flutter_test/flutter_test.dart';
import 'package:scopemodel/Controller/Network.dart';
import 'package:scopemodel/Model/Post.dart';

main(){

  test("check data which gets into from api", () async {
    final response=await Network.GET(Network.API_LIST, Network.paramsEmpty());
    List<Post> users=Network.parsePostList(response);
    expect(users, isNotNull);
  });

  test("check data which gets into from api", () async {
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    List<Post> users = Network.parsePostList(response);
    expect(users.length, greaterThan(0));
  });

}