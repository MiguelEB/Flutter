import 'package:flutter/material.dart';
import 'package:imc/ui/calculator/widgets/widgets_calculator.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  String respuesta = "RESPUESTA";
  String mensaje = "";
  double imc = 0.0;

  void _calcular() {
    setState(() {
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text) / 100;
      imc = peso / (altura * altura);
      respuesta = imc.toStringAsFixed(1);
      if (imc < 18.5) {
        mensaje = "Usted está en peso bajo.";
      } else if (imc >= 18.5 && imc <= 24.9) {
        mensaje = "Usted está en peso normal.";
      } else if (imc >= 25 && imc <= 29.9) {
        mensaje = "Usted está en sobrepeso.";
      } else if (imc >= 30 && imc <= 34.9) {
        mensaje = "Usted está en obesidad leve.";
      } else if (imc >= 35 && imc <= 39.9) {
        mensaje = "Usted está en obesidad media.";
      } else if (imc >= 40) {
        mensaje = "Usted está en obesidad mórbida.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyContainer(
          child: Column(
            children: [
              Stack(
                children: [MyappContainer()],
              ),
              _sizeEspacio(),
              MyTextInput(inputController: _pesoController, label: "Peso kg"),
              _sizeEspacio(),
              MyTextInput(
                  inputController: _alturaController, label: "Altura Cm"),
              _sizeEspacio(),
              MyText(text: mensaje),
              _sizeEspacio(),
              MyButton(
                lblText: Text("Calcular"),
                press: (() => _calcular()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sizeEspacio() {
  return SizedBox(
    height: 30,
  );
}
