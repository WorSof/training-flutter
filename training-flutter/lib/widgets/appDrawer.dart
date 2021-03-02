import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key key}) : super(key: key);

  void _goTo(BuildContext context, String path) =>
      Navigator.pushNamed(context, path);

  List<Map<String, dynamic>> _itemsDrawer = [
    {
      'icon': Icons.dashboard,
      'text': 'Dashboard',
      'path': 'dashboard',
    },
    {
      'icon': Icons.add_to_drive,
      'text': 'Drive',
      'path': 'add_to_drive',
    },
    {
      'icon': Icons.alarm,
      'text': 'Alarma',
      'path': 'alarm',
    },
    {
      'icon': Icons.android,
      'text': 'Android OS',
      'path': 'androidOS',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _getHeader(),
          for (var item in _itemsDrawer)
            _getItem(
              context,
              item['icon'],
              item['text'],
              item['path'],
            ),
          Divider(),
          _getItem(
            context,
            Icons.accessibility,
            'Accesibilidad',
            'accessibility',
          ),
          _getItem(
            context,
            Icons.backup,
            'Copia de seguridad',
            'backup',
          ),
        ],
      ),
    );
  }

  Widget _getHeader() {
    return DrawerHeader(
      // padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('lib/assets/images/posts.png'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hola',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Juan Camilo',
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getItem(
    BuildContext context,
    IconData icon,
    String text,
    String toPath,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      // title: Row(
      //   children: [
      //     Icon(icon),
      //     Padding(
      //       padding: EdgeInsets.only(left: 8.0),
      //       child: Text(text),
      //     ),
      //   ],
      // ),
      onTap: () => _goTo(context, toPath),
    );
  }
}
