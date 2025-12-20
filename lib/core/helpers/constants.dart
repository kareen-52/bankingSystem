bool isLoggedInUser = false;
bool isSignup = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String role = 'role';
}

enum UserRole {
  mobileUser(1), // normal user
  employee(2), // employee
  manager(3); // admin

  final int value;
  const UserRole(this.value);
}

//transactions types
final List<String> transactionTypes = ['deposit', 'withdrawal'];

// account types
final List<String> accountTypes = [
  'saving account',
  'checking account',
  'loan account',
  'investment account',
];

// account hierarchies
final List<String> accountHierarchies = ['individual account', 'group account'];
