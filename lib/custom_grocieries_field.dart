import 'package:flutter/material.dart';

class CustomGroceriesField extends StatefulWidget {
  final String text;
  final bool isChecked;
  final VoidCallback? onChanged;

  const CustomGroceriesField({
    super.key,
    required this.text,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  State<CustomGroceriesField> createState() => _CustomGroceriesFieldState();
}

class _CustomGroceriesFieldState extends State<CustomGroceriesField> {
  late bool val;

  @override
  void initState() {
    super.initState();
    val = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: val,
              onChanged: (value) {
                setState(() => val = value ?? false);
                widget.onChanged?.call();
              },
              activeColor: Color(0xFF4DB6AC),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                decoration: TextDecoration.none,
                decorationColor: Colors.grey,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline, color: Colors.grey[400], size: 28),
          ),
        ],
      ),
    );
  }
}
