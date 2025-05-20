import 'package:flutter/material.dart';
import 'package:time_tracking/screens/project_management.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.folder),
                title: Text("Projects"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectManagement(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list_alt_outlined),
                title: Text("Tasks"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Time Tracking"),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(child: Text("All Entries")),
              Tab(child: Text("Grouped By Project")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("All Entries")),
            Center(child: Text("Grouped by Projects")),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
