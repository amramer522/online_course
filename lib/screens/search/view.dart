import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

  List<String> words = ["Hello","How are you?","How old are you?","I am fine thank you","Good"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset("assets/icons/arrow_back.png"),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Search Categories",
                      enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                      ),
                      filled: true,
                      fillColor: Color(0xffE6E6E6)
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Container(
                  height: 48,
                  width: 48,
                  child: Center(child: Icon(Icons.search,color: Colors.white,)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Wrap(
              children: List.generate(words.length, (index) => Container(
                margin: EdgeInsetsDirectional.only(end: 16,top: 16),
                  padding: EdgeInsets.all(12.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey)
              ),child: Text(words[index],),),),
            ),
          )

        ],
      ),
    );
  }
}
