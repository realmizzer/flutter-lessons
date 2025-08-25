import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({super.key, required this.title});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  int? menuItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text('Snackbar'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: Text('Open SnackBar'),
                  ),
                  // VerticalDivider(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          // return AboutDialog();
                          return AlertDialog(
                            title: Text('Alert Title'),
                            content: Text('Alert Content'),
                            actions: [
                              FilledButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Open Dialog'),
                  ),
                ],
              ),
              Divider(color: Colors.teal, thickness: 2.0),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 1, child: Text('item1')),
                  DropdownMenuItem(value: 2, child: Text('item2')),
                  DropdownMenuItem(value: 3, child: Text('item3')),
                ],
                onChanged: (value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () => setState(() {}),
              ),
              Text("input text: ${controller.text}"),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile.adaptive(
                tristate: true,
                title: Text("isChecked"),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                    print('isChecked is $value');
                  });
                },
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text('switch with text'),
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                value: sliderValue,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                  print("slider value is $sliderValue");
                },
              ),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print("inkwell tap");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.teal,
                    //   foregroundColor: Colors.white,
                    // ),
                    child: Text('Btn'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.teal,
                    //   foregroundColor: Colors.white,
                    // ),
                    child: Text('Btn'),
                  ),
                  TextButton(onPressed: () {}, child: Text('Btn')),
                  OutlinedButton(onPressed: () {}, child: Text('Btn')),
                  CloseButton(),
                  BackButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
