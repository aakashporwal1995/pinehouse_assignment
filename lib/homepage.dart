import 'package:flutter/material.dart';
import 'package:pine_house_assignment/addstaffpage.dart';
import 'package:pine_house_assignment/staffslistpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const AddStaffPage(),
      const StaffsListPage()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Screen 2',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
