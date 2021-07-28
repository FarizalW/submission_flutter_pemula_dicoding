import 'package:flutter/material.dart';
import 'package:submission_dicoding/routes/routes.dart';


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
    borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
    child: Drawer(
      elevation: 15,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            height: 1.0,
            thickness: 1.0,
            color: Colors.blueGrey,
          ),
          //Home
          _createDrawerItem(
              icon: Icons.home_outlined,
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          //Belajar
          _createDrawerItem(
              icon: Icons.note_outlined,
              text: 'Belajar',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.belajar)),
          //Crypto
          _createDrawerItem(
              icon: Icons.trending_up_outlined,
              text: 'Crypto',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.crypto)),
          //About
          _createDrawerItem(
              icon: Icons.favorite_outlined,
              text: 'About',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.about)),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            height: 1.0,
            thickness: 1.0,
            color: Colors.blueGrey,
          ),
          //Keluar
          _createDrawerItem(
              icon: Icons.logout,
              text: 'Keluar',
              onTap: () {showDialog(
                context: context, builder: (context) =>
                   AlertDialog(
                    title: Text('Yakin ingin keluar?'),
                    content:
                        Text('Anda akan akan keluar dari akun anda.'),
                    actions: [
                      ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () => Navigator.pop(context),
                        child: Text('Tidak'),
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              Navigator.pushReplacementNamed(context, Routes.login),
                          child: Text('Iya'),
                          style: ButtonStyle()),
                    ],
                  ),
                );
              },
            ),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    ),);
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logo/storelogo.png'),
                fit: BoxFit.scaleDown,
                )),
        child: Center()
        );
  }

  Widget _createDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

   
