import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubits/cubit.dart';
import 'package:news_app/shared/cubit/states/states.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class FilterWidget extends StatelessWidget {
  final List<String> items;
  void Function(String?)? onChanged;
  final bool borderless;
  final Color darkColor;
  final Color lightColor;
  FilterWidget({super.key,
    required this.items,
    required this.onChanged,
    required this.selectedValue,
    this.borderless=false,
    required this.darkColor,
    required this.lightColor,
  });

  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder:(context, state)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              items: items
                  .map((String item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:NewsCubit.get(context).isDark?lightColor :darkColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: selectedValue,
              onChanged: onChanged,
              buttonStyleData: ButtonStyleData(
                height: 40,
                width: 190,
                padding: const EdgeInsets.symmetric(horizontal: 14,),
                decoration: borderless?null:BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: NewsCubit.get(context).isDark? Colors.white:Colors.transparent,
                  ),
                  color:  NewsCubit.get(context).isDark? Colors.transparent:Colors.white,
                ),
                elevation: 2,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: NewsCubit.get(context).isDark? HexColor('171733'):Colors.white,
                ),
                offset: const Offset(0, -2),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(50),
                  thickness: MaterialStateProperty.all(4),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
                openInterval: const Interval(.2, 1),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 14),
              ),
              iconStyleData: const IconStyleData(icon: Icon(Icons.signal_cellular_null,color: Colors.transparent,)),
            ),
          ),
        );
      },
    );
  }
}