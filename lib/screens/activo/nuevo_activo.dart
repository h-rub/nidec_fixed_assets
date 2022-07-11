import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NuevoActivo extends StatelessWidget {
  const NuevoActivo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Activo'),
      ),
      body: Center(
        child: Text('Nuevo Activo'),
      ),
    );
  }
}
