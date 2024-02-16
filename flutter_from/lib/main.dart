import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter from practice"),
        backgroundColor: Colors.grey,
      ),
      body: const MyBodyPage(),
    ),
  ));
}

class MyBodyPage extends StatefulWidget {
  const MyBodyPage({super.key});

  /*  const MyBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
                hintText: "please input account", label: Text("Account")),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "please input password",
              label: Text("Password"),
            ),
          )
        ],
      ),
    );
  } */

  @override
  State<StatefulWidget> createState() => _MyBodyPageState();
}

class _MyBodyPageState extends State<MyBodyPage> {
  var flag1 = false;
  var flag2 = false;
  var flag3 = false;
  int sex = 1;
  var flag = true;
  double sliderValue = 0;

  void updateSlider(value) {
    sliderValue = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: flag1,
          onChanged: (value) {
            setState(() {
              flag1 = value ?? false;
            });
          },
        ),
        Text(flag1 == true ? "check" : "uncheck"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("man"),
            Radio(
                value: 1,
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    sex = value as int;
                  });
                }),
            const SizedBox(width: 20),
            const Text("woman"),
            Radio(
                value: 2,
                groupValue: sex,
                onChanged: (value) {
                  setState(() {
                    sex = value as int;
                  });
                }),
          ],
        ),
        const Divider(color: Colors.black),
        CheckboxListTile(
          value: flag2,
          onChanged: (value) {
            setState(() {
              flag2 = value ?? false;
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.black,
          title: const Text("title"),
          subtitle: const Text("descript"),
          selected: flag2,
        ),
        const Divider(color: Colors.black),
        CheckboxListTile(
          value: flag3,
          onChanged: (value) {
            setState(() {
              flag2 = value ?? false;
            });
          },
          activeColor: Colors.green,
          checkColor: Colors.black,
          title: const Text("title"),
          subtitle: const Text("descript"),
          secondary: const Icon(Icons.home),
          selected: false,
        ),
        const Divider(color: Colors.black),
        RadioListTile(
          value: true,
          groupValue: flag,
          onChanged: (value) {
            setState(() {
              flag = value as bool;
            });
          },
          title: const Text("frist title"),
          subtitle: const Text("second title"),
          secondary: const Icon(Icons.home),
        ),
        RadioListTile(
          value: false,
          groupValue: flag,
          onChanged: (value) {
            setState(() {
              flag = value as bool;
            });
          },
          title: const Text("frist title"),
          subtitle: const Text("second title"),
          secondary: const Icon(Icons.search),
        ),
        const Divider(color: Colors.black),
        Switch(
            value: flag,
            onChanged: (value) {
              setState(() {
                flag = value;
              });
            }),
        const SizedBox(height: 20),
        SwitchListTile(
          value: flag,
          onChanged: (value) {
            setState(() {
              flag = value;
            });
          },
          title: const Text("title"),
          subtitle: const Text("second title"),
          secondary: const Icon(Icons.search),
        ),
        const Divider(color: Colors.black),
        _slider()
      ],
    );
  }

  Slider _slider() {
    return Slider(
      value: sliderValue,
      max: 100,
      activeColor: Colors.red,
      inactiveColor: Colors.green,
      label: "jindu $sliderValue",
      divisions: 10,
      onChanged: (value) {
        updateSlider(value);
      },
      onChangeStart: (value) {
        updateSlider(value);
      },
      onChangeEnd: (value) {
        updateSlider(value);
      },
    );
  }
}
