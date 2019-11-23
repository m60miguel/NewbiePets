import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Pet {
  Pet({this.did, this.nombre, this.edad, this.fechaNacimiento, this.tipo});
  final String did;
  final String nombre;
  final int edad;
  final Timestamp fechaNacimiento;
  final String tipo;

  factory Pet.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String nombre = data['nombre'];
    final int edad = data['edad'];
    final Timestamp fechaNacimiento = data['fechaNacimiento'];
    final String tipo = data['tipo'];
    return Pet(
        did: documentId,
        nombre: nombre,
        edad: edad,
        fechaNacimiento: fechaNacimiento,
        tipo: tipo);
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'edad': edad,
      'fechaNacimiento': fechaNacimiento,
      'tipo': tipo,
    };
  }
}
