import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
Notifier _selectItem = Notifier.Notificacion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Idioma"),
              subtitle: Text("Español"),
              onTap: (){},
            ),
            SwitchListTile(
              value: false,
              title: Text("Iniciar sesión automáticamente"),
              onChanged: (value) {},
            ),
            ListTile(
              title: Text("Medicamentos"),
            ),
            RadioListTile<Notifier>(
              title: Text("Notificacion"),
              value: Notifier.Notificacion,
              groupValue: _selectItem,
              onChanged: (Notifier value) { setState(() {_selectItem = value;});},
            ),
            RadioListTile<Notifier>(
              title: Text("Alarma"),
              value: Notifier.Alarma,
              groupValue: _selectItem,
              onChanged: (Notifier value) { setState(() {_selectItem = value;});},
            ),
            ListTile(
              title: Text("Comida"),
            ),
            RadioListTile<Notifier>(
              title: Text("Notificacion"),
              value: Notifier.Notificacion,
              groupValue: _selectItem,
              onChanged: (Notifier value) { setState(() {_selectItem = value;});},
            ),
            RadioListTile<Notifier>(
              title: Text("Alarma"),
              value: Notifier.Alarma,
              groupValue: _selectItem,
              onChanged: (Notifier value) { setState(() {_selectItem = value;});},
            ),
            ListTile(
              title: Text("Enviar los informes de error"),
              subtitle: Text("Los informes de errores son anónimos y nos permitenidentificar los problemas y solucionarlos."),
              onTap: (){},
            ),
          ],
        ),
    );
  }
}

 enum Notifier{
  Notificacion,
  Alarma,
}