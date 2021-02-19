import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/appBar.dart';

class CreateAccountPage extends StatefulWidget {
  static String routeName = 'createAccount';

  CreateAccountPage({Key key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _fieldNameController = TextEditingController();
  final FocusNode _fieldNameFocus = FocusNode();

  void _goBack(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Creación de cuenta'),
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
      child: ListView(
        children: [
          Text(
            'Creación de cuenta',
            style: TextStyle(fontSize: 26.0),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: _fieldNameController,
            focusNode: _fieldNameFocus,
            decoration: InputDecoration(
              labelText: '¿Comó te llamas?',
              prefixIcon: Icon(Icons.person),
              suffixIcon: IconButton(
                onPressed: () => _fieldNameController.text = '',
                icon: Icon(Icons.close),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _goBack(context),
      child: Icon(Icons.arrow_back_ios),
    );
  }
}
