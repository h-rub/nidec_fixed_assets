import 'package:flutter_svg/flutter_svg.dart';
import 'package:nidec_fixed_assets/providers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:nidec_fixed_assets/tokens/typography.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'package:nidec_fixed_assets/screens/home/home_screens.dart';

// import '../../services/theme_service.dart';
// import '../../../src/themes/theme.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code),
        onPressed: () async {
          PermissionStatus status = await _getCameraPermission();
          Navigator.of(context).pushNamed("/read_qr");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(),
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      appBar:
          // make appbar with logo and title
          AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Image.asset(
            //   'embraco-logo.svg',
            //   height: 40,
            // ),
            SvgPicture.asset("assets/embraco-logo.svg",
                semanticsLabel: 'Logo de Embraco', width: 100),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text("FA Management", style: subheadingPrimary),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Pages(),
    );
  }
}

Widget appBar(context) {
  return AppBar(
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
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/me');
          },
          child: Container(
            width: 47,
            height: 47,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/default-profile.png"),
                    fit: BoxFit.cover)),
          ),
        ),
      ],
    ),
  );
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationInfo = Provider.of<NavigationInfo>(context);

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: navigationInfo.currentPage,
      onTap: (index) {
        navigationInfo.currentPage = index;
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historial"),
      ],
    );
  }
}
