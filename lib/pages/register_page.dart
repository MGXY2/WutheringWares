import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class RegisterPage
    extends StatefulWidget {

  const RegisterPage({
    super.key
  });

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {

  final usernameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool isLoading = false;

  void register() async {

    setState(() {
      isLoading = true;
    });

    try {

      final response =
          await AuthService.register(

        usernameController.text.trim(),

        emailController.text.trim(),

        passwordController.text.trim(),
      );

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            response['message']
                .toString(),
          ),
        ),
      );

      if(response['message']
      == 'Register success'){

        Navigator.pop(context);
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
          'Register',
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(

              controller:
              usernameController,

              decoration:
              const InputDecoration(

                labelText:
                'Username',

                border:
                OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(

              controller:
              emailController,

              decoration:
              const InputDecoration(

                labelText:
                'Email',

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

                labelText:
                'Password',

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
                    : register,

                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                  'Register',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}