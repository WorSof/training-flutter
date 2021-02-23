import 'package:flutter/material.dart';
import 'package:hola_mundo/models/account.model.dart';
import 'package:hola_mundo/widgets/appBar.dart';
import 'package:email_validator/email_validator.dart';

class CreateAccountPage extends StatefulWidget {
  static String routeName = 'createAccount';

  CreateAccountPage({Key key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _fieldNameController = TextEditingController();
  final FocusNode _fieldNameFocus = FocusNode();

  final TextEditingController _fieldEmailController = TextEditingController();
  final FocusNode _fieldEmailFocus = FocusNode();

  final TextEditingController _fieldDateController = TextEditingController();
  final FocusNode _fieldDateFocus = FocusNode();

  final TextEditingController _fieldHourController = TextEditingController();
  final FocusNode _fieldHourFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Account newAccount;

  void _goBack(BuildContext context) => Navigator.pop(context);

  Future<Null> selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime picker = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );

    if (picker != null) {
      _fieldDateController.text =
          '${picker.year.toString()}-${picker.month.toString()}-${picker.day.toString()}';
    }
  }

  selectHour(BuildContext context) async {
    final TimeOfDay currentTime = TimeOfDay.now();
    final TimeOfDay picker = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );

    if (picker != null) {
      _fieldHourController.text =
          '${picker.hour.toString()}:${picker.minute.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      child: _getListView(),
    );
  }

  Widget _getListView() => ListView(
        children: [
          Text(
            'Creación de cuenta',
            style: TextStyle(fontSize: 26.0),
          ),
          SizedBox(height: 20.0),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _fieldNameController,
                  focusNode: _fieldNameFocus,
                  maxLength: 30,
                  validator: (String value) =>
                      (value.isEmpty) ? 'Ingresa tu nombre' : null,
                  decoration: InputDecoration(
                    labelText: '¿Comó te llamas?',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      onPressed: () => _fieldNameController.text = '',
                      icon: Icon(Icons.close),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _fieldEmailController,
                  focusNode: _fieldEmailFocus,
                  keyboardType: TextInputType.emailAddress,
                  // validator: (String value) => !value.contains('@')
                  //     ? 'Ingresa un correo electrónico valido'
                  //     : null,
                  validator: (String value) => !EmailValidator.validate(value)
                      ? 'Ingresa un correo electrónico valido'
                      : null,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: IconButton(
                      onPressed: () => _fieldEmailController.text = '',
                      icon: Icon(Icons.close),
                    ),
                    helperText: 'Debe ser un correo electrónico valido',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _fieldDateController,
                  focusNode: _fieldDateFocus,
                  decoration: InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.today),
                      onPressed: () => selectDate(context),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _fieldHourController,
                  focusNode: _fieldHourFocus,
                  decoration: InputDecoration(
                    labelText: 'Hora actual',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.alarm),
                      onPressed: () => selectHour(context),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text(
                    'CREAR CUENTA',
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      newAccount = Account(
                        name: _fieldNameController.text,
                        email: _fieldEmailController.text,
                        date: _fieldDateController.text,
                        hour: _fieldHourController.text,
                      );

                      print(newAccount.name);
                    } else {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 6),
                          content: Text('Por favor revisa todos los campos'),
                          action: SnackBarAction(
                            label: 'Cerrar',
                            onPressed: () => {},
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );

  Widget _floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _goBack(context),
      child: Icon(Icons.arrow_back_ios),
    );
  }
}
