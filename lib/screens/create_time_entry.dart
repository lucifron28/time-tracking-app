import 'package:flutter/material.dart';


class CreateTimeEntry extends StatelessWidget {
  const CreateTimeEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an entry"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: CreateTimeEntryScreen(),
    );
  }
}


class CreateTimeEntryScreen extends StatefulWidget {
  const CreateTimeEntryScreen({super.key});

  @override
  State<CreateTimeEntryScreen> createState() => _CreateTimeEntryScreenState();
}

class _CreateTimeEntryScreenState extends State<CreateTimeEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Create Time Entry Screen"),
    );
  }
}