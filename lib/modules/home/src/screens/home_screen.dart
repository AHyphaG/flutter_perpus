import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  static final routeName = '/home';
  const HomeScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Hapus token
    Navigator.pushReplacementNamed(context, '/login'); // Arahkan ke login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi User", style: TextStyle(fontSize: 14)),
                  Text(
                    "Discover The Books",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 39,
              margin: EdgeInsets.only(left: 25, right: 25, top: 18),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 146, 87, 87),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: <Widget>[
                  TextField(
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 19,
                        right: 50,
                        bottom: 8,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search Book...',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 9,
                    child: Icon(Icons.search, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 25, right: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.all(0),
                  indicatorPadding: EdgeInsets.all(0),
                  isScrollable: true,
                  labelColor: Color(0xFF000000),
                  unselectedLabelColor: Color.fromARGB(255, 92, 53, 53),
                  tabs: [
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text("All", style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text("New", style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    Tab(
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Text("Popular", style: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 210,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 210,
                    width: 153,
                    decoration: BoxDecoration(color: Color(0xFFE5E5E5)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
