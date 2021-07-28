import 'package:flutter/material.dart';
import 'package:submission_dicoding/model/model_belajar.dart';
import 'package:submission_dicoding/widgets/navdrawer.dart';
import 'package:submission_dicoding/widgets/search.dart';
import 'package:submission_dicoding/pages/belajar/detail_belajar.dart';
import 'package:submission_dicoding/widgets/favoritebutton.dart';

class BelajarPage extends StatelessWidget {
  static const String routeName = '/belajar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text("Belajar",
              style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 20)),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: Icon(Icons.search_outlined))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ModelBelajarList();
            },
          ),
        ));
  }
}

class ModelBelajarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final ModelBelajar modelBelajar = modelBelajarList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(modelBelajar: modelBelajar);
              }));
            },
            child: Card(
              color: Color(0xFFFAFAFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)),
                      child: Image.asset(modelBelajar.imageAsset),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            modelBelajar.title,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FavoriteButton()
                ],
              ),
            ),
          );
        },
        itemCount: modelBelajarList.length,
      ),
    );
  }
}
