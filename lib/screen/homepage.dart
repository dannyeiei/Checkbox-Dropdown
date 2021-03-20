import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  // Radio
  String _gender;

  // Dropdown
  List<String> dropdownItems = ['นาย', 'นางสาว'];
  String _selectedItem = 'นาย';

  // CheckBoox
  List<Food> food = Food.getFood();
  List<String> _foodChecked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox & Dropdown"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
                title: Text("food1"),
                value: food[0].isChecked,
                onChanged: (bool value) {
                  setState(() {
                    food[0].isChecked = value;
                  });
                  if (value) {
                    _foodChecked.add(food[0].foodName);
                  } else {
                    _foodChecked.remove(food[0].foodName);
                  }
                }),
            CheckboxListTile(
                title: Text("food2"),
                value: food[1].isChecked,
                onChanged: (bool value) {
                  setState(() {
                    food[1].isChecked = value;
                  });
                  if (value) {
                    _foodChecked.add(food[1].foodName);
                  } else {
                    _foodChecked.remove(food[1].foodName);
                  }
                }),

// Radio เพศ
            RadioListTile(
                title: Text("เพศชาย"),
                value: "mele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            RadioListTile(
                title: Text("เพศหญิง"),
                value: "femele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),

      
            DropdownButton(
              value: _selectedItem,
              items: dropdownItems.map<DropdownMenuItem<String>>((val) {
                return DropdownMenuItem<String>(
                  child: Text(val),
                  value: val,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),


          ],
        ),
      ),
    );
  }
}



class Food {
  String foodName;
  bool isChecked;

  Food(this.foodName, this.isChecked);

  static List<Food> getFood() {
    return <Food>[Food('food1', false), Food('food2', false)];
  }
}
