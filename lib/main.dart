import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp3(),
  ));
}

class MyApp3 extends StatefulWidget {
  @override
  _MyApp3State createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolineControler = TextEditingController();
  var _resultado = "***";

  String _calcular(var precoAlcool, var precoGasolina){
    String resultado = "resultado";

    var alcool = str2double(precoAlcool);
    var gasolina = str2double(precoGasolina);

    if(alcool != null && gasolina != null){
      print("Vamos calcular");
      resultado = "Vamos calcular";

      double check = alcool/gasolina;
      if(check >= 0.7){
        resultado = "Melhor colocar gasolina";
      }
      else{
        resultado = "Melhor colocar alcool";
      }
    }
    else{
      print("Existem campos inválidos");
      resultado = "Preencha os campos corretamente";
    }

    return resultado;
  }

  double str2double(var texto){
      double value = 0.00;
      value = double.tryParse(texto);

      return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Álcool ou Gasolina"),backgroundColor: Colors.blueAccent,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch, //espaçamento lateral
          children: [
            Image.asset("images/logo.png"),
            Text("Saiba qual a melhor opção para abastecimento do seu carro: ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            TextField(
              controller: _alcoolController,
              decoration: InputDecoration(
              hintText: "Preço do Álcool. Ex: 3.49",
            ),
            maxLength: 4,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _gasolineControler,
              decoration: InputDecoration(
                hintText: "Preço da Gasolina. Ex: 4.59"
              ),
              maxLength: 4,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30,),
            RaisedButton(
              padding: EdgeInsets.all(15),
              onPressed: (){
                setState(() {
                  _resultado = _calcular(_alcoolController.text, _gasolineControler.text);
                });
              },
              child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 20),),
              color: Colors.blueAccent,
            ),
            SizedBox(height: 30,),
            Text(_resultado, textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
