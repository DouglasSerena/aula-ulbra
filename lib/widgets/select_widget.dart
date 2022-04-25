import 'package:ap1/domain/classes/select_item.dart';
import 'package:flutter/material.dart';

class SelectWidget extends StatefulWidget {
  String selected;
  List<SelectItem> items;
  void Function(String) onChange;

  SelectWidget({
    Key? key,
    required this.items,
    required this.onChange,
    required this.selected,
  }) : super(key: key);

  @override
  State<SelectWidget> createState() => _SelectWidgetState(
        items: items,
        selected: selected,
        onChange: onChange,
      );
}

class _SelectWidgetState extends State<SelectWidget> {
  List<SelectItem> items;
  String selected;
  void Function(String) onChange;

  _SelectWidgetState({
    required this.items,
    required this.onChange,
    required this.selected,
  }) : super();

  handleChanged(String? value) {
    setState(() => selected = value ?? "");
    onChange(value!);
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
        isExpanded: true,
        onChanged: handleChanged,
        icon: const Icon(Icons.arrow_drop_down),
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
            child: Text(
              item.label,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }
}
