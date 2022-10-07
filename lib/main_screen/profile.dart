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
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: <Widget>[
          Container(
            height: 230,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.yellow, Colors.brown]),
            ),
          ),
          CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                centerTitle: true,
                expandedHeight: 140,
                flexibleSpace: LayoutBuilder(builder: (context, constraint) {
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: constraint.biggest.height <= 120 ? 1 : 0,
                      child: const Center(
                        child: Text(
                          'Account',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.brown]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, left: 30),
                        child: Row(
                          children: <Widget>[
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('images/inapp/guest.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                'guest'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                                  bottomLeft: Radius.circular(30)),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const FittedBox(
                                  child: Text(
                                    'Cart',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const FittedBox(
                                  child: Text(
                                    'Order',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 24),
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
                                  bottomRight: Radius.circular(30)),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: const FittedBox(
                                  child: Text(
                                    'Wishlist',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 150,
                            child: Image(
                              image: AssetImage('images/inapp/logo.jpg'),
                            ),
                          ),
                          const ProfileHeaderLabel(
                            headerLabel: 'Account Info',
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: const <Widget>[
                                    RepeatedListTile(
                                      title: 'Email Address',
                                      subtitle: 'example@email',
                                      icon: Icons.email,
                                    ),
                                    YellowDivider(),
                                    RepeatedListTile(
                                      title: 'Phone No.',
                                      subtitle: '+918889999',
                                      icon: Icons.phone,
                                    ),
                                    YellowDivider(),
                                    RepeatedListTile(
                                      title: 'Address',
                                      subtitle: 'ABC ROAD, WB, IN',
                                      icon: Icons.location_pin,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const ProfileHeaderLabel(
                              headerLabel: ' Account Settings  '),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    RepeatedListTile(
                                      title: 'Edit Profile',
                                      icon: Icons.edit,
                                      onPressed: () {},
                                    ),
                                    const YellowDivider(),
                                    RepeatedListTile(
                                      title: 'Change Password',
                                      icon: Icons.lock,
                                      onPressed: () {},
                                    ),
                                    const YellowDivider(),
                                    RepeatedListTile(
                                      title: 'Log Out',
                                      icon: Icons.logout,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function? onPressed;
  const RepeatedListTile({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const ProfileHeaderLabel({
    Key? key,
    required this.headerLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            ' $headerLabel ',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
