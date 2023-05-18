import 'package:shelf_router/shelf_router.dart';

import '../Handlers/UserHandler.dart';

class UserLoginRoute {
  Router get handler {
    final router = Router()
    ..post(
        '/signin',UserSigninHandler,
      )
    ..get(
        '/login',UserLoginHandler,
      )
    ..post('/post',UserPostHandeler ,
       )
    ..get('/view',retrieveUserHandeler ,
       );

    return router;
  }
}
