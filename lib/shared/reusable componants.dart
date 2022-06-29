

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../Modules/onBaordingScreen/onboarding.dart';
Widget buildBoardingItem(BoardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Container(
          height: 350,
          width: double.infinity,
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
      ),
      Center(
        child: Text(
          '${model.title}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14.0,
            color: Color(0xff8d8e98)
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}

class MainButton extends StatelessWidget {
  final VoidCallback? onTabbed;
  final Text? myStyle;
  final Color? myColor;
  final bool isPlatformLogin;
  final Image? platFormImage;
  MainButton(
      {required this.onTabbed, required this.myStyle, required this.myColor,this.isPlatformLogin=false,
      this.platFormImage,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTabbed,
      child: Container(
        child: Center(
          child: myStyle,
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: myColor,

        ),
      ),
    );
  }
}

class MyFormField extends StatelessWidget {

  final TextEditingController Controller;
  final TextInputType textInputType;
  final String? hintText;
  final bool isPhone;
  final bool isPassWord;
  final Widget suffixIcon;
  MyFormField({
    required this.Controller,
    required this.textInputType,
    required this.hintText,
    this.isPhone=false,
    this.isPassWord=false,
    this.suffixIcon=const Icon( Icons.remove_red_eye_outlined,color: Colors.black),
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: Controller,
      keyboardType: textInputType,

      onFieldSubmitted: (value) {},
      onChanged: (value) {},
      decoration:   InputDecoration(
        prefixIcon: isPhone? CountryCodePicker(
          onChanged: print,
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: 'IT',
          favorite: ['+39','FR'],
          // optional. Shows only country name and flag
          showCountryOnly: false,
          // optional. Shows only country name and flag when popup is closed.
          showOnlyCountryWhenClosed: false,
          // optional. aligns the flag and the Text left
          alignLeft: false,
        ):  null,
        hintText: '${hintText}',
        suffixIcon: isPassWord ? suffixIcon: SizedBox.shrink(),
        contentPadding: EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey, width: 1.0),
          borderRadius:
          BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
    );
  }
}
class DontHaveAccount extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final String? btnLabel;
  DontHaveAccount({required this.label,required this.onPressed,required this.btnLabel});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${label}',
        ),
        TextButton(
          onPressed:onPressed,

          child: Text('${btnLabel}'),
        ),
      ],
    );
  }
}
class PlatformButton extends StatelessWidget {
final String? imageName;
final String? label;
PlatformButton({required this.imageName, required this.label});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('${imageName}'),),
              Text(
                '${label}',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue
                ),
              ),
            ],
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            border: Border.all(color: Colors.blueAccent)

        ),
      ),
    );
  }
}
class MyDiveder extends StatelessWidget {
  const MyDiveder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20,),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.teal[200],
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Or',
              style: TextStyle(
                color: Color(0xff8d8e98),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.teal[200],
              height: 1.5,
            ),
          ),
        ],),
    );
  }
}
