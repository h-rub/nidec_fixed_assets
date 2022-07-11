import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nidec_fixed_assets/tokens/colors.dart';
import 'package:nidec_fixed_assets/utils/fetch_json.dart';

class Historial extends StatelessWidget {
  Historial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = "http://fa.syncronik.com/api/fa/list-last-five";

    Future data = fetchJson(url);

    return Container(
      decoration: const BoxDecoration(color: bgGray),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Map activo = snapshot.data[index];
                    return ActivoTile(activo);
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: data),
      ),
    );
  }
}

class ActivoTile extends StatelessWidget {
  final Map activo;
  const ActivoTile(this.activo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          // final box = GetStorage();
          // box.write("shipmentID", report['pk']);
          // TODO: Implementar provider de activos
          // shippingInfo.id = report['pk'];
          // Navigator.pushNamed(
          //     context, '/detalle-activo');
          Navigator.pushNamed(context, "/detalle-activo",
              arguments: activo["consecutivo"]);
        },
        leading: SvgPicture.asset("assets/icons/activo.svg",
            semanticsLabel: 'Ícono de activo', width: 32),
        trailing: activo["is_consiliacion_completa"]
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.warning, color: Colors.yellow),
        title: Text(activo['principal']),
        subtitle: Text("${activo['descripcion']}-${activo['consecutivo']}"),
      ),
    );
  }
}
