import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/createAccount.dart';
import 'package:hola_mundo/widgets/appBar.dart';

class StartPage extends StatefulWidget {
  static String routeName = 'start';

  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void goCreateAccount(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => CreateAccountPage()),
    // );

    // Navigator.popAndPushNamed(context, 'createAccount');

    // Navigator.pushNamed(context, 'createAccount');

    Navigator.pushNamed(
      context,
      CreateAccountPage.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Lista de usuarios'),
      body: _getBody(context),
      floatingActionButton: _floatingButton(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 40.0,
      ),
      child: _getList(),
    );
  }

  Widget _getList() {
    Map<String, dynamic> user = {
      'name': 'JUAN CAMILO',
      'lastname': 'MARIN OCHOA',
      'age': 22,
    };

    List<Map<String, dynamic>> users = [
      {
        'name': 'JUAN CAMILO',
        'lastname': 'MARIN OCHOA',
        'age': 22,
      },
      {
        'name': 'JEISSON',
        'lastname': 'TOBON BOHORQUEZ',
        'age': 23,
      }
    ];

    List<String> products = [
      'NARANJA',
      'UVA',
      'MANZADA',
      'FRESA',
      'MANGO',
    ];

    return ListView(
      children: [
        for (var item in users)
          Column(
            children: [
              Text(item['name']),
              Text(item['lastname']),
              Text('Edad: ${item['age']}'),
              Divider(),
            ],
          ),
      ],
    );
  }

  Widget _floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => goCreateAccount(context),
      child: Icon(Icons.person_add),
    );
  }
}
