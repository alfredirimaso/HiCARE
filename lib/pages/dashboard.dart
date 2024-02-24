import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/map.dart';
import '/profile_page.dart';
import 'post.dart';
import 'reminders.dart';
import 'chat_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<List<double>> charts = [
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ]
  ];

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.pink,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    ),
                    child: const Text("My Profile"),
                  ),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            _buildTile(
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Months and Days left',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18.0, // Increase font size
                    ),
                  ),
                  Text(
                    '05/15',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 48.0, // Increase font size
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Handle tap
              },
            ),

            _buildTile(
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                    color: Colors.teal,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 48.0, // Increase icon size
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text(
                    'Personal Chat',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0, // Increase font size
                    ),
                  ),
                  Text(
                    'Trusted, Quick',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0, // Increase font size
                    ),
                  ),
                ],
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ChatPage()),
              ),
            ),

            _buildTile(
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                    color: Color.fromRGBO(255, 193, 7, 1),
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 48.0, // Increase icon size
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text(
                    'Reminders',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0, // Increase font size
                    ),
                  ),
                  Text(
                    'vaccinations, Appointments',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16.0, // Increase font size
                    ),
                  ),
                ],
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PregnancyCheckApp()),
              ),
            ),

// ... Repeat the same pattern for other tiles ...

            _buildTile(
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Community/Forum',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18.0, // Increase font size
                    ),
                  ),
                  Text(
                    'Tap to Read',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0, // Increase font size
                    ),
                  ),
                ],
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ShopItemsPage()),
              ),
            ),

            _buildTile(
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Any Worry!',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 18.0, // Increase font size
                    ),
                  ),
                  Text(
                    'Findout!',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0, // Increase font size
                    ),
                  ),
                ],
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => const PregnantMothersChatbotApp()),
              ),
            ),
          ],
          // StaggeredGridView.count(
          //   crossAxisCount: 4,
          //   staggeredTiles: const [
          //     StaggeredTile.extent(2, 110.0),
          //     StaggeredTile.extent(1, 180.0),
          //     StaggeredTile.extent(1, 180.0),
          //     StaggeredTile.extent(2, 220.0),
          //     StaggeredTile.extent(2, 110.0),
          //     StaggeredTile.extent(2, 110.0),
          //   ],
          //   // Other properties...
          // ),
        )));
  }

  Widget _buildTile(Widget child, {Function()? onTap}) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: const Color(0x802196F3),
      child: InkWell(
        onTap: onTap != null
            ? () => onTap()
            : () {
                if (kDebugMode) {
                  print('Not set yet');
                }
              },
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: child,
        ),
      ),
    );
  }
}
