import 'package:bottom_navigation_bars/constants.dart';
import 'package:bottom_navigation_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Design3 extends StatefulWidget {
  const Design3({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<CustomBottomNavigationItem> items;
  final int selectedIndex;
  final SelectedCallback onSelected;

  @override
  State<Design3> createState() => _Design3State();
}

class _Design3State extends State<Design3> {
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
          return Flexible(
            flex: 1,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => widget.onSelected(index),
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                child: Ink(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.selectedIndex == index
                        ? Colors.blue
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.string(
                    item.iconPath,
                    colorFilter: ColorFilter.mode(
                        widget.selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        BlendMode.srcATop),
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
