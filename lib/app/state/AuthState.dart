class AuthState {
  final bool success;
  final String error;
  final String message;

  AuthState({
    this.success = false,
    this.error = "",
    this.message="",
  });



  AuthState copyWith({
    bool? success,
    String? error,
    String? message,
  }) {
    return AuthState(
      success: success ?? this.success,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }



}
