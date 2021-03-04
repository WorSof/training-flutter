import 'package:flutter/cupertino.dart';
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
  bool _switchMaterial = false;
  bool _switchCupertino = true;

  List<Map<String, dynamic>> _listExpanded = [
    {
      'title': 'Element 1',
      'body': 'Contenido del elemento 1',
      'isExpanded': true
    },
    {
      'title': 'Element 2',
      'body': 'Contenido del elemento 2',
      'isExpanded': false
    },
    {
      'title': 'Element 3',
      'body': 'Contenido del elemento 3',
      'isExpanded': false
    }
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget('Otros Widgets'),
        body: ListView(
          children: [
            _getDropdown(),
            _getPopupMenu(context),
            _getCheckbox(),
            _getRadio(),
            _getSlider(),
            _getSwitch(),
            _getButtonCupertino(context),
            _getPanelList(),
            _getChips(),
            _getTable(),
          ],
        ),
      );

  Widget _getDropdown() => Padding(
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

  Widget _getPopupMenu(BuildContext context) => Padding(
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

  Widget _getCheckbox() => Padding(
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

  Widget _getRadio() => Padding(
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

  Widget _getSlider() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            // Material
            Row(
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

            // Cupertino
            Row(
              children: [
                Icon(CupertinoIcons.volume_down),
                CupertinoSlider(
                  min: 0,
                  max: 100,
                  divisions: 100,
                  value: _sliderValue,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                Icon(CupertinoIcons.volume_up),
              ],
            ),
          ],
        ),
      );

  Widget _getSwitch() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: Row(
          children: [
            // Material
            Switch(
              value: _switchMaterial,
              onChanged: (value) => setState(() => _switchMaterial = value),
            ),

            // Cupertino
            CupertinoSwitch(
              value: _switchCupertino,
              onChanged: (value) => setState(() => _switchCupertino = value),
            )
          ],
        ),
      );

  Widget _getButtonCupertino(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: CupertinoButton(
          child: Text('Abrir menú'),
          onPressed: () => _getBottomSheet(context),
        ),
      );

  void _getBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        padding: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Documento 1'),
                leading: Icon(CupertinoIcons.doc),
              ),
              ListTile(
                title: Text('Documento 2'),
                leading: Icon(CupertinoIcons.doc),
              ),
              ListTile(
                title: Text('Documento 3'),
                leading: Icon(CupertinoIcons.doc),
              ),
              ListTile(
                title: Text('Documento 4'),
                leading: Icon(CupertinoIcons.doc),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPanelList() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _listExpanded[index]['isExpanded'] = !isExpanded;
            });
          },
          children: _listExpanded
              .map((item) => ExpansionPanel(
                    isExpanded: item['isExpanded'],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(item['title']),
                        leading:
                            Icon(CupertinoIcons.arrow_left_right_circle_fill),
                      );
                    },
                    body: ListTile(
                      title: Text(item['body']),
                      subtitle: Text('Subtítulo del elemento'),
                    ),
                  ))
              .toList(),
        ),
      );

  Widget _getChips() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            InputChip(
              label: Text('email1@gmail.com'),
              selected: true,
              onPressed: () => {},
            ),
            InputChip(
              avatar: CircleAvatar(child: Text('J')),
              label: Text('Usuario 1'),
              pressElevation: 2.0,
              onPressed: () => {},
            ),
            InputChip(
              // avatar: CircularProgressIndicator(),
              avatar: CupertinoActivityIndicator(),
              label: Text('Usuario 2'),
              pressElevation: 2.0,
              onPressed: () => {},
            ),
            InputChip(
              avatar: CircleAvatar(child: Text('J')),
              label: ListTile(
                trailing: Icon(CupertinoIcons.xmark_circle),
                title: Text('Usuario 3'),
              ),
              pressElevation: 2.0,
              onPressed: () => {},
            )
          ],
        ),
      );

  Widget _getTable() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: DataTable(
          dataRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) =>
                  (states.contains(MaterialState.selected))
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.08)
                      : null),
          columns: <DataColumn>[
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Edad')),
            DataColumn(label: Text('Cargo')),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Juan')),
                DataCell(Text('22')),
                DataCell(Text('Analista'))
              ],
              selected: true,
              onSelectChanged: (bool value) => {},
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Camilo')),
                DataCell(Text('21')),
                DataCell(Text('Desarrollador'))
              ],
              selected: false,
              onSelectChanged: (bool value) => {
                setState(() => {})
              },
            ),
          ],
        ),
      );
}
