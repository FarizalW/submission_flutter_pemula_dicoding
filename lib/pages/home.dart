import 'package:flutter/material.dart';
import 'package:submission_dicoding/routes/routes.dart';
import 'package:submission_dicoding/widgets/navdrawer.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
            'Home', 
            style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 20),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {showDialog(
                context: context, builder: (context) =>
                  AlertDialog(
                    title: Text("Waduh belum bisa sharing nih."),
                    content: Text("Mohon maaf, yang bikin aplikasinya masih noob nih."),
                    actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                  ),
                );}, icon: Icon(Icons.share_outlined))
        ],
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
            Text('Selamat Datang', 
                style: TextStyle(fontFamily: 'PlayfairDisplay', 
                fontSize: 24),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3, 
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image(image: AssetImage('assets/logo/storelogo.png')))
            ),
            Container(child: 
              Text  ('Aplikasi ini dibuat dengan tujuan untuk melihat harga cryptocurrency dan memberi pembelajaran mengenai cryptocurrency.', 
                style: TextStyle(fontFamily: 'SourceSansPro', 
                fontSize: 20)),
              padding: EdgeInsets.symmetric(horizontal: 15),  
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.all(40),
                  ),
                  onPressed: ()=>Navigator.pushReplacementNamed(context, Routes.belajar), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[                  
                      Column( mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.note_outlined, size: 48),
                          Container(
                            padding: EdgeInsets.only(top:10.0,bottom: 10.0, left: 20, right: 20),
                            child: Text(
                              'Belajar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), 
                    ),
                    padding: EdgeInsets.all(40),
                  ),
                  onPressed: ()=>Navigator.pushReplacementNamed(context, Routes.crypto), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[                      
                      Column( mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.trending_up_outlined, size: 48),
                          SizedBox(),
                          Container(
                            padding: EdgeInsets.only(top:10.0,bottom: 10.0, left: 20, right: 20),
                            child: Text(
                              'Crypto',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
