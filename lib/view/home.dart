import 'package:fake_store_app/screen/dash_board_screen.dart';
import 'package:fake_store_app/screen/home_screen.dart';
import 'package:fake_store_app/screen/profile_screen.dart';
import 'package:fake_store_app/screen/cart_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                //method to show search bar
                // showSearch(context: context, delegate: )
              },
              icon: const Icon(Icons.search),
            ),
            Stack(
              children: [
                const Positioned(
                  top: 4,
                  right: 15,
                  child: SizedBox(
                      child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          unselectedItemColor: Colors.lightBlueAccent,
          selectedItemColor: Colors.blue,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined), label: 'Dashed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
        body: selectedIndex == 0
            ? const HomeScreen()
            : selectedIndex == 1
                ? const MenuScreen()
                : selectedIndex == 2
                    ? const CartScreen()
                    : const ProfileScreen(),
      ),
    );
  }
}
