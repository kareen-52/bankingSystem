
bool isLoggedInUser = false;
bool isSignup = false;

class SharedPrefKeys {

  static const String userToken = 'userToken';
  static const String role = 'role';
}



enum UserRole {
  mobileUser(1),
  employee(2),
  manager(3);

  final int value;
  const UserRole(this.value);
}


  final List<String> transactionTypes = ['deposit', 'withdrawal'];



final List<String> accountTypes = [
    'saving account',
    'checking account',
    // 'loan account',
    // 'investment account'
  ];

  final List<String> accountHierarchies = [
    'individual account',
    'group account',
  ];