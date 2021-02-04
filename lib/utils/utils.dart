bool validatePassword(String pass) {
  if (pass == null || pass.length < 8) {
    return false;
  }
  return true;
}

bool validateUserName(String user) {
  return user.isNotEmpty;
}