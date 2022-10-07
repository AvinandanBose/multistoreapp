import 'package:flutter/material.dart';
import 'package:multistoreapp/dashboard_components/SupplierOrders.dart';
import 'package:multistoreapp/dashboard_components/edit_business.dart';
import 'package:multistoreapp/dashboard_components/manage_products.dart';
import 'package:multistoreapp/dashboard_components/my_store.dart';
import 'package:multistoreapp/dashboard_components/supp_balance.dart';
import 'package:multistoreapp/dashboard_components/supp_statistics.dart';
import 'package:multistoreapp/widgets/appbar_widgets.dart';


List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics'
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,

];

List<Widget> pages = const [
  MyStore(),
  SupplierOrders(),
  Edit_Business(),
  Manage_Products(),
  BalanceScreen(),
  StatisticsScreen(),
];

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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'welcome_screen');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black87,
              ),
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
            label.length,
            (index) => InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> pages[index]));
              },
              child: Card(
                elevation: 20,
                shadowColor: Colors.purpleAccent.shade200,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  <Widget>[
                     Icon(
                      icons[index],
                      size: 50,
                      color: Colors.yellowAccent,
                    ),
                    Text(
                      label[index].toUpperCase(),
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
      ),
    );
  }
}
