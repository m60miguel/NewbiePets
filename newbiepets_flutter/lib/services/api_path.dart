class APIPath {
  static String pet(String uid, String petId) => 'Users/$uid/pets/$petId';
  static String pets(String uid) => 'Users/$uid/pets';
}
