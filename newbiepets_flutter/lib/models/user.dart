class Profile {
  Profile({this.nombre, this.email, this.direccion, this.telefono});

  final String nombre;
  final String email;
  final String direccion;
  final String telefono;

  factory Profile.fromMap(Map<String, dynamic> data, String documentID) {
    if (data == null) {
      return null;
    }
    final String nombre = data['nombre'];
    final String email = data['email'];
    final String direccion = data['direccion'];
    final String telefono = data['telefono'];
    return Profile(
        nombre: nombre, email: email, direccion: direccion, telefono: telefono);
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
