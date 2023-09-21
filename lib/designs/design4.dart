import 'package:bottom_navigation_bars/constants.dart';
import 'package:bottom_navigation_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Design4 extends StatefulWidget {
  const Design4({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<CustomBottomNavigationItem> items;
  final int selectedIndex;
  final SelectedCallback onSelected;

  @override
  State<Design4> createState() => _Design4State();
}

class _Design4State extends State<Design4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 2),
      ], color: Colors.white),
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: widget.selectedIndex == index
                          ? LinearGradient(
                              colors: [
                                Colors.blue.withOpacity(0.3),
                                Colors.blue.withOpacity(0.1),
                                Colors.blue.withOpacity(0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.string(
                          item.iconPath,
                          colorFilter: ColorFilter.mode(
                              widget.selectedIndex == index
                                  ? Colors.blue
                                  : Colors.black,
                              BlendMode.srcATop),
                        ),
                        if (widget.selectedIndex == index)
                          Text(
                            item.label,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                      ],
                    ),
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
