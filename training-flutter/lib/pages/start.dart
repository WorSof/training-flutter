import 'package:flutter/material.dart';
import 'package:hola_mundo/apis/getPots.dart';
import 'package:hola_mundo/pages/createAccount.dart';
import 'package:hola_mundo/pages/textFormField.dart';
import 'package:hola_mundo/widgets/appBar.dart';

class StartPage extends StatefulWidget {
  static String routeName = 'start';

  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final GetPostService _postService = GetPostService();
  final String _postFile = 'lib/assets/images/posts.png';
  final double _horizontalSpacing = 26.0;

  List posts = [];

  void _go(BuildContext context, String path) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => CreateAccountPage()),
    // );

    // Navigator.popAndPushNamed(context, 'createAccount');

    // Navigator.pushNamed(context, 'createAccount');

    Navigator.pushNamed(context, path);
  }

  void _getPosts() {
    _postService
        .execute()
        .then((value) {
          setState(() {
            posts = value;
          });
        })
        .catchError((onError) => {})
        .whenComplete(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Lista de usuarios'),
      body: _getList(context),
      floatingActionButton: _floatingButton(context),
    );
  }

  List<Widget> _getCardColumnChildren(item) => [
        Image.asset(_postFile),
        SizedBox(height: 5.0),
        ListTile(
          leading: Icon(
            Icons.description,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            item['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Usuario: ${item['userId']}',
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 13.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 18.0),
          child: Text(
            item['body'],
            textAlign: TextAlign.justify,
          ),
        ),
      ];

  Widget _getCard(item) => Card(
        elevation: 3.0,
        margin: EdgeInsets.fromLTRB(
            _horizontalSpacing, 26.0, _horizontalSpacing, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: _getCardColumnChildren(item),
        ),
      );

  Widget _getList(BuildContext context) {
    return ListView(
      children: [
        for (var item in posts) _getCard(item),
        SizedBox(height: 20.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: _horizontalSpacing),
          child: RaisedButton(
            onPressed: () => _go(context, TextFormFieldPage.routeName),
            child: Text('Campos de Prueba'),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: _horizontalSpacing),
          child: RaisedButton(
            onPressed: () => _getPosts(),
            child: Text('Obtener Publicaciones'),
          ),
        ),
      ],
    );
  }

  Widget _floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _go(context, CreateAccountPage.routeName),
      child: Icon(Icons.person_add),
    );
  }
}