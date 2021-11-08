import 'package:http/http.dart' as http;

import 'classes/reqres_pais.dart';
import 'classes/reqres_respuesta.dart';

void getReqResService() {
  final url = Uri.parse("https://reqres.in/api/users?page=2");
  http.get(url).then((res) {
    /* final body = jsonDecode(res.body);
    print(body);
    print('Page: ${body['page']}');
    print('Per_page: ${body['per_page']}');
    print('id del terccer elemento: ${body['data'][2]['id']}'); */

    final resReqRes = reqResRespuestaFromJson(res.body);
    print('Page: ${resReqRes.page}');
    print('Per_page: ${resReqRes.perPage}');
    print('id del terccer elemento: ${resReqRes.data[2].id}');
  });
}

void getReqResPais() {
  final url = Uri.parse("https://restcountries.com/v3.1/name/colombia");
  http.get(url).then((res) {
    final resReqResPais = reqResPaisFromJson(res.body)[0];
    print(resReqResPais);
    print('===========================');
    print('Pais: ${resReqResPais.name.common}');
    print('Población: ${resReqResPais.population}');
    print('Fronteras:');
    resReqResPais.borders.forEach((element) {
      print('    $element');
    });
    print('languages: ${resReqResPais.languages.spa}');
    print('Latitud : ${resReqResPais.latlng[0]}');
    print('Longitud : ${resReqResPais.latlng[1]}');
    print(
        'Moneda: ${resReqResPais.currencies.cop.name} ${resReqResPais.currencies.cop.symbol}');
    print('Bandera: ${resReqResPais.flags.png}');
    print('===========================');
  }).catchError((error) {
    print(error);
  });
}
