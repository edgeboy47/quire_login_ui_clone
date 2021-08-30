import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quire_clone/auth/data/auth_service.dart';

part 'auth_cubit.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.unknown() = _Unknown;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure() = _Failure;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authenticator) : super(const AuthState.unknown());

  final AuthService _authenticator;

  Future<void> signOut() async {
    await _authenticator.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<void> signInWithGoogle() async {
    final user = await _authenticator.signInWithGoogle();
    if (user != null) emit(const AuthState.authenticated());
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authenticator.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    await _authenticator.signUpWithEmailAndPassword(
      email,
      password,
      name,
    );
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authenticator.sendPasswordResetEmail(email);
  }

  Future<void> confirmPasswordReset(String code, String newPassword) async {
    await _authenticator.confirmPasswordReset(code, newPassword);
  }

  void updateAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthState.unauthenticated());
      } else {
        emit(const AuthState.authenticated());
      }
    });
  }
}
