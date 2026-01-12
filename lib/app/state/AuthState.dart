class AuthState {
  final bool loading;
  final bool success;
  final String error;
  final String message;

  AuthState({
    this.loading = false,
    this.success = false,
    this.error = "",
    this.message="",
  });

  AuthState copyWith({
    bool? loading,
    bool? success,
    String? error,
    String? message,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }



}
