import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';

class MyRegForm extends StatefulWidget {
    @override
    _MyRegFormState createState() => _MyRegFormState();
}

class _MyRegFormState extends State<MyRegForm> {
    final _formKey = GlobalKey<FormState>();

    String name = "";
    String email = "";
    String pass = "";
    String pass2 = "";
    bool _passwordVisible = true;
    bool _passwordVisible2 = true;

    Future<int> register(String username, String password) async {
      var res = await http.post(
        Uri.parse('https://eduspace-api.herokuapp.com/api/auth/register?name={$username}&username={$username}&password={$password}'),
      );
      return res.statusCode;
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
              decoration: const BoxDecoration(
                color: Colors.white
              ),
            child : Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children : [
                  Image.asset('assets/images/logoblack.jpg',
                    height: 100,
                    width: 275,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width  : 275,
                      height : 335,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(Radius.elliptical(20.0, 20.0))
                      ),
                      child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(              
                        padding: const EdgeInsets.all(25.0),
                        child: Column(children: [
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Username",
                                      hintText: "Enter Your Name (eg: David Silva)"
                                  ),
                                  validator: (String? value) {
                                    if (value != null && value.isEmpty) {
                                      return "Please use the valid username";
                                    }
                                    name = value.toString();
                                    return null;
                                  })),
                          const SizedBox(height: 3.0),
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: "Email",
                                      hintText: "Enter Your Email (eg: Davidsilva@gmail.com)",
                                  ),
                                  validator: (String? value) {
                                    if (value != null && value.isEmpty){
                                      return "Please fill this space";
                                    } else if(value != null && !value.contains("@")){
                                      return "Please use your valid email";
                                    }
                                    email = value.toString();
                                    return null;
                                  })),
                          const SizedBox(height: 3.0),
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  obscureText: _passwordVisible,
                                  decoration: InputDecoration(     
                                      labelText: "Password",
                                      hintText:
                                          "Enter Your Password",
                                      suffixIcon: IconButton(
                                            icon: Icon(
                                                _passwordVisible ? Icons.visibility : Icons.visibility_off),
                                                onPressed: () {
                                                   setState(() {
                                                      _passwordVisible = !_passwordVisible;
                                                   });
                                                })
                                  ),
                                  validator: (String? value) {
                                    if (value != null && value.isEmpty) {
                                      return "Password cannot be empty";
                                    } else if(value != null && value.length < 8){
                                      return "Password must be at least 8 characters long";
                                    }
                                    pass = value.toString();
                                    return null;
                                  })),
                          const SizedBox(height: 3.0), 
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                  obscureText: _passwordVisible2,
                                  decoration: InputDecoration(     
                                      labelText: "Confirm Password",
                                      hintText:
                                          "Enter The Same Password",
                                      suffixIcon: IconButton(
                                            icon: Icon(
                                                _passwordVisible2 ? Icons.visibility : Icons.visibility_off),
                                                onPressed: () {
                                                   setState(() {
                                                      _passwordVisible2 = !_passwordVisible2;
                                                   });
                                                })
                                  ),
                                  validator: (String? value) {
                                    if (value != null && value != pass) {
                                      return "Password doesn't match";
                                    }
                                    pass2 = value.toString();
                                    return null;
                                  })),
                        ])))))
                  ),
                  const SizedBox(height : 5),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      child: const Text("Register"),                       
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var username = name;
                          var password = pass;
                          var res = await register(username, password);              
                          if(res == 200){
                            displayDialog(context, "Success", "The user was created. Log in now.");
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => MyForm()));
                          }
                          else if(res == 400) {
                            displayDialog(context, "That username is already registered", "Please try to sign up using another username or log in if you already have an account.");  
                          }
                          else {
                            displayDialog(context, "Error", "An unknown error occurred.");
                          }
                        } 
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(0, 22, 42, 20),
                        onSurface: const Color.fromRGBO(0, 22, 42, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ))
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Text(
                          "Already have an account?",
                          textAlign: TextAlign.center
                                  ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, 
                                           MaterialPageRoute(builder : (context) => MyForm()));
                          },
                          child: const Text('Sign in',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold)
                                  )  ,
                        ),
                        
                      ]
                    )
                  )
                ]
            ))));
    }
}
