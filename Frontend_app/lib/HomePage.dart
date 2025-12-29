import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) =>
              IconButton(onPressed: () {
                Scaffold.of(context).openDrawer();

              }, icon: Icon(Icons.menu_open)),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_card_rounded)),
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [
            _buildBanner(),
            const SizedBox(height: 25,),
            _buildCausalShirt(),
            const SizedBox(height: 25,),
            _buildPants(),
            const SizedBox(height: 25,),
            _buildTrending(),
          ]



        ),

      ),

      drawer: _buildDrawer(),
    );
  }


  _buildCausalShirt() {
    return const Text("Casual Shirts");

  }

  _buildPants() {
    return const Text("Pants");

  }

  _buildTrending() {
    return const Text("Trending");

  }

  _buildBanner() {
    return const Text("Banner");

  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),

          _buildSectionDivider("Shop In"),
          _buildDrawerItem(Icons.man, "Men"),
          _buildDrawerItem(Icons.woman, "Women"),

          _buildSectionDivider("My Account"),
          _buildDrawerItem(Icons.person_outline, "Profile"),
          _buildDrawerItem(Icons.shopping_bag_outlined, "My Orders"),

          _buildSectionDivider("Support"),
          _buildDrawerItem(Icons.help_outline, "Help & Support"),
          _buildDrawerItem(Icons.info_outline, "About Us"),

          const SizedBox(height: 20),

          _buildLogoutItem(),
        ],
      ),
    );
  }


  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Full name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "View Profile",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildSectionDivider(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
          letterSpacing: 1,
        ),
      ),
    );
  }



  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _buildLogoutItem() {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text(
        "Logout",
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {},
    );
  }



}
