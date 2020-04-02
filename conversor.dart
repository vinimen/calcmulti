import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:multcalculo/ajuda.dart';
import 'package:multcalculo/imc.dart';

const request = "https://api.hgbrasil.com/finance?format=json&key=32174a4d";

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Conversor(),
    theme: ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent))
      ),
    ),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Conversor extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Conversor> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:  Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }


  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(
                    child: Image.asset('assets/imagens/calcmulti.png'),
                    color: Colors.black,
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
                ),
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Conversor'),
          backgroundColor: Colors.blue,
        ),
        body:FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only
                        (right: 1000.0 )),
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
                          child: Column(
                            children: <Widget>[
                              Image.asset("assets/imagens/calcmulti.png" , width:180.0, height: 180.0,),
                            ],
                          ),
                        ),
                        builder: (BuildContext context, Widget child) {
                          return Transform.rotate(
                            angle: _controller.value,
                            child: child,
                          );
                        },
                      ),
                       Padding(padding: EdgeInsets.only(right: 1000.0,bottom: 150.0)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Carregando Dados ... ", style: TextStyle(fontSize: 25.0, color: Colors.blueAccent),
                            ),
                            Icon(Icons.loop, color: Colors.blueAccent, size: 25.0,)
                          ],
                        ),
                      ),
                    ],
                  );

                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Row(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(right: 80.0),),
                          Text('Necessario um conexão de rede', style: TextStyle(color: Colors.blue, fontSize: 19.0),
                          ),
                          Icon(Icons.error, color: Colors.blue, size: 19.0,),
                        ],
                      ),
                    );
                  } else {
                    dolar =
                    snapshot.data['results']['currencies']['USD']['buy'];
                    euro = snapshot.data['results']['currencies']['EUR']['buy'];

                    return SingleChildScrollView(
                      padding:  EdgeInsets.only(top: 50.0 , left: 10.0, right: 10.0, bottom: 105.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child:  buildTextField(
                                'Reais', 'R\$', realController, _realChanged),
                          ),

                           Divider(
                            height: 15.0,
                          ),
                          buildTextField('Dólares', 'US\$', dolarController,
                              _dolarChanged),
                           Divider(
                            height: 15.0,
                          ),
                          buildTextField(
                              'Euros', '£', euroController, _euroChanged),
                        ],
                      ),
                    );
                  }
              }
            })
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c,
    Function f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,focusColor: Colors.red,
        labelStyle: TextStyle(color: Colors.white),
        fillColor: Colors.red,
        border:  OutlineInputBorder(
        ),
        prefixText: prefix
    ),
    style: TextStyle(
        color: Colors.white, fontSize: 25.0
    ),
    onChanged: f,
    keyboardType: TextInputType.number,

  );
}
