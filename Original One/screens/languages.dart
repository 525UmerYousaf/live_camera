// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Choose Your Preferred Language',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'From the below languages, Please choose your native language, later you can change language from settings.',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              height: 300,
              width: double.infinity,
              child: ListView(
                children: [
                  _buildOption('English',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/English_language.svg/45px-English_language.svg.png'),
                  _buildOption('Akan',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Flag_of_Ghana.svg/45px-Flag_of_Ghana.svg.png'),
                  _buildOption('German',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/45px-Flag_of_Germany.svg.png'),
                  _buildOption('Hindi',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_India.svg/45px-Flag_of_India.svg.png'),
                  _buildOption('Turkish',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/45px-Flag_of_Turkey.svg.png'),
                  _buildOption('Urdu',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Flag_of_Pakistan.svg/45px-Flag_of_Pakistan.svg.png'),
                  _buildOption('Hungarian',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Flag_of_Hungary.svg/45px-Flag_of_Hungary.svg.png'),
                  _buildOption('French',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/45px-Flag_of_France.svg.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.amber,
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => AccessScreen(),
            // ));
          },
          child: const Text('Next'),
        ),
      ),
    );
  }

  Widget _buildOption(String name, String img) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          minLeadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.fitWidth),
              ),
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          trailing: Checkbox(value: true, onChanged: (value) {}),
        ),
      ),
    );
  }
}
