import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;
import 'Register.dart';
import 'AuthStore.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);
  
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if(jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      home: FutureBuilder(
        future: jwtOrEmpty,            
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const CircularProgressIndicator();
          if(snapshot.data != "") {
            var str = snapshot.data as String;
            var jwt = str.split(".");

            if(jwt.length !=3) {
              return const MyForm();
            } else {
              var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
              if(DateTime.fromMillisecondsSinceEpoch(payload["exp"]*1000).isAfter(DateTime.now())) {
                return AfterLogin(str, payload);
              } else {
                return const MyForm();
              }
            }
          } else {
            return const MyForm();
          }
        }
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
    final _formKey = GlobalKey<FormState>();

    String name = "";
    String pass = "";
    bool _passwordVisible = true;
    

    Future<String?> login(String username, String password) async {
      var res = await http.get(
        Uri.parse('https://eduspace-api.herokuapp.com/api/auth/login?username={$username}&password={$password}') // Ini bisa diubah sesuai keperluan
      );
      if(res.statusCode == 200) return res.body;
      return null;
    }

    void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          title: Text(title),
          content: Text(text)
        ),
    );

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(246, 249, 252, 1)),
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Image.asset(
                    'assets/images/logoblack.jpg',
                    height: 125,
                    width: 275,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          height: 240,
                          width: 275,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(20.0, 20.0))),
                          child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                  child: Container(
                                      padding: const EdgeInsets.all(35.0),
                                      child: Column(children: [
                                        Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: "Username",
                                                  hintText:
                                                      "Enter Your Name (eg: David Silva)",
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value != null &&
                                                      value.isEmpty) {
                                                    return "Username cannot be empty";
                                                  }
                                                  name = value.toString();
                                                  return null;
                                                })),
                                        Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: TextFormField(
                                                obscureText: _passwordVisible,
                                                decoration: InputDecoration(
                                                    labelText: "Password",
                                                    hintText:
                                                        "Enter Your Password",
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                  focusedErrorBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                  ),
                                                    suffixIcon: IconButton(
                                                        icon: Icon(_passwordVisible
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off),
                                                        onPressed: () {
                                                          setState(() {
                                                            _passwordVisible =
                                                                !_passwordVisible;
                                                          });
                                                        })),
                                                validator: (String? value) {
                                                  if (value != null &&
                                                      value.isEmpty) {
                                                    return "Password cannot be empty";
                                                  }
                                                  pass = value.toString();
                                                  return null;
                                                })),
                                      ])))))),
                  const SizedBox(height: 5),
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                          child: const Text("Login"),
                          onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          var username = name;
                          var password = pass;
                          var jwt = await login(username, password);
                          if(jwt != null) {
                            storage.write(key: "jwt", value: jwt);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (context) => AfterLogin.fromBase64(jwt) //Tujuan dapat diganti
                            ), (route) => false);
                          } else {
                            displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
                          }
                        }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(275, 25),
                            primary: const Color.fromRGBO(0, 22, 42, 20),
                            onSurface: const Color.fromRGBO(0, 22, 42, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ))),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        const Text("Don't have an account?",
                            textAlign: TextAlign.center),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                           MaterialPageRoute(builder : (context) => MyRegForm()));
                          },
                          child: const Text('Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ]))
                ]))));
  }
}



// Dummy after login page
class AfterLogin extends StatelessWidget{
  AfterLogin(this.jwt, this.payload);

  factory AfterLogin.fromBase64(String jwt) =>
    AfterLogin(jwt, json.decode(
        ascii.decode(
          base64.decode(base64.normalize(jwt.split(".")[1]))
        )
      ));

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Data Screen")),
      body:  Center(
        child: FutureBuilder(
          future: _getAuth(jwt),
          builder: (context, snapshot) =>
            // snapshot.hasData ?
            // HomePage() // Akan disesuaikan 
            // :
            // snapshot.hasError ? const Text("An error occurred") : const CircularProgressIndicator()
            Text("$payload")
        ),
        // child: Text("$payload")
      ),
    );
  }
  
  Future <String> _getAuth(String jwt) async {
    var res = await http.get(
        Uri.parse(''), // Disesuaikan dengan get yang ingin didapatkan.
        headers: {
        "Authorization": "Bearer ${json.decode(jwt)['access']}",
      });
    return res.body;

  }

}
