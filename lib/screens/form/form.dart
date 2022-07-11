import 'package:flutter/material.dart';
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

  TextEditingController fechaForm = TextEditingController();
  TextEditingController horaEnrampado = TextEditingController();
  TextEditingController horaSalida = TextEditingController();
  TextEditingController lineaCaja = TextEditingController();
  TextEditingController marcaTractor = TextEditingController();
  TextEditingController placasTractor = TextEditingController();
  TextEditingController numeroEconomico = TextEditingController();

  // CAJA

  TextEditingController numeroCaja = TextEditingController();
  TextEditingController placasCaja = TextEditingController();

  // INGRESOS

  TextEditingController inAutorizadoPor = TextEditingController();
  TextEditingController inFactura = TextEditingController();
  TextEditingController inNumeroPallets = TextEditingController();
  TextEditingController inNumeroSello = TextEditingController();
  TextEditingController inSelloEntregadoA = TextEditingController();
  bool inTermsSello = false;
  TextEditingController inDestino = TextEditingController();
  bool inIsExportacion = false;
  TextEditingController inGuardiaEnTurno = TextEditingController();

  // CHECKLIST

  TextEditingController chFechaHoraLlegada = TextEditingController();

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
                      controller: lineaCaja,
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
                            controller: marcaTractor,
                            hintText: "",
                            label: "Área",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: placasTractor,
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
                      controller: numeroEconomico,
                      hintText: "",
                      label: "Principal",
                      inputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Input(
                      controller: lineaCaja,
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
                            controller: numeroCaja,
                            hintText: "",
                            label: "Marca",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: placasCaja,
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
                      controller: inAutorizadoPor,
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
                            controller: inFactura,
                            hintText: "",
                            label: "Año",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Input(
                            controller: inNumeroPallets,
                            hintText: "",
                            label: "País de origen",
                            inputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Input(
                      controller: inNumeroSello,
                      hintText: "",
                      label: "ID Adicional",
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
                    controller: chFechaHoraLlegada,
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
            onStepContinue: () {
              if (_activeStepIndex < (stepList().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                print('Submited');
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
