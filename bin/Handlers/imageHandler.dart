import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

Future<Response> imageHandler(Request req) async {
  try {
    final contentType = MediaType.parse(req.headers['Content-Type']!);

    final body = await req.read().expand((element) => element).toList();
    final file = File(
        'bin/images/image${DateTime.now()}.${contentType.mimeType.replaceAll('image/', '')}',);

    await file.writeAsBytes(body);

    return Response.ok('Upload image successfully');
  } catch (e) {}

  return Response.ok('');
}