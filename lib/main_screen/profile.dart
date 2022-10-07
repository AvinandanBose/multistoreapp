import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
           SliverAppBar(
             pinned: false,
             snap: false,
             floating: true,
            expandedHeight: 140,
            collapsedHeight: 141,
           centerTitle: true,
            elevation: 0,
            flexibleSpace: LayoutBuilder(builder: (context,constraint){
              return FlexibleSpaceBar(
                title: AnimatedOpacity(
                duration: const Duration(milliseconds:  200),
                opacity: constraint.biggest.height <= 120 ? 1 : 0,
                  child: const Text('Account', style: TextStyle(color: Colors.black),),
                ) ,
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.yellow, Colors.brown]),
                  ),
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Container(
                    height:  80,
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30)
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {  },
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const FittedBox(
                              child: Text(
                                'Cart',
                                style: TextStyle(color: Colors.yellow, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.yellow,

                        child: TextButton(
                          onPressed: () {  },
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const FittedBox(
                              child:  Text(
                                'Order',
                                style: TextStyle(color: Colors.black54, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {  },
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const FittedBox(
                              child:  Text(
                                'Wishlist',
                                style: TextStyle(color: Colors.yellow, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
