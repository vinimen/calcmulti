import 'package:multcalculo/ajuda.dart';
import 'package:multcalculo/bruno.dart';
import 'package:multcalculo/conversor.dart';
import 'package:multcalculo/imc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: avoid_void_async
void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 1.0)),
              DrawerHeader(
                child: Container(
                  child: Image.asset('assets/imagens/calcmulti.png'),
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color:Colors.blueAccent,
                      width: 15.0,
                    ),
                    borderRadius: BorderRadius.circular(1.0),
                  ),

                ),
              ),
               SizedBox(
                height: 50.0,
              ),
              ListTile(
                  title: Text(
                    'Conta',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 19.0,
                        color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) => Conversor()));
                  }),
              ListTile(
                title: Text(
                  'Avaliações',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              ListTile(
                title: Text(
                  'Perguntas Frequentes',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 25.0,
                ),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ajuda()));
                },
              ),
              ListTile(
                title: Text(
                  'Conversor',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 25.0,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Conversor()));
                },
              ),
              ListTile(
                title: Text(
                  'Imc',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19.0,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 25.0,
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Imc()));
                },
              ),
               SizedBox(
                height: 1.0,
              ),
              ListTile(
                title: Text('Sair',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                    )),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 25.0,
                ),
                onTap: () {},
              ),
               SizedBox(
                height: 1.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black54,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculadora ++'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 50.0)),
          AnimatedBuilder(animation: _controller,
            child:Container(
              decoration:BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Colors.blueAccent,
                  width: 10.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.blueAccent,
              ),
              child: Image.asset('assets/imagens/calcmulti.png', height: 180.0,
                width: 180.0,),
            ),
            builder: (BuildContext context, Widget child) {
              return Transform.rotate(
                angle: _controller.value,
                child: child,
              );
            },
          ),
           Divider(
            height: 50.0,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Padding(padding: EdgeInsets.only(bottom: 50.0)),
              Align(
                alignment: Alignment.center,
                child: Card(
                  borderOnForeground: true,
                  child: RaisedButton(
                    padding:  EdgeInsets.only(
                        top: 15.0, left: 140.0, right: 140.0, bottom: 15.0),
                    child:  Text(
                      'Imc',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 19.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Imc()));
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 15.0)),
              Align(
                alignment: Alignment.center,
                child: Card(
                  borderOnForeground: true,
                  child: RaisedButton(
                    padding:  EdgeInsets.only(top: 13.0, right: 115.0, left: 115.0, bottom: 13.0),
                    child:  Text('Conversor' , style: TextStyle(fontStyle: FontStyle.normal, fontSize: 19.0),
                      textAlign: TextAlign.center,
                    ),
                    color: Colors.blue,
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Conversor()));
                    },
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Padding(padding: EdgeInsets.only(bottom:15.0)),
              Align(
                  alignment: Alignment.center,
                  child: Card(
                    borderOnForeground: true,
                    child: RaisedButton(
                      padding:  EdgeInsets.only(top: 15.0 , right: 90.0, left: 90.0 , bottom: 15.0),
                      child:  Text("Amor da sua vida" , style: TextStyle(fontStyle: FontStyle.normal, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context) => bruno()));
                      },
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
