import 'package:flutter/material.dart';

// ignore: camel_case_types
class infor_imc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(0.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('AJUDA'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              color: Colors.blue,
              child: ListTile(
                leading: Icon(Icons.looks_one, size: 30, color: Colors.black,),
                title: Text('INSIRA O VALOR DO SEU PESO !', style: TextStyle(fontStyle: FontStyle.normal,
                    color: Colors.black, fontSize: 20.0, height: 1.0),),
                onTap: (){},
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              color: Colors.blue,
              child: ListTile(
                leading: Icon(Icons.looks_two, size: 30, color: Colors.black,),
                title: Text('INSIRA O VALOR DA SUA ALTURA !', style: TextStyle(fontStyle: FontStyle.normal,
                    color: Colors.black, fontSize: 20.0, height: 1.0),),
                onTap: (){},
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
              color: Colors.blue,
              child: ListTile(
                leading: Icon(Icons.looks_3, size: 30, color: Colors.black,),
                title: Text('PARA FINALIZAR APERTE EM CALCULAR !', style: TextStyle(fontStyle: FontStyle.normal,
                    color: Colors.black, fontSize: 20.0, height: 1.0),),
                onTap: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
