import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var nameController = TextEditingController();
  var nameValue = "NO value saved" ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                  )
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (


                      ) async{
                    // var name = nameController.text.toString();
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString("name", nameController.text.toString());
                    setState(() {

                    });

                  },
                  child: Text("Save")
              ),
              SizedBox(height: 20,),
              Text(nameValue),
              Text(nameController.text.toString()),

            ],
          ),
        ),
      ),

    );
  }

  void getValue() async{
    var pref = await SharedPreferences.getInstance();
    var getName = pref.getString("name");

    nameValue = getName ?? "No value ved" ;
    setState(() {

    });
  }
}
