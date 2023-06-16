// sign in exceptions
class UserNotFoundAuthException implements Exception{}
class WrongPasswordAuthException implements Exception{}

// sign up Exceptions
class EmailAlreadyInUseAuthException implements Exception{}
class InvalidEmailAuthException implements Exception{}

// generic exceptions
class GenericAuthException implements Exception{}
class UserNotLoggedInAuthException implements Exception{}