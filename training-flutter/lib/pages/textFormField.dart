import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/appBar.dart';
import 'package:hola_mundo/widgets/borderCut.dart';

class TextFormFieldPage extends StatefulWidget {
  static String routeName = 'textFormField';

  TextFormFieldPage({Key key}) : super(key: key);

  @override
  _TextFormFieldPageState createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  final TextEditingController _fieldTestController = TextEditingController();
  final FocusNode _fieldTestFocus = FocusNode();

  final TextEditingController _fieldBorderCutController =
      TextEditingController();
  final FocusNode _fieldBorderCutFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Campos de prueba'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              enabled: true,
              controller: _fieldTestController,
              focusNode: _fieldTestFocus,
              maxLength: 10,
              decoration: InputDecoration(
                fillColor: Colors.blue[50],
                filled: true,
                icon: Icon(
                  Icons.accessibility,
                  color: Colors.blue,
                ),
                labelText: 'Campo de prueba',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
                hintText: 'Placeholder campo',
                hintStyle: TextStyle(fontSize: 20.0),
                // border: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                suffixIcon: Icon(
                  Icons.access_alarms,
                  color: Colors.blue,
                ),
                suffix: Container(
                  width: 20.0,
                  height: 20.0,
                  color: Colors.blue,
                ),
                // prefixIcon: Icon(Icons.ac_unit_sharp),
                prefixText: 'Nombre: ',
                prefixStyle: TextStyle(color: Colors.blue, fontSize: 20.0),
                // prefix: Container(
                //   width: 20.0,
                //   height: 20.0,
                //   color: Colors.purple,
                // ),
              ),
            ),
            TextFormField(
              controller: _fieldBorderCutController,
              focusNode: _fieldBorderCutFocus,
              keyboardType: TextInputType.number,
              obscureText: true,
              obscuringCharacter: '#',
              decoration: InputDecoration(
                border: BorderCutWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
