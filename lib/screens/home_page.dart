import 'package:ar_implementation/components/simple_screen.dart';
import 'package:flutter/material.dart';
import '../components/favorite_page.dart';
import '../components/maps_page.dart';
import '../components/profile_page.dart';
import '../components/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      MapsPage(),
      SimpleScreen(),
      SearchPage(),
      FavoritePage(),
      ProfilePage(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142464),
        leading: IconButton(
          icon: const Icon(Icons.star, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Image.asset('images/profile_icon.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Center(child: pages.elementAt(_selectedIndex)),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF142464),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedIconTheme: const IconThemeData(color: Colors.lightBlue),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location_alt_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
