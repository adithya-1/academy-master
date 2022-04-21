import 'package:academy_manager/Constants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:academy_manager/pages/attendance.dart';
import 'package:academy_manager/pages/feedback.dart';
import 'package:academy_manager/pages/notifications.dart';
import 'package:academy_manager/services/auth.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.userId, this.auth, this.onSignedOut})
      : super(key: key);
  final BaseAuth auth;

  final VoidCallback onSignedOut;
  final String userId;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.greenColor,
          title: Text("Academy Manager"),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            backgroundColor: const Color(0xFFf96327),
          ),
          child: Drawer(
            child: ListView(
              reverse: true,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Center(
                        child: Text(
                      'Log Out',
                      style: TextStyle(fontSize: 20),
                    )),
                    onTap: widget.onSignedOut,
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          backgroundColor: Colors.white,

          items: [
            BottomNavyBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Constants.greenColor,
              ),
              title: Text(
                'Attendance',
                style: TextStyle(color: null),
              ),
              activeColor: Constants.greenColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(color: null),
              ),
              activeColor: Constants.greenColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.feedback),
              title: Text(
                'Feedback',
                style: TextStyle(color: null),
              ),
              activeColor: Constants.greenColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          Attendance(
            userId: widget.userId,
          ),
          Notifications(),
          FeedBack(
            userId: widget.userId,
          )
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
