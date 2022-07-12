// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const name = "Alex Abc";
    const email = 'Alexab@gmail.com';
    const urlImage = 'img/470-4703547_privacy-icon-png.png';
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          //padding: padding,
          children: [
            buildheader(name: name, email: email, image: urlImage),
            const SizedBox(height: 25),
            BuildMenuItem(
              text: "People",
              icon: Icons.people_alt_outlined,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "My Account",
              icon: Icons.account_box,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Favourites",
              icon: Icons.favorite_border,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Updates",
              icon: Icons.update,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Settings",
              icon: Icons.settings,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            const Divider(color: Colors.grey),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Notfications",
              icon: Icons.notifications,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Languages",
              icon: Icons.language_outlined,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            const Divider(color: Colors.grey),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Permissions",
              icon: Icons.handshake,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Legal & About",
              icon: Icons.info_outline,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
            BuildMenuItem(
              text: "Customer Service",
              icon: Icons.phone_android_outlined,
              onClicked: () {},
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  Widget buildheader(
      {required String name, required String email, required String image}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: padding.add(const EdgeInsets.only(top: 48, bottom: 20)),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage:
                  AssetImage('img/470-4703547_privacy-icon-png.png'),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 20)),
                Text(email),
              ],
            ),
            const Spacer(),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.chat_rounded,
                size: 32,
                color: Colors.black.withOpacity(0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildMenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;
  const BuildMenuItem({
    Key? key,
    required this.text,
    required this.icon,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black.withOpacity(0.8)),
      title: Text(text, style: TextStyle(color: Colors.black.withOpacity(0.8))),
      onTap: onClicked,
    );
  }
}
