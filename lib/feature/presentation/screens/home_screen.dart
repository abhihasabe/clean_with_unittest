import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            textAlign: TextAlign.center,
            controller: _userNameController,
            decoration: const InputDecoration(
              labelText: "Email ID",
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }
}
