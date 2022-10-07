import 'package:flutter/material.dart';
import 'package:multistoreapp/widgets/appbar_widgets.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AppBarTitle(
          title: 'Dashboard',
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Icon(
              Icons.logout,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          crossAxisSpacing: 50,
          mainAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(
            6,
            (index) => Card(
              elevation: 20,
              shadowColor: Colors.purpleAccent.shade200,
              color: Colors.blueGrey.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  <Widget>[
                  const Icon(
                    Icons.store,
                    color: Colors.yellowAccent,
                  ),
                  Text(
                    'My Store'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        fontFamily: 'Acme'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
