import 'package:bottom_navigation_bars/constants.dart';
import 'package:bottom_navigation_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Design5 extends StatefulWidget {
  const Design5({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<CustomBottomNavigationItem> items;
  final int selectedIndex;
  final SelectedCallback onSelected;

  @override
  State<Design5> createState() => _Design5State();
}

class _Design5State extends State<Design5> {
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
                      AnimatedContainer(
                        margin: const EdgeInsets.all(2),
                        duration: const Duration(milliseconds: 400),
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: widget.selectedIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
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
