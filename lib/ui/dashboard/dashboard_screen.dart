import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_starter_app/ui/favorite/favorite_movies_screen.dart';
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
    FavoriteMoviesScreen(),
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
        type: BottomNavigationBarType.fixed,
        items: _mainMenuItems(),
        currentIndex: _selectedIndexBody,
        onTap: (index) {
          setState(() {
            _selectedIndexBody = index;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
    );
  }

  List<BottomNavigationBarItem> _mainMenuItems() {
    return <BottomNavigationBarItem>[
      _mainMenuItemWidget('Home', FontAwesomeIcons.home),
      _mainMenuItemWidget('Search', FontAwesomeIcons.search),
      _mainMenuItemWidget('Favorite', FontAwesomeIcons.bookmark),
      _mainMenuItemWidget('Profile', FontAwesomeIcons.user),
    ];
  }

  BottomNavigationBarItem _mainMenuItemWidget(
      String menuTitle, IconData iconData) {
    return BottomNavigationBarItem(
      activeIcon: Icon(iconData),
      icon: FaIcon(iconData),
      label: menuTitle,
    );
  }
}
