import 'package:darul_rahman_app/core/base/base_page.dart';
import 'package:darul_rahman_app/features/auth/data/models/login_request.dart';
import 'package:darul_rahman_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends BasePage<AuthController> {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _obscurePassword = true.obs;

  @override
  Widget buildContent(BuildContext context) {
    _emailController.text = 'user@gmail.com';
    _passwordController.text = 'Password12@';
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),

          /// EMAIL
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email wajib diisi';
              }
              if (!GetUtils.isEmail(value)) {
                return 'Format email tidak valid';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          /// PASSWORD
          Obx(
            () => TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword.value,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    _obscurePassword.value = !_obscurePassword.value;
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password wajib diisi';
                }
                if (value.length < 6) {
                  return 'Password minimal 6 karakter';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 24),

          /// BUTTON LOGIN
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.login(
                  LoginRequest(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
