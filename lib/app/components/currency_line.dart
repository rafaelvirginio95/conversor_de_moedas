import 'package:conversor_curso/app/models/currence_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedCurrency;
  final Function(CurrencyModel model) onChanged;

  CurrencyBox({
    Key key,
    @required this.items,
    @required this.controller,
    @required this.onChanged,
    @required this.selectedCurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              value: selectedCurrency,
              underline: Container(
                color: Colors.amber,
                height: 1,
              ),
              isExpanded: true,
              items: items
                  .map(
                    (currency) => DropdownMenuItem<CurrencyModel>(
                      value: currency,
                      child: Text(currency.name),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
