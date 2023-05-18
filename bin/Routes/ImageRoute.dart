import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Handlers/imageHandler.dart';



class ImageRoute {
  Router get handler {
    final router = Router()..post('/upload',imageHandler );

    return router;
  }
}
