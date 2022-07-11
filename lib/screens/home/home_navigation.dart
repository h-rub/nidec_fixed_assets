import 'package:flutter_svg/flutter_svg.dart';
import 'package:nidec_fixed_assets/providers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:nidec_fixed_assets/tokens/colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavigationBar(),
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      appBar:
          // make appbar with logo and title
          appBar(),

      body: Pages(),
    );
  }
}

class appBar extends StatelessWidget implements PreferredSizeWidget {
  const appBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: primary,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset("assets/embraco-logo.svg",
                semanticsLabel: 'Logo de Embraco', width: 100),

            SvgPicture.asset("assets/icons/user_profile.svg",
                semanticsLabel: 'Foto del usuario', width: 32),
            // const Icon(Icons.person, color: Colors.black)
          ],
        ),
      ),
      // centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// Widget appBar(context) {
//   return AppBar(
//     backgroundColor: Colors.white,
//     brightness: Brightness.light,
//     elevation: 0,
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Container(
//           width: 100,
//           height: 50,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage('assets/nidec-embraco.png')),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.of(context).pushNamed('/me');
//           },
//           child: Container(
//             width: 47,
//             height: 47,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: AssetImage("assets/default-profile.png"),
//                     fit: BoxFit.cover)),
//           ),
//         ),
//       ],
//     ),
//   );
// }

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationInfo = Provider.of<NavigationInfo>(context);

    return BottomNavigationBar(
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
