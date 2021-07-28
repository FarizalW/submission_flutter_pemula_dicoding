import 'package:flutter/material.dart';
import 'package:submission_dicoding/routes/routes.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  final username = '';

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

// Untuk kontrol Login / register
enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  final TextEditingController _usernameFilter = TextEditingController();
  String _email = "";
  String _password = "";
  String _username = "";
  FormType _form = FormType.login;

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _usernameFilter.addListener(_usernameListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _usernameListen() {
    if (_usernameFilter.text.isEmpty) {
      _username = "";
    } else {
      _username = _usernameFilter.text;
    }
  }

  // Untuk mengganti dari login dan register
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Selamat Datang',
          style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 24),
        )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[            
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/logo/storelogo.png',
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                Text('Siapkah anda cuan dengan crypto?',
                    style:
                        TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 20)),
                Text('Gunakan Cuan Crypto!',
                    style:
                        TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 20)),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  _buildTextFields(),
                  _buildButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Untuk mengisi text
  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TextField(
              controller: _usernameFilter,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey, 
                      width: 5.0
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            child: TextField(
              controller: _emailFilter,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey, 
                      width: 5.0
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            child: TextField(
              controller: _passwordFilter,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey, 
                      width: 5.0
                  ),
                ),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  // Button Login, Register dll.
  Widget _buildButtons() {
    if (_form == FormType.login) {
      return Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
              ),
              child: Text('Login', style: TextStyle(fontSize: 24)),
              onPressed: _loginPressed,
            ),
            TextButton(
              child: Text('Belum Punya Akun? Klik disini.',style: TextStyle(fontSize: 20)),
              onPressed: _formChange,
            ),
            TextButton(
              child: Text('Lupa Password?',style: TextStyle(fontSize: 20)),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
              ),
              child: Text('Buat Akun', style: TextStyle(fontSize: 24)),
              onPressed: _createAccountPressed,
            ),
            TextButton(
              child: Text('Sudah Punya Akun? Klik disini.', style: TextStyle(fontSize: 20)),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  void _loginPressed() {
    print('The user wants to login with $_username, $_email and $_password');
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  void _createAccountPressed() {
    print(
        'The user wants to create an account with $_username, $_email and $_password');
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}
