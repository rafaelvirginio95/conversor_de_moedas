import 'package:conversor_curso/app/components/currency_line.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController;
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: 40,
              ),
              CurrencyBox(
                selectedCurrency: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(
                    () {
                      homeController.toCurrency = model;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(
                selectedCurrency: homeController.fromCurrency,
                items: homeController.currencies,
                controller: fromText,
                onChanged: (model) {
                  setState(
                    () {
                      homeController.fromCurrency = model;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: Colors.amber,
                child: Text('CONVERTER'),
                onPressed: () {
                  homeController.convert();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
