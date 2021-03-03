import 'package:flutter/material.dart';
import 'package:hola_mundo/widgets/appBar.dart';

class OtherWidgetsPage extends StatefulWidget {
  static String routeName = 'otherWidgets';

  OtherWidgetsPage({Key key}) : super(key: key);

  @override
  _OtherWidgetsPageState createState() => _OtherWidgetsPageState();
}

class _OtherWidgetsPageState extends State<OtherWidgetsPage> {
  List<DropdownMenuItem<dynamic>> _listDropdown = [
    DropdownMenuItem(
      value: 'elem-0',
      child: Text('Elemento 0'),
    ),
    DropdownMenuItem(
      value: 'elem-1',
      child: Text('Elemento 1'),
    ),
    DropdownMenuItem(
      value: 'elem-2',
      child: Text('Elemento 2'),
    ),
  ];

  List<PopupMenuEntry<dynamic>> _listPopupMenu = [
    PopupMenuItem(
      child: Text('Elemento 1'),
      value: 1,
    ),
    PopupMenuItem(
      child: Text('Elemento 2'),
      value: 2,
    ),
    PopupMenuItem(
      child: Text('Elemento 3'),
      value: 3,
    ),
  ];

  Map<String, bool> _checkboxValue = {
    'dart': false,
    'kotlin': false,
    'swift': false,
  };

  String _radioValue = '';

  double _sliderValue = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Otros Widgets'),
      body: ListView(
        children: [
          _getDropdown(),
          _getPopupMenu(context),
          _getCheckbox(),
          _getRadio(),
          _getSlider(),
        ],
      ),
    );
  }

  Widget _getDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: DropdownButton(
        hint: Text('Seleccionar...'),
        underline: Container(
          height: 1.0,
          color: Colors.red,
        ),
        items: _listDropdown,
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  Widget _getPopupMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: PopupMenuButton(
        itemBuilder: (context) => _listPopupMenu,
        onSelected: (value) => print(value),
        onCanceled: () {},
        // icon: Icon(Icons.settings),
        // child: Text('Abrir'),
        child: Row(
          children: [
            Icon(Icons.settings),
            Container(
              margin: EdgeInsets.only(left: 12.0),
              child: Text('Abrir'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCheckbox() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          CheckboxListTile(
            title: Text('Dart'),
            subtitle: Text('Desarrollado por Google'),
            secondary: Icon(Icons.android_outlined),
            value: _checkboxValue['dart'],
            onChanged: (bool value) {
              setState(() {
                _checkboxValue['dart'] = value;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Kotlin'),
            subtitle: Text('Desarrollado por Jetbrains'),
            secondary: Icon(Icons.android_outlined),
            value: _checkboxValue['kotlin'],
            onChanged: (bool value) {
              setState(() {
                _checkboxValue['kotlin'] = value;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Swift'),
            subtitle: Text('Desarrollado por Apple'),
            secondary: Icon(Icons.android_outlined),
            value: _checkboxValue['swift'],
            onChanged: (bool value) {
              setState(() {
                _checkboxValue['swift'] = value;
              });
            },
          )
        ],
      ),
    );
  }

  Widget _getRadio() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text('Masculino'),
            leading: Radio(
              value: 'Masculino',
              groupValue: _radioValue,
              onChanged: (String value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Femenino'),
            leading: Radio(
              value: 'Femenino',
              groupValue: _radioValue,
              onChanged: (String value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Prefiero no decirlo'),
            leading: Radio(
              value: 'Prefiero no decirlo',
              groupValue: _radioValue,
              onChanged: (String value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSlider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          Icon(Icons.volume_down),
          Slider(
            min: 0,
            max: 100,
            divisions: 100,
            value: _sliderValue,
            label: _sliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          Icon(Icons.volume_up),
        ],
      ),
    );
  }
}
