import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class User {
  User({this.did, this.nombre, this.email, this.direccion, this.telefono});
  final String did;
  final String nombre;
  final String email;
  final String direccion;
  final String telefono;

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String nombre = data['nombre'];
    final String email = data['email'];
    final String direccion = data ['direccion'];
    final String telefono = data ['telefono'];
    return User(
        did: documentId,
        nombre: nombre,
        email: email,
        direccion: direccion,
        telefono: telefono);
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'email': email,
      'direccion': direccion,
      'telefono': telefono,
    };
  }
}
