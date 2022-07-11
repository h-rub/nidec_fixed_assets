import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

Future<bool> saveAsset(
    String ubicacionID,
    String areaID,
    String lineaID,
    String numPedimento,
    String principal,
    String descripcion,
    String marca,
    String modelo,
    String nSerie,
    String inAdicional,
    String year,
    String paisOrigen,
    context) async {
  bool _result = false;
  var _url = Uri.parse("http://fa.syncronik.com/api/fa/create-activo-fijo");
  Map _body = {
    "ubicacion_id": ubicacionID,
    "area_id": areaID,
    "linea_id": lineaID,
    "n_activo_sap": "",
    "n_pedimento": numPedimento,
    "principal": principal,
    "descripcion": descripcion,
    "marca": marca,
    "modelo": modelo,
    "n_serie": nSerie,
    "id_adicional": inAdicional,
    "año": year,
    "pais_origen": paisOrigen,
  };
  EasyLoading.show(status: "Guardando activo");
  var _res = await http.post(_url, body: _body);
  print(_res);
  ;
  if (_res.statusCode == 201) {
    EasyLoading.showSuccess("Activo registrado exitosamente");
    String source = Utf8Decoder().convert(_res.bodyBytes);
    var _jsonResponse = json.decode(source);
    print(_jsonResponse);

    EasyLoading.dismiss();
    _result = true;
  } else if (_res.statusCode == 401) {
    EasyLoading.showError("Ups! Ocurrió un error...",
        duration: const Duration(milliseconds: 3000));
    _result = false;
  } else if (_res.statusCode == 500) {
    EasyLoading.showError("Ups! Ocurrió un error...",
        duration: const Duration(milliseconds: 3000));
    _result = false;
  }
  return _result;
}
