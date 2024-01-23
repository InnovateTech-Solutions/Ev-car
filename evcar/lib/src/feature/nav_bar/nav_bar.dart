import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/view/pages/google_map_page.dart';
import 'package:evcar/src/feature/maintenance/view/maintenance_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  static final List<Widget> _widgetsOptions = [
    const GoogleMapPage(),
    MaintenancePage(),
  ];
  final RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: _widgetsOptions.elementAt(_currentIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontFamily: 'Cairo-Medium',
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Cairo-Medium',
          ),
          fixedColor: AppTheme.lightAppColors.mainTextcolor,
          backgroundColor: AppTheme.lightAppColors.primary,
          currentIndex: _currentIndex.value,
          onTap: (index) {
            _currentIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/navBar/electricity.svg',
                width: 24,
                height: 24,
              ),
              label: 'شواحن',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.build_outlined,
              ),
              label: 'الصيانه',
            ),
          ],
        ),
      ),
    );
  }
}
