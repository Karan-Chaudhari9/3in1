import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  var languages = ['Hindi', 'English', 'Gujarati'];
  var originLanguage = "From";
  var destinationLanguages = "To";
  var output = "";

  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text;
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = 'Failed to Translate';
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == 'English') {
      return 'en';
    } else if (language == 'Hindi') {
      return 'hi';
    } else if (language == 'Gujarati') {
      return 'gu';
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language Translator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(originLanguage),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,),
                  items: languages.map((String dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      originLanguage = value!;
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_right_alt_rounded),
                ),
                DropdownButton(
                  focusColor: Colors.white,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  hint: Text(destinationLanguages),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,),
                  items: languages.map((String dropDownStringItem) {
                    return DropdownMenuItem(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      destinationLanguages = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                autofocus: false,
                decoration: const InputDecoration(
                  labelText: 'Enter your text here',
                  labelStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                ),
                controller: languageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter text here to translate";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  translate(
                      getLanguageCode(originLanguage),
                      getLanguageCode(destinationLanguages),
                      languageController.text.toString());
                },
                child: const Text('Translate'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '\n$output',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
