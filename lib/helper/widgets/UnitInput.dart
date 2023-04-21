import 'package:flutter/material.dart';

class UnitInput extends StatefulWidget {
  final List<String> units;
  final String initialValue;
  final Function(String) onValueChanged;

  const UnitInput({
    super.key,
    required this.units,
    required this.initialValue,
    required this.onValueChanged,
  });

  @override
  _UnitInputState createState() => _UnitInputState();
}

class _UnitInputState extends State<UnitInput> {
  late String _selectedUnit;

  @override
  void initState() {
    super.initState();
    _selectedUnit = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Unit',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedUnit,
          onChanged: (String? newValue) {
            setState(() {
              _selectedUnit = newValue!;
            });
            widget.onValueChanged(_selectedUnit);
          },
          items: widget.units.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
