import 'package:flutter/material.dart';
import 'package:polynomial_solver/screens/cubic_equation.dart';
import 'package:polynomial_solver/screens/linear_equation.dart';
import 'package:polynomial_solver/screens/login.dart';
import 'package:polynomial_solver/screens/quadratic_equation.dart';

class PolynomialCalc extends StatelessWidget {
  const PolynomialCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('POLYNOMIALS'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Linear'),
              Tab(text: 'Quadratic'),
              Tab(text: 'Cubic'),
              Tab(text: 'Login'),
            ],
          ),
        ),
        body: TabBarView(children: [
          LinearEquations(),
          QuadraticEquations(),
          CubicEquations(),
          LoginScreen(),
        ]),
      ),
    );
  }
}
