import 'dart:convert';

import 'package:nidec_fixed_assets/providers/user.dart';
import 'package:nidec_fixed_assets/screens/home/home_navigation.dart';
// import 'package:nidec_fixed_assets/screens/homepage/home_page.dart';
// import 'package:nidec_fixed_assets/themes/theme.dart';
import 'package:nidec_fixed_assets/tokens/colors.dart';
import 'package:nidec_fixed_assets/tokens/typography.dart';
import 'package:nidec_fixed_assets/utils/alert_dialog.dart';
// import 'package:nidec_fixed_assets/widgets/input_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nidec_fixed_assets/widgets/input_model.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controllers form
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  // Shared Preferencess
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  // Login API Call section
  signIn(String email, String password, userInfo) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'apikey': 'cFmS80yo.noGef99U2EGqhARloqbE1qEhDFKVLIih'
    };
    //final SharedPreferences prefs = await _prefs;
    final _box = GetStorage();
    String url = "https://api.embraco.com/ctpat/forms/auth/login/";
    Map body = {"email": email, "password": password};
    EasyLoading.show(status: "Cargando...");
    var jsonResponse;
    var res = await http.post(Uri.parse(url),
        body: body, headers: requestHeaders
        // headers: {
        //   //'Authorization': "Token ${token}",
        //   'Authorization': 'Api-Key TzMKJVoE.1bcN3fRTRZnDSO4IlJ6gvblHl2J7KBf5',
        //   'Content-Type': 'application/json; charset=utf-8'
        // },
        );

    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print("Status code ${res.statusCode}");
      print("Response JSON ${res.body}");
      EasyLoading.showSuccess("Bienvenido");

      EasyLoading.dismiss();

      if (jsonResponse != Null) {
        setState(() {
          _isLoading = false;
        });

        _box.write("user_id", jsonResponse['id']);
        _box.write("email", jsonResponse['email']);
        _box.write("token", jsonResponse['token']);

        userInfo.uid = jsonResponse['id'];
        userInfo.firstName = jsonResponse['first_name'];
        userInfo.lastName = jsonResponse['last_name'];
        userInfo.email = jsonResponse['email'];
        // userInfo.company = jsonResponse['company'];

        // String urlPhoto =
        //     "http://rotary.syncronik.com/api/v1/profile-pic/${userInfo.uid}";
        // var res_photo = await http.get(urlPhoto);
        // try {
        //   var jsonResponsePicture = json.decode(res_photo.body);
        //   userInfo.urlPicture = jsonResponsePicture['picture'];
        //   print("Picture User info: ${userInfo.urlPicture}");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => HomeNavigation()),
            (Route<dynamic> route) => false);
        // } catch (e) {
        //   Navigator.of(context).pushNamed('/wait');
        // }
      }
    } else if (res.statusCode == 401) {
      setState(() {
        _isLoading = false;
      });
      print("No existe el usuario");
      showAlertDialog("Error", "Email o contrase??a incorrectos", context);
    } else if (res.statusCode == 500) {
      EasyLoading.showError("Ups! Ocurri?? un error...",
          duration: const Duration(milliseconds: 3000));
      print("Error del servidor");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final heightContainerTop = height / 2.8;
    final width = MediaQuery.of(context).size.width;
    final userInfo = Provider.of<UserInfo>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // color: primary,
                height: heightContainerTop,
                width: width,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            'https://static.turbosquid.com/Preview/2020/05/19__04_38_47/warehouse_logistic_2_lowpoly_render1_0025.jpg30412645-4930-4235-B4F3-2ABBBB547170Large.jpg')),
                  ),
                ),
              ),
              Container(
                  color: Colors.grey[100],
                  width: MediaQuery.of(context).size.width,
                  height: height - heightContainerTop,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: ListView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: <Widget>[
                          Text(
                            'Iniciar sesi??n',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          Input(
                              icon: Icon(Icons.home),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              autofillHint: [AutofillHints.email],
                              label: "Correo electr??nico / Usuario",
                              hintText: "Correo electr??nico / Usuario",
                              prefixIcon: Icon(Icons.person_sharp),
                              autoFocus: true,
                              validator: (value) => !isEmail(value)
                                  ? "Ingrese un email valido"
                                  : null),
                          SizedBox(height: 10),
                          PasswordField(
                              label: "Contrase??a",
                              hintText: "Escriba su contrase??a",
                              controller: _passwordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Este campo es requerido";
                                }
                              }),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: MaterialButton(
                              onPressed: () {
                                _emailController.text == "" ||
                                        _passwordController.text == ""
                                    ? showAlertDialog(
                                        "Error",
                                        "Todos los campos son requeridos",
                                        context)
                                    :
                                    // Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) => HomePage()),
                                    //     ModalRoute.withName("/Home"));
                                    // // Call login service
                                    // signIn(_emailController.text,
                                    //     _passwordController.text, userInfo);
                                    print("Login");
                                signIn(_emailController.text,
                                    _passwordController.text, userInfo);
                              },
                              child: Text(
                                'Iniciar sesi??n',
                                // style: subHeading2White,
                              ),
                              color: primary,
                              elevation: 0,
                              minWidth: 400,
                              height: 50,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 25),
                          //   child: Center(
                          //     child: RichText(
                          //       text: TextSpan(children: [
                          //         TextSpan(
                          //             recognizer: TapGestureRecognizer()
                          //               ..onTap = () =>
                          //                   Navigator.pushReplacement(
                          //                       context,
                          //                       MaterialPageRoute(
                          //                           builder: (context) =>
                          //                               HomePage())),
                          //             text: "??Olvidaste tu contrase??a?",
                          //             style: bodyLink)
                          //       ]),
                          //     ),
                          //   ),
                          // ),
                        ]),
                  ))
            ]),
      ),
    );
  }
}
