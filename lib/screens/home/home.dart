import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../helper/Themes.dart';
import '../homefrags/history.dart';
import '../homefrags/hometab.dart';
import '../homefrags/notifications.dart';
import '../homefrags/profile.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final screens = [
    const hometab(),
    const HistoryScreen(),
    const Notifications(),
    const profile()
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,

      // CRITICAL for body flowing under FAB
      body: SafeArea(
        bottom: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        // ↑ SafeArea(bottom:false) allows Scaffold body:+extendBody: to hit bottom edge
      ),
      // ↓ Location: centerDocked positions notched FAB in center of BottomAppBar ↓

      bottomNavigationBar: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          elevation: 20,
          child: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            showSelectedLabels: true,
            selectedLabelStyle:
                myRegularFont.copyWith(fontWeight: FontWeight.bold),
            unselectedLabelStyle: myRegularFont,
            elevation: 20,
            currentIndex: _selectedIndex,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            backgroundColor: Colors.white,
            selectedItemColor: Theme.of(context).colorScheme.onSurface,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                  activeIcon:
                      Icon(Icons.home_filled, size: 21, color: primaryColor),
                  icon: Icon(Icons.home_filled, size: 21, color: Colors.grey),
                  label: 'Home'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.access_time_filled_rounded,
                      size: 21, color: primaryColor),
                  icon: Icon(Icons.access_time_filled_rounded,
                      size: 21, color: Colors.grey),
                  label: 'History'),
              BottomNavigationBarItem(
                  activeIcon:
                      Icon(Icons.notifications, size: 21, color: primaryColor),
                  icon: Icon(Icons.notifications, size: 21, color: Colors.grey),
                  label: 'Explore'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person, size: 25, color: primaryColor),
                  icon: Icon(Icons.person, size: 25, color: Colors.grey),
                  label: 'Profile')
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 12),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add",
                      style: myRegularFont.copyWith(
                          color: primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 25 / 12),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  index == 0
                                      ? "Add \nCatalog"
                                      : index == 1
                                          ? "Add \nPurchaser"
                                          : "Add \nChallan",
                                  style: myRegularFont.copyWith(fontSize: 18),
                                ),
                              )
                            ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
