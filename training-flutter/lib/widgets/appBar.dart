import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const AppBarWidget(this.title, {Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontFamily: 'Comfortaa'),
      ),
      centerTitle: true,
      // leading: IconButton(
        // icon: Icon(Icons.account_circle_outlined),
        // onPressed: () => null,
      // ),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () => print('Saliendo de la aplicación'),
        ),
        IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () => null,
        )
      ],
    );
  }
}
