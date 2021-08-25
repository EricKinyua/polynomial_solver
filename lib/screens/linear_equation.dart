import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LinearEquations extends StatefulWidget {
  const LinearEquations({Key? key}) : super(key: key);

  @override
  _LinearEquationsState createState() => _LinearEquationsState();
}

class _LinearEquationsState extends State<LinearEquations> {
  final formKey = GlobalKey<FormState>();
  var valueA;
  var valueB;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace values of the coefficients in the textfields',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Text('f(x)= ax + b'),
            SizedBox(height: 20),
            Form(
              key: formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: 'a'),
                        onChanged: (a) {
                          valueA = double.parse(a);
                        },
                      )),
                  SizedBox(width: 20),
                  SizedBox(
                      width: 50,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: 'b'),
                        onChanged: (String b) {
                          valueB = double.parse(b);
                        },
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                final equation = Linear(
                  a: Complex.fromReal(valueA),
                  b: Complex.fromReal(valueB),
                );
                print(equation);
                print(equation.solutions().toString());
                for (final root in equation.solutions()) {
                  print(root);
                }
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Function and solutions'),
                    content: Column(
                      children: [
                        Text(equation.toString()),
                        SizedBox(
                          height: 20,
                        ),
                        Text('The possible value(s) of x are:'),
                        SizedBox(
                          height: 20,
                        ),
                        Text(equation.solutions().join(", " + "\n ")),
                      ],
                    ),
                  ),
                );
              },
              child: Text('Solve'),
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}
