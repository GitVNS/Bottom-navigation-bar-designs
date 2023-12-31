import 'package:bottom_navigation_bars/constants.dart';
import 'package:bottom_navigation_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Design1 extends StatefulWidget {
  const Design1({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<CustomBottomNavigationItem> items;
  final int selectedIndex;
  final SelectedCallback onSelected;

  @override
  State<Design1> createState() => _Design1State();
}

class _Design1State extends State<Design1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 2),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.map((item) {
          var index = widget.items.indexOf(item);
          return Expanded(
            flex: 1,
            child: Material(
              child: InkWell(
                onTap: () => widget.onSelected(index),
                child: Ink(
                  color: widget.selectedIndex == index
                      ? Colors.blue
                      : Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.string(
                        item.iconPath,
                        colorFilter: ColorFilter.mode(
                            widget.selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            BlendMode.srcATop),
                      ),
                      Text(
                        item.label,
                        style: TextStyle(
                            color: widget.selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontSize: 10,
                            fontWeight: widget.selectedIndex == index
                                ? FontWeight.w600
                                : FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
