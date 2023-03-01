import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DialogsScreen extends StatelessWidget {
  const DialogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      builder: (context) => AlertDialog(
                        title: Text("Close App"),
                        backgroundColor: Colors.green,
                        elevation: 0,
                        content: Text("Are you sure to close app"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("sure")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                        ],
                      ),
                      context: context,
                    );
                  },
                  child: Text("Show Alert Dialog"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      builder: (context) => SimpleDialog(
                        title: Text("Hello Title"),
                        children: [
                          Text("dasdksahd"),
                          Text("dasdksahd"),
                          Text("dasdksahd"),
                          Text("dasdksahd"),
                        ],
                      ),
                      context: context,
                    );
                  },
                  child: Text("Show Simple Dialog"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      builder: (context) => AboutDialog(
                        applicationName: "Online Course",
                        applicationVersion: "1.0.0",
                        applicationIcon: FlutterLogo(),
                        applicationLegalese: "Hello",
                      ),
                      context: context,
                    );
                  },
                  child: Text("Show About Dialog"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      builder: (context) => CupertinoAlertDialog(
                        title: Text("Hello"),
                        content: Text("hello" * 10),
                      ),
                      context: context,
                    );
                  },
                  child: Text("Show CupertinoAlertDialog"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // showTimePicker(context: context, initialTime: TimeOfDay.now());
                    var selectedDay = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().add(Duration(days: 1)),
                        firstDate: DateTime.now().subtract(Duration(days: 7)),
                        lastDate: DateTime.now().add(Duration(days: 365)));

                    if (selectedDay != null) {
                      print(selectedDay.toString().split(" ").first);
                      print(DateFormat.EEEE().format(selectedDay));
                    }
                  },
                  child: Text("Show showDatePicker"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var time = await showTimePicker(
                      builder: (context, child) => MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child!),
                      context: context,
                      initialTime: TimeOfDay.now(),
                      // initialEntryMode: TimePickerEntryMode.input,
                    );
                    print(time!.format(context));
                  },
                  child: Text("Show TimePickerDialog"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var time = await showDateRangePicker(
                      builder: (context, child) => Theme(data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.green, // <-- SEE HERE
                            onPrimary: Colors.blue, // <-- SEE HERE
                            onSurface: Colors.black, // <-- SEE HERE
                          ),
                      ), child: child!),
                        context: context,
                        confirmText: "Save",
                        firstDate: DateTime.now().add(Duration(days: 1)),
                        lastDate: DateTime.now().add(Duration(days: 10)));
                    print(time);
                  },
                  child: Text("Show showDateRangePicker"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
