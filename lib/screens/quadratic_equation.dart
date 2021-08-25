import 'package:equations/equations.dart';
import 'package:flutter/material.dart';

class QuadraticEquations extends StatefulWidget {
  const QuadraticEquations({Key? key}) : super(key: key);

  @override
  _QuadraticEquationsState createState() => _QuadraticEquationsState();
}

class _QuadraticEquationsState extends State<QuadraticEquations> {
  var valueA;
  var valueB;
  var valueC;
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
            Text('f(x)= ax^2 + bx + c'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 50,
                    child: TextField(
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
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'b'),
                    onChanged: (b) {
                      valueB = double.parse(b);
                    },
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'c'),
                    onChanged: (c) {
                      valueC = double.parse(c);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                final equation = Quadratic(
                  a: Complex.fromReal(valueA),
                  b: Complex.fromReal(valueB),
                  c: Complex.fromReal(valueC),
                );
                print('$equation');

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
