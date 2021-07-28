import 'package:flutter/material.dart';
import 'package:submission_dicoding/widgets/navdrawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("About",
            style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 20)
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            Text(
              'Tentang yang bikin app',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.blue,
              ),
            ),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/image/farizalw.jpg'),
            ),
            Text(
              'Farizal Wustho',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 24.0,
              ),
            ),
            Text(
              'Mahasiswa',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.blue,
              ),
            ),
            // button instagram
            InkWell(
              onTap: () {
                _launchInBrowser('https://www.instagram.com/wustho', context);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.deepPurple,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.portrait_outlined, color: Colors.white),
                  title: Text(
                    'Follow me on Instagram',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            //button Twitter
            InkWell(
              onTap: () {
                _launchInBrowser('https://www.twitter.com/WussDough', context);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.blue[400],
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.language_outlined, color: Colors.white),
                  title: Text(
                    'Follow me on Twitter',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            //button Linkedin
            InkWell(
              onTap: () {
                _launchInBrowser('https://www.linkedin.com/in/farizal-wustho', context);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.blue[900],
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading:
                      Icon(Icons.business_center_outlined, color: Colors.white),
                  title: Text(
                    'Follow me on LinkedIn',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _launchInBrowser('https://github.com/FarizalW', context);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Colors.grey[900],
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(Icons.wb_cloudy_outlined, color: Colors.white),
                  title: Text(
                    'Follow me on Github',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

// Fungsionalitas url-launcher
Future<void> _launchInBrowser(String url, BuildContext context) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
        title: Text("Waduh ada masalah."),
        content: Text("Mohon maaf, yang bikin aplikasinya masih noob nih."),
        actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
