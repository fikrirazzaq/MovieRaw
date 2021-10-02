import 'package:flutter/material.dart';
import 'package:movies_starter_app/ui/home/home_screen.dart';
import 'package:movies_starter_app/values/colors.dart';
import 'package:movies_starter_app/values/styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndexBody = 0;

  List<Widget> _dashboardBodyWidgets = <Widget>[
    HomeScreen(),
    Placeholder(color: Colors.red),
    Placeholder(color: Colors.blue),
    Placeholder(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndexBody,
        children: _dashboardBodyWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: _mainMenuItems(),
        currentIndex: _selectedIndexBody,
        onTap: (index) {
          setState(() {
            _selectedIndexBody = index;
          });
        },
        selectedLabelStyle: selectedMainMenuStyle,
        unselectedLabelStyle: unselectedMainMenuStyle,
      ),
    );
  }

  List<BottomNavigationBarItem> _mainMenuItems() {
    return <BottomNavigationBarItem>[
      _mainMenuItemWidget('Home', Icons.home),
      _mainMenuItemWidget('Search', Icons.search),
      _mainMenuItemWidget('Favorite', Icons.favorite),
      _mainMenuItemWidget('Profile', Icons.person),
    ];
  }

  BottomNavigationBarItem _mainMenuItemWidget(
      String menuTitle, IconData iconData) {
    return BottomNavigationBarItem(
      activeIcon: Padding(
        padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
        child: Icon(
          iconData,
          color: colorSecondary,
        ),
      ),
      icon: Padding(
        padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
        child: Icon(
          iconData,
          color: colorGreyLight,
        ),
      ),
      label: menuTitle,
    );
  }
}
