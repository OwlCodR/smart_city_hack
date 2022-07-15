import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_hack/constants/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 33,
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Get.toNamed(AppConstants.routes.profile),
              child: Image.asset(
                'assets/images/avatar.png',
                width: 40,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage('assets/images/home.png')),
            label: 'Home',
            backgroundColor: AppConstants.colors.darkBlue,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage('assets/images/edit.png')),
            label: 'Goals',
            backgroundColor: AppConstants.colors.darkBlue,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage('assets/images/star.png')),
            label: 'Dreams',
            backgroundColor: AppConstants.colors.darkBlue,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage('assets/images/exit.png')),
            label: 'Exit',
            backgroundColor: AppConstants.colors.darkBlue,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Card(
            color: Colors.amber[600],
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: const Center(child: Text('Entry A'))),
          ),
          Card(
            color: Colors.amber[600],
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: const Center(child: Text('Entry A'))),
          ),
          Card(
            color: Colors.amber[600],
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: const Center(child: Text('Entry A'))),
          ),
          Card(
            color: Colors.amber[600],
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: const Center(child: Text('Entry A'))),
          ),
          Card(
            color: Colors.amber[600],
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: const Center(child: Text('Entry A'))),
          ),
          Card(
            color: Colors.amber[600],
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: const Center(child: Text('Entry A'))),
          ),
          Card(
            color: Colors.amber[600],
            child: Container(
                constraints: const BoxConstraints(
                  minHeight: 100,
                ),
                child: const Center(child: Text('Entry A'))),
          ),
        ],
      ),
    );
  }
}
