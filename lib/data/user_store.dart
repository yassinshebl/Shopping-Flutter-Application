class UserStore {
  static String? name;
  static String? email;
  static String? password;

  static bool isSignedUp(String e, String p) {
    if (email == null || password == null) return false;
    return email == e && password == p;
  }

  static void clear() {
    name = null;
    email = null;
    password = null;
  }
}
