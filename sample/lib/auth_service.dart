// lib/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl =
    'https://lapka-nobxw.ondigitalocean.app/api'; // Update with your Strapi URL
const String hardcodedToken =
    'a61ff0ffb6cf8816b7dffaae8285df09a4f8d0251ebb5555cd88c5d262510b00f239e5c8770ad479cde4fbe488138ffbeee09992e529dcf2031d4d75bbdd8875268bef03af48d4ad1cc400cb98914ece6434256804c7aa1ca574ea3d3c7fb11cbfa25d226bbeb44f106e5387d0b1e293feb1fe86c1635fdb9ce1ae0a4f54000b'; // Replace with your hardcoded token if needed

// Function to register a user in Strapi
Future<void> registerUser(
    String email, String password, String username) async {
  final url =
      '$baseUrl/auth/local/register'; // Adjust with your Strapi endpoint

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful response
      print('User registered successfully: ${response.body}');
    } else {
      print('Registration failed. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

// Function to login user
Future<String?> loginUser(String email, String password) async {
  final url = '$baseUrl/auth/local'; // Endpoint for login

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'identifier': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['jwt']; // Token in the response
    } else {
      print('Login failed. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}

// Function to insert data into Strapi
Future<void> insertData(String name, String description) async {
  final url = '$baseUrl/items'; // Update with your Strapi endpoint

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $hardcodedToken', // Use the hardcoded token
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'data': {
          'name': name,
          'description': description,
        },
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful response
      print('Data inserted successfully: ${response.body}');
    } else {
      print('Insertion failed. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

// Function to fetch protected data with the hardcoded token
Future<void> fetchProtectedData() async {
  final url =
      '$baseUrl/protected-endpoint'; // Update with your protected endpoint

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization':
            'Bearer $hardcodedToken', // Use the hardcoded token here
      },
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print('Data: ${response.body}');
    } else {
      print('Request failed. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}
