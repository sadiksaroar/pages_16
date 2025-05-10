import 'package:flutter/material.dart';


class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  double _sliderValue = 0.5;
  Color selctionColor = Colors.black;
  String selectedLocation = "San Diego";
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16.0),
    child: Column(
      children: [
        Text("Filter By", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        const SizedBox(height: 20,),
        Slider(value: _sliderValue, onChanged: (value){
          setState(() {
            _sliderValue = value;
          });
        }
        ),
        const SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
            Text("Color"),
            Text("Black")
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _colorOption(Colors.black),
            _colorOption(Colors.purple),
            _colorOption(Colors.blue),
            _colorOption(Colors.yellow),
            _colorOption(Colors.pink),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _locationOption("San Diego"),
            _locationOption("New York"),
            _locationOption("Amsterdam"),
          ],
        ),
        SizedBox(height: 20,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          ),
          onPressed: (){
            Navigator.pop(context);
          }, child: Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        child: Text("app Fliter ", style: TextStyle(fontSize: 16, color: Colors.white),),
        ),),
      ],
    ),
      
    );
  }
  Widget _colorOption(Color color){
    return GestureDetector(
      onTap: (){
        setState(() {
          selctionColor == color;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border:  selctionColor == color ? Border.all(width: 3, color: Colors.grey) : null,
        ),
      ),
    );
  }
  Widget _locationOption(String location) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // Choice Chip in Flutter
      child: ChoiceChip(
        label: Text(location),
        selected: selectedLocation == location,
        selectedColor: Colors.purple,
        onSelected: (selected) {
          setState(() {
            selectedLocation = location;
          });
        },
      ),
    );
  }

}
