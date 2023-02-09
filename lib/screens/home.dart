import 'package:cross_platform_app/constants.dart';
import 'package:cross_platform_app/screens/mainScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _focusNode = FocusNode();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      // print("Has focus: ${_focusNode.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter mobile number to continue',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.grey)),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  maxLength: 10,
                  focusNode: _focusNode,
                  keyboardType: TextInputType.number,
                  cursorWidth: 3,
                  cursorColor: Colors.amber,
                  autofocus: true,
                  cursorHeight: 25,
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                    fillColor: Colors.white,
                    filled: true,
                    prefixText: '+91        ',
                    prefixStyle: TextStyle(color: kblue, fontSize: 17),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                )),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MainScreen();
                }));
              },
              child: Text(
                'Continue',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        )
      ],
    ));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
