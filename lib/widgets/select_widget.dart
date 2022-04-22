import 'package:flutter/material.dart';

class SelectItem {
  String value;
  String label;

  SelectItem({required this.value, required this.label});
}

class SelectWidget extends StatefulWidget {
  List<SelectItem> items;
  dynamic selected;

  SelectWidget({Key? key, required this.items, required this.selected})
      : super(key: key);

  @override
  State<SelectWidget> createState() =>
      _SelectWidgetState(selected: selected, items: items);
}

class _SelectWidgetState extends State<SelectWidget> {
  List<SelectItem> items;
  dynamic selected;

  _SelectWidgetState({required this.items, required this.selected}) : super();

  onChanged(String? value) {
    setState(() => selected = value ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        iconSize: 42,
        value: selected,
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          filled: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        items: items.map<DropdownMenuItem<String>>((SelectItem item) {
          return DropdownMenuItem<String>(
            value: item.value,
            child: Text(item.label),
          );
        }).toList(),
      ),
    );
  }
}
