import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<void> registerUser(String username, String email, String password,
      String name, String contact) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: {
        'username': username,
        'email': email,
        'password': password,
        'name': name,
        'contact': contact,
      },
    );

    if (response.statusCode == 200) {
      // Successful registration
      print('User registered successfully');
    } else {
      // error
      print('User registration failed: ${response.reasonPhrase}');
    }
  }

  Future<void> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login
      final token = response.body;
      print('Login successful. Token: $token');
    } else {
      // error
      print('Login failed: ${response.reasonPhrase}');
    }
  }
}
