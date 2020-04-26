import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar(
      {this.color: Colors.white, this.preferredSize: const Size.fromHeight(0)});
  final color;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
    );
  }
}
