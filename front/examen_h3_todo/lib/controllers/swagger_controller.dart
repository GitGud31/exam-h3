import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/consts/urls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final swaggerP = Provider<Swagger>((ref) {
  return Swagger.create(
    baseUrl: Uri.parse(Url.baseUrl),
  );
});
