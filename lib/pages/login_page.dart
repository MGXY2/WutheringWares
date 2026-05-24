import 'package:flutter/material.dart';
import 'package:wuthering_wares/pages/admin_page.dart';
import 'package:wuthering_wares/pages/main_page.dart';
import 'package:wuthering_wares/pages/register_page.dart';

import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool isLoading = false;

  void login() async {

    setState(() {
      isLoading = true;
    });

    try {

      final response =
          await AuthService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      setState(() {
        isLoading = false;
      });

      if(response['token'] != null){

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content:
            Text('Login Success'),
          ),
        );

        Future.delayed(
  const Duration(seconds: 1),
      () {
        if(response['user']['role'] == 'admin'){

          Navigator.pushReplacement(

            context,

            MaterialPageRoute(
              builder: (_) =>
              const AdminPage(),
            ),
          );

        }else{

          Navigator.pushReplacement(

            context,

            MaterialPageRoute(
              builder: (_) =>
              const MainPage(),
            ),
          );
        }
      },
);
      } else {

        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              response['message']
                  .toString(),
            ),
          ),
        );
      }

    } catch(e){

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Wuthering Wares',
        ),
      ),

      body: Padding(
        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller:
              emailController,

              decoration:
              const InputDecoration(
                labelText: 'Email',
                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
              passwordController,

              obscureText: true,

              decoration:
              const InputDecoration(
                labelText: 'Password',
                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              height: 50,

              child: ElevatedButton(

                onPressed:
                isLoading
                    ? null
                    : login,

                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                  'Login',
                ),
              ),
            ),
            const SizedBox(height: 20),

              TextButton(

                onPressed: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const RegisterPage(),
                    ),
                );
              },

              child: const Text(
                'Create Account',
              ),
            )
          ],
        ),
      ),
      
    );
  }
}