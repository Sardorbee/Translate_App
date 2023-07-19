import 'package:flutter/material.dart';
import 'package:translate_app/services/network/api.dart';
import 'package:translate_app/ui/utils/country_codes_3066.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lang1 = 'uz'; // Default source language (English)
  String lang2 = 'en'; // Default target language (Spanish)
  String translatedText = ''; // Translated text will be stored here

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopSide(),
              _buildbottomSide(),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _translateText();
                  },
                  child: const Text(
                    style: const TextStyle(fontSize: 22),
                    'Translate',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSide() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<Map<String, String>>(
            value: languageList.firstWhere((lang) => lang['code'] == lang1),
            items: languageList.map((lang) {
              return DropdownMenuItem<Map<String, String>>(
                value: lang,
                child: Text(
                  lang['name']!,
                  style: const TextStyle(fontSize: 22),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                lang1 = newValue!['code']!;
              });
            },
          ),
          const SizedBox(height: 20),
          Container(
            height: 200, // Set a fixed height for the TextField container
            child: TextField(
              controller: textController,
              style: const TextStyle(fontSize: 22),
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: 'Enter text to translate',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildbottomSide() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<Map<String, String>>(
            value: languageList.firstWhere((lang) => lang['code'] == lang2),
            items: languageList.map((lang) {
              return DropdownMenuItem<Map<String, String>>(
                value: lang,
                child: Text(
                  lang['name']!,
                  style: const TextStyle(fontSize: 22),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                lang2 = newValue!['code']!;
              });
            },
          ),
          const SizedBox(height: 20),
          Container(
            height: 150, // Set a fixed height for the Text container

            child: Center(
              child: Text(
                translatedText.toString(),
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // List of supported languages (replace this with your own list)

  void _translateText() async {
    String textToTranslate = textController.text;
    try {
      final translatedResult =
          await ApiProvider().fetchTransData(textToTranslate, lang1, lang2);
      print(translatedResult);
      setState(() {
        translatedText = translatedResult.responseData.translatedText;
      });
    } catch (e) {
      print('Error: $e');
    }
  }
}
