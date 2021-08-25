import 'package:equations/equations.dart' as poly;
import 'package:flutter/material.dart';

class CubicEquations extends StatefulWidget {
  const CubicEquations({Key? key}) : super(key: key);

  @override
  _CubicEquationsState createState() => _CubicEquationsState();
}

class _CubicEquationsState extends State<CubicEquations> {
  var valueA;
  var valueB;
  var valueC;
  var valueD;
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
            Text('f(x)= ax^3 + bx^2 + cx + d'),
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
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'c'),
                    onChanged: (c) {
                      valueC = double.parse(c);
                    },
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'd'),
                    onChanged: (d) {
                      valueD = double.parse(d);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                final equation = poly.Cubic(
                  a: poly.Complex.fromReal(valueA),
                  b: poly.Complex.fromReal(valueB),
                  c: poly.Complex.fromReal(valueC),
                  d: poly.Complex.fromReal(valueD),
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
