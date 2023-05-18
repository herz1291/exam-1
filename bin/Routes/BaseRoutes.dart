import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';



import '../Responses/BaseResponse/echoHandler.dart';
import '../Responses/BaseResponse/rootHandler.dart';
import 'ImageRoute.dart';
import 'UserLoginRoute.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..get('/echo/<message>', echoHandler)
      ..mount('/user',UserLoginRoute().handler)
      ..mount('/images', ImageRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.forbidden("you are try access page name ${req.url}");
      });

    return router;
  }
}