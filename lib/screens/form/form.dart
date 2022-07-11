import 'package:flutter/material.dart';
import 'package:nidec_fixed_assets/screens/home/home_navigation.dart';
import 'package:nidec_fixed_assets/services/save_forms_services.dart';
import 'package:nidec_fixed_assets/tokens/colors.dart';
import 'package:nidec_fixed_assets/tokens/typography.dart';
import 'package:nidec_fixed_assets/widgets/input_model.dart';

class CreateFormScreeen extends StatefulWidget {
  @override
  _CreateFormScreeenState createState() => _CreateFormScreeenState();
}

class _CreateFormScreeenState extends State<CreateFormScreeen> {
  final _formKey = GlobalKey<FormState>();

  int _activeStepIndex = 0;

  // EMBARQUES
  String date = "";
  DateTime selectedDateForm = DateTime.now();
  _selectDate(BuildContext context) async {}

  @override
  void initState() {
    super.initState();
  }

  TextEditingController ubicacion = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController linea = TextEditingController();
  TextEditingController principal = TextEditingController();

  TextEditingController descripcion = TextEditingController();

  // CAJA

  TextEditingController marca = TextEditingController();
  TextEditingController modelo = TextEditingController();

  // INGRESOS

  TextEditingController numeroDeSerie = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController paisOrigen = TextEditingController();
  TextEditingController idAdicional = TextEditingController();
  TextEditingController inSelloEntregadoA = TextEditingController();
  bool inTermsSello = false;
  TextEditingController inDestino = TextEditingController();
  bool inIsExportacion = false;
  TextEditingController inGuardiaEnTurno = TextEditingController();

  // CHECKLIST

  TextEditingController numeroPedimento = TextEditingController();

  bool _s1 = false, _s2 = false, _s3 = false;
  bool _n1 = false, _n2 = false, _n3 = false;

  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: Text('Inventario', style: heading2Black),
          content: Container(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Inventario fisico", style: heading2Primary),
                    const SizedBox(
                      height: 10,
                    ),
                    Input(
                      controller: ubicacion,
                      hintText: "",
                      label: "Ubicación",
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: area,
                            hintText: "",
                            label: "Área",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: linea,
                            hintText: "",
                            label: "Línea",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Input(
                      controller: principal,
                      hintText: "",
                      label: "Principal",
                      inputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Input(
                      controller: descripcion,
                      hintText: "",
                      label: "Descripción",
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: marca,
                            hintText: "",
                            label: "Marca",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: modelo,
                            hintText: "",
                            label: "Modelo",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Input(
                      controller: numeroDeSerie,
                      hintText: "",
                      label: "Número de serie",
                      inputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: year,
                            hintText: "",
                            label: "Año",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: paisOrigen,
                            hintText: "",
                            label: "País de origen",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Input(
                      controller: idAdicional,
                      hintText: "",
                      label: "Información Adicional",
                      inputAction: TextInputAction.next,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: Text('Pedimento', style: heading2Black),
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Pedimento", style: heading2Primary),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    controller: numeroPedimento,
                    hintText: "",
                    label: "Número de pedimento",
                    inputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 8),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ];

  @override
  Widget build(BuildContext context) {
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
                child: Text("Nuevo activo", style: heading2Primary),
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _activeStepIndex,
            steps: stepList(),
            onStepContinue: () async {
              if (_activeStepIndex < (stepList().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                if (await saveAsset(
                    "1",
                    "1",
                    "4",
                    numeroPedimento.text,
                    principal.text,
                    descripcion.text,
                    marca.text,
                    modelo.text,
                    numeroDeSerie.text,
                    idAdicional.text,
                    year.text,
                    paisOrigen.text,
                    "")) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomeNavigation()),
                      (Route<dynamic> route) => false);
                }
              }
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              }
              setState(() {
                _activeStepIndex -= 1;
              });
            },
            onStepTapped: (int index) {
              setState(() {
                _activeStepIndex = index;
              });
            },
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              final isLastStep = _activeStepIndex == stepList().length - 1;
              return Row(
                children: <Widget>[
                  if (_activeStepIndex > 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controls.onStepCancel,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.grey[100],
                        ),
                        child: Text('Atrás', style: bodyBlack),
                      ),
                    ),
                  if (_activeStepIndex > 0) SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: primary,
                      ),
                      onPressed: controls.onStepContinue,
                      child: (isLastStep)
                          ? Text('Enviar', style: bodyWhite)
                          : Text('Siguiente', style: bodyWhite),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
