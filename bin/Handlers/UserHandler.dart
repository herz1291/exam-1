import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../Models/UserInfo.dart';
import '../Models/UserPost.dart';

List<UserInfo> users = [];
List<UserPost> posts = [];

Future<Response> UserSigninHandler(Request req) async {
  final body = await req.readAsString();
  var user = UserInfo.fromJson(jsonDecode(body));
  users.add(user);

  return Response.ok("new user Signin");
}

Future<Response> UserLoginHandler(Request req) async {
  final body = await req.readAsString();
  var queryUser = UserInfo.fromJson(jsonDecode(body));
  var foundUser = users.firstWhere((uSer) => uSer.id == queryUser.id);

  if (foundUser.email == queryUser.email &&
      foundUser.password == queryUser.password) {
    return Response.ok('user logged');
  } else {
    return Response.forbidden('password or username is wrong');
  }
}

Future<Response> UserPostHandeler(Request req) async {
  final body = await req.readAsString();
  var post = UserPost.fromJson(jsonDecode(body));
  posts.add(post);

  return Response.ok('new post has been added');
}

Future<Response> retrieveUserHandeler(Request req, String id) async {
  try {
    int idPosts = int.parse(id);
    final body = await req.readAsString();
    var queryUser = UserPost.fromJson(jsonDecode(body));
    //var foundUser = posts.firstWhere((uSer) => uSer.id == queryUser.id);

    UserPost selectposts = posts.firstWhere((element) => element.id == idPosts);

    return Response.ok(json.encode(selectposts.toJson()),
        headers: {'Content-type': 'Applocation.json'});
  } catch (error) {
    print(error);

    return Response.notFound("Sorry not found");
  }
}
