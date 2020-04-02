import 'package:multcalculo/infor_conversor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multcalculo/infor_imc.dart';

// ignore: camel_case_types
class ajuda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('AJUDA'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Padding(padding:EdgeInsets.only(bottom: 75.0),),
          Card(
            margin:  EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            color: Colors.blueAccent,
            child: ListTile(
              leading: Image.asset('assets/imagens/calcmulti.png',),
              title: Text('COMO UTILIZAR CALCULADORA DE IMC ?', style: TextStyle(fontStyle: FontStyle.normal,
                  color: Colors.black, fontSize: 20.0, height: 1.0),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => infor_imc()));
              },
            ),
          ),
          Card(
            margin:  EdgeInsets.only(top: 30.0, left:10.0, right: 10.0),
            color: Colors.blueAccent,
            child: ListTile(
              leading: Image.asset('assets/imagens/calcmulti.png',),
              title: Text('COMO UTILIZAR O CONVERSO DE MOEDA ?', style: TextStyle(fontStyle: FontStyle.normal,
                fontSize: 20.0, height: 1.2,
                color: Colors.black,
              ),),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => infor_conversor()));
              },
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 30.0, left:10.0, right: 10.0),
            color: Colors.blueAccent,
            child: ListTile(
              leading: Image.asset('assets/imagens/calcmulti.png',),
              title: Text('QUAL A VERSAO DO SOFTWARE ?', style: TextStyle(fontStyle: FontStyle.normal,
                fontSize: 20.0, height: 1.2,
                color: Colors.black,
              ),),
              onTap: (){
                Navigator.pop(context,
                    MaterialPageRoute<dynamic>(builder: (context) => infor_conversor()));
              },
            ),
          ),
          Card(
            margin:  EdgeInsets.only(top: 30.0, left:10.0, right: 10.0),
            color: Colors.blueAccent,
            child: ListTile(
              leading: Image.asset('assets/imagens/calcmulti.png',),
              title: Text('COMO É BUSCADO O VALOR ATUALIZADO ?', style: TextStyle(fontStyle: FontStyle.normal,
                fontSize: 20.0, height: 1.2,
                color: Colors.black,
              ),),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => infor_conversor()));
              },
            ),
          ),
        ],
      ),
      primary: true,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        autofocus: true,
        splashColor: Colors.green,
        elevation: 500.0,
        backgroundColor: Colors.blueAccent,
        onPressed: (){},
        label: Text('Perguntar', style: TextStyle(fontSize: 19.0),),
        icon: Icon(Icons.add),
      ),
    );
  }
}
