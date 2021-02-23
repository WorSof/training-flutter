import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/appBar.dart';

class PageNotFoundPage extends StatelessWidget {
  static String routeName = 'pageNotFound';

  const PageNotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Página no encontrada'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 40.0,
      ),
      child: ListView(
        children: [
          Text(
            'Página no encontrada',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Disculpa, la página no existe.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
