import 'package:multcalculo/ajuda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multcalculo/conversor.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Imc(),
  ));
}

class Imc extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Imc>  with SingleTickerProviderStateMixin{
  AnimationController _controller;
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = 'Informe seus Dados !';


  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe seus dados!';
    });

  }

  // ignore: non_constant_identifier_names
  void _Calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Peso Ideal (${imc.toStringAsPrecision(3)}';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)}';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(3)}';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(3)}';
      } else if (imc >= 40) {
        _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(3)}';
      }
    });
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
        appBar: AppBar(
          centerTitle: true,
          title:  Text('CALCULADORA DE IMC', style: TextStyle(fontStyle: FontStyle.normal, fontSize: 15.0),),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
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
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blueAccent,
                    ),
                    child: Image.asset('assets/imagens/calcmulti.png', height: 200.0,
                      width: 200.0,),
                  ),
                  builder: (BuildContext context, Widget child) {
                    return Transform.rotate(
                      angle: _controller.value,
                      child: child,
                    );
                  },
                ),
                Divider(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Peso em (KG)',
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20.0),
                  controller: weightController,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'insira seu peso !';
                    }
                  },
                ),

                 Divider(
                  height: 25.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Altura(M)',
                      labelStyle: TextStyle(color: Colors.white)),
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20.0),
                  controller: heightController,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe sua altura';
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _Calculate();
                        }
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                           Text('CALCULAR' , style:TextStyle(fontStyle: FontStyle.normal, fontSize: 20.0),
                          ),
                        ],
                      ),
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                )
              ],
            ),
          ),
        ));
  }
}
