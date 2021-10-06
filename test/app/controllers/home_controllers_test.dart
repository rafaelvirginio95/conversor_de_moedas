import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/models/currence_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final HomeController homeController =
      HomeController(toText: toText, fromText: fromText);

  test(
    'deve converter real para dolar com virgula',
    () {
      toText.text = '2,0';
      homeController.convert();
      expect(fromText.text, '1.60');
    },
  );

  test(
    'deve converter real para dolar com ponto',
    () {
      toText.text = '2.0';
      homeController.convert();
      expect(fromText.text, '1.60');
    },
  );

  test(
    'deve converter dolar para real',
    () {
      toText.text = '1.0';
      homeController.toCurrency = CurrencyModel(
        name: 'Dolar',
        real: 5.63,
        dolar: 1.0,
        euro: 0.85,
        bitcoin: 0.000088,
      );
      homeController.fromCurrency = CurrencyModel(
        name: 'Real',
        real: 1.0,
        dolar: 0.8,
        euro: 0.15,
        bitcoin: 0.00016,
      );
      homeController.convert();
      expect(fromText.text, '5.63');
    },
  );
}
