import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart' as dio;

class DioMock extends Mock implements dio.Dio {
  static void whenFindaAll(Dio dioMock, List<Map<String, dynamic>> listMap) {
    when(() => dioMock.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        )).thenAnswer(
      (_) async => dio.Response(
        data: listMap,
        statusCode: 200,
        requestOptions: dio.RequestOptions(path: ''),
      ),
    );
  }
}
