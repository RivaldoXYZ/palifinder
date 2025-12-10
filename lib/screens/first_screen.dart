import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode palindromeFocus = FocusNode();

  bool isPalindrome(String text) {
    String clean = text.toLowerCase().replaceAll(" ", "");
    String reversed = clean.split('').reversed.join('');
    return clean == reversed;
  }

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    nameFocus.dispose();
    palindromeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withAlpha(76),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 48,
                  child: Column(
                    children: [
                      const Spacer(flex: 2),

                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(51),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person_add_alt_1,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      TextFormField(
                        controller: nameController,
                        focusNode: nameFocus,
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            fontSize: nameFocus.hasFocus ? 18 : 16,
                            color: nameFocus.hasFocus ? Colors.blue : Colors.black54,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.fromLTRB(20, 28, 20, 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF265C6A),
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      TextFormField(
                        controller: palindromeController,
                        focusNode: palindromeFocus,
                        decoration: InputDecoration(
                          labelText: "Palindrome",
                          labelStyle: TextStyle(
                            fontSize: palindromeFocus.hasFocus ? 18 : 16,
                            color: palindromeFocus.hasFocus ? Colors.blue : Colors.black54,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.fromLTRB(20, 28, 20, 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF265C6A),
                              width: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 36),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF265C6A),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            final result = isPalindrome(palindromeController.text)
                                ? "isPalindrome"
                                : "not palindrome";

                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                content: Text(result),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            "CHECK",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF265C6A),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Provider.of<UserProvider>(context, listen: false)
                                .setName(nameController.text);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SecondScreen()),
                            );
                          },
                          child: const Text(
                            "NEXT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const Spacer(flex: 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
