// import 'package:ctpat/src/providers/navegacion_info.dart';
// import 'package:ctpat/src/screens/history/history_page.dart';
// import 'package:ctpat/src/screens/inicio/home.dart';
import 'package:flutter/material.dart';
import 'package:nidec_fixed_assets/providers/navigation.dart';
import 'package:nidec_fixed_assets/screens/form/form.dart';
import 'package:nidec_fixed_assets/screens/history/history_page.dart';
import 'package:nidec_fixed_assets/screens/home/home.dart';
import 'package:nidec_fixed_assets/screens/scan_qr/scan_qr.dart';
import 'package:provider/provider.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    final navigationInfo = Provider.of<NavigationInfo>(context);
    return PageView(
      controller: navigationInfo.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Home(),
        HistoryPage(),
      ],
    );
  }
}
