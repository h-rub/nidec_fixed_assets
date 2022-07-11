import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nidec_fixed_assets/screens/home/home_navigation.dart';
import 'package:nidec_fixed_assets/tokens/colors.dart';
import 'package:nidec_fixed_assets/tokens/typography.dart';

import "package:nidec_fixed_assets/utils/fetch_json.dart";

class DetalleActivo extends StatelessWidget {
  DetalleActivo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String consecutivo = "LC1";
    String url = "http://fa.syncronik.com/api/fa/detail-a-f?consecutivo=";

    final arg = ModalRoute.of(context)?.settings.arguments;

    final parsedArg = arg.toString().isNotEmpty ? arg.toString() : "";

    final String finalUrl;
    if (parsedArg.isNotEmpty && arg != null) {
      finalUrl = url + parsedArg;
    } else {
      finalUrl = url;
    }

    Future data = fetchJson(finalUrl);

    //   final arg = ModalRoute.of(context)?.settings.arguments;

    // final parsedArg = arg.toString().isNotEmpty ? arg.toString() : "";

    // final String finalUrl;
    // if (parsedArg.isNotEmpty && arg != null) {
    //   finalUrl = apiUrl + parsedArg;
    // } else {
    //   finalUrl = apiUrl;
    // }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/nidec-embraco.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text("Detalles del activo", style: heading2Primary),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Activo: $parsedArg", style: heading),
                      Text("Conciliación completa", style: subheadingDone)
                    ],
                  ),
                  const Icon(Icons.check_circle, color: done, size: 36)
                ],
              ),
              const SizedBox(height: 12),
              const PropiedadesActivo(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Pedimento'),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: buttonSecondary,
                      child: const Text('Factura')),
                  ElevatedButton(
                    onPressed: () {},
                    style: buttonSecondary,
                    child: const Text('Documentación'),
                  )
                ],
              ),
              FutureBuilder(
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      Map data = snapshot.data[0];

                      return Column(
                          children: data.entries
                              .map((e) =>
                                  // Map entry = e;
                                  ListTile(
                                      leading: const Icon(Icons.list),
                                      title: Text(e.key),
                                      subtitle: Text(e.value.toString())))
                              .toList());
                      // return Text(snapshot.data.toString());
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  future: data),
            ])
          ]),
        ));
  }
}

class Activo {
  final String descripcion;
  final String estatusActivo;
  final String estatusEntrega;
  final String ultimoPedimento;
  final String proveedor;
  final String paisOrigen;
  final String cantidadUnitaria;
  final String valorUnitario;

  Activo(
      this.descripcion,
      this.estatusActivo,
      this.estatusEntrega,
      this.ultimoPedimento,
      this.proveedor,
      this.paisOrigen,
      this.cantidadUnitaria,
      this.valorUnitario);
}

dynamic json = {
  "Descripción":
      "MAQUINA PARA EL FOSFATADO DE METALES POR INMERSION CON ELEMENTOS DESENSAMBLADOS",
  "Estatus de activo": "Amarillo",
  "Estatus de entrega": "Entregado",
  "Último pedimento": "160 3278 1003341",
  "Proveedor": "EMBRACO SLOVAKIA, S.R.O.",
  "País de origen": "China",
  "Cantidad por activo unitario": "1",
  "Valor por activo (\$USD)": "\$78,686.14",
};

class PropiedadesActivo extends StatelessWidget {
  const PropiedadesActivo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...json.entries.map((entry) {
          TextStyle fieldStyle = fieldValue;

          switch (entry.value) {
            case "Amarillo":
              fieldStyle = fieldValueWarning;
              break;
            case "Entregado":
              fieldStyle = fieldValuePrimary;
              break;
            default:
          }

          return PropiedadActivo(entry.key, entry.value, fieldStyle);
        }),
      ],
    );
  }
}

class PropiedadActivo extends StatelessWidget {
  final String campo;
  final String valor;
  final TextStyle estilo;
  const PropiedadActivo(this.campo, this.valor, this.estilo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: RichText(
          text: TextSpan(
              text: "$campo: ",
              style: fieldLabel,
              children: [TextSpan(text: valor, style: estilo)])),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: dividerColor,
    );
  }
}
