import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9, // No. of tabs[] per tabBarView
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch(),
          bottom: const TabBar(
            isScrollable: true, //to have the Tab Bar stretched
            indicatorWeight: 8,
            indicatorColor: Colors.yellow,
            tabs: [
              RepeatedTab(
                label: 'Men',
              ),
              RepeatedTab(
                label: 'Women',
              ),
              RepeatedTab(
                label: 'Shoes',
              ),
              RepeatedTab(
                label: 'Bags',
              ),
              RepeatedTab(
                label: 'Electronics',
              ),
              RepeatedTab(
                label: 'Accessories',
              ),
              RepeatedTab(
                label: 'Home & Garden',
              ),
              RepeatedTab(
                label: 'Kids',
              ),
              RepeatedTab(
                label: 'Beauty',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('men screen'),
            ),
            Center(
              child: Text('women screen'),
            ),
            Center(
              child: Text('shoes screen'),
            ),
            Center(
              child: Text('bags screen'),
            ),
            Center(
              child: Text('electronics screen'),
            ),
            Center(
              child: Text('accessories screen'),
            ),
            Center(
              child: Text('home & garden screen'),
            ),
            Center(
              child: Text('Kids screen'),
            ),
            Center(
              child: Text('Beauty screen'),
            ),
          ],
        ),
      ),
    );
  }
}



class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
