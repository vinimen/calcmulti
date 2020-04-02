import 'package:flutter/material.dart';

class infor_conversor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ajuda"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            color: Colors.blue,
            child: ListTile(
              leading: Icon(Icons.looks_one, size: 30, color: Colors.black,),
              title: Text('Digite o valor em reais !', style: TextStyle(fontStyle: FontStyle.normal,
                  color: Colors.black, fontSize: 20.0, height: 1.0),),
              onTap: (){},
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            color: Colors.blue,
            child: ListTile(
              leading: Icon(Icons.looks_one, size: 30, color: Colors.black,),
              title: Text("Insira o valor de dolares !", style: TextStyle(fontStyle: FontStyle.normal,
                  color: Colors.black, fontSize: 20.0, height: 1.0),),
              onTap: (){},
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            color: Colors.blue,
            child: ListTile(
              leading: Icon(Icons.looks_one, size: 30, color: Colors.black,),
              title: Text("Insira o valor de euro !", style: TextStyle(fontStyle: FontStyle.normal,
                  color: Colors.black, fontSize: 20.0, height: 1.0),),
              onTap: (){},
            ),
          ),

        ],
      ),
    );
  }
}
