import 'package:dictonary/services/dictclient.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  dictclient dclient = dictclient();
  TextEditingController tc = TextEditingController();
  String meaning = "null";
  callAPI(q) async {
    // dclient.searchForWord(query: q);
    meaning = await dclient.searchForWord(query: q);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("DICTIONARY"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          // color: Colors.teal,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: tc,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.clear)),
                      label: const Text("DICT"),
                      hintText: "Enter a Word Here"),
                  // style: ,
                  keyboardType: TextInputType.text,
                  onChanged: (string) {
                    // print(textfield.text); //controller--> text
                    print("This is the text from the textfield $string");
                  },
                  onEditingComplete: () {
                    // print(
                    //     // "this is the final submission from the textfield ${txtfld.text}");
                  },
                ),
                OutlinedButton(
                    onPressed: () {
                      callAPI(tc.text);

                      setState(() {});
                    },
                    child: const Text("search")),
                Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Text(meaning),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
