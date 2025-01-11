import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<bool> customSignUp(String email, String password) async {
    try {
      print('Attempting to sign up with email: $email');

      final response = await _client
          .from('users')
          .insert({'email': email, 'password': password})
          .execute();

      if (response.error != null) {
        print('Sign-up error: ${response.error!.message}');
        return false;
      }

      print('Sign-up successful. Response: ${response.data}');
      return true;
    } catch (e) {
      print('Unexpected error during sign-up: $e');
      return false;
    }
  }

  Future<bool> customLogin(String email, String password) async {
    try {
      print('Attempting to log in with email: $email');

      final response = await _client
          .from('users')
          .select()
          .eq('email', email)
          .eq('password', password)
          .single()
          .execute(); 

      if (response.error != null) {
        print('Login error: ${response.error!.message}');
        return false;
      }

      if (response.data != null) {
        print('Login successful. User data: ${response.data}');
        return true;
      } else {
        print('Invalid email or password.');
        return false;
      }
    } catch (e) {
      print('Unexpected error during login: $e');
      return false;
    }
  }
}

extension on PostgrestResponse {
  get error => null;
}
