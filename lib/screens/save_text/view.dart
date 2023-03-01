import 'package:flutter/material.dart';
import 'package:online_course/core/cache_helper.dart';

class SaveTextScreen extends StatefulWidget {
  const SaveTextScreen({Key? key}) : super(key: key);

  @override
  State<SaveTextScreen> createState() => _SaveTextScreenState();
}

class _SaveTextScreenState extends State<SaveTextScreen> {
  final nameController = TextEditingController(text: CacheHelper.getWord());
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameController,
          ),
          ElevatedButton(
              onPressed: () {
                CacheHelper.saveWord(nameController.text);
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
