import 'package:flutter/material.dart';
import 'package:vastra/MainScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final String name = "Users";
  final String email = "example@email.com";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                color: theme.primaryColor,
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => MainScreen()),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                    const SizedBox(height: 14),

                    Text(
                      name,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),

                    Text(
                      email,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _StatItem(title: "Orders", value: "12"),
                    _StatItem(title: "Wishlist", value: "8"),
                    _StatItem(title: "Cart", value: "3"),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              const Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _menuItem(Icons.person_outline, "Edit Profile"),
                    _menuItem(Icons.shopping_bag_outlined, "My Orders"),
                    _menuItem(Icons.favorite_border, "Wishlist"),
                    _menuItem(Icons.location_on_outlined, "Saved Addresses"),
                    _menuItem(Icons.help_outline, "Help & Support"),
                  ],
                ),
              ),

              const Divider(height: 32),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

}
