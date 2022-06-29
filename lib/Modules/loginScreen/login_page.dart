import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:onbordingapp/Modules/signUpScreen/register_page.dart';
import '../../shared/reusable componants.dart';
class LoginScreen extends StatelessWidget {

  var phoneNumController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
          child:
        AppBar(

        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/appBar.jpg'),
                  fit: BoxFit.fill)),
        ),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'Welcome to Fashion Daily',
                    style: TextStyle(
                        color: Color(0xff8d8e98),
                    ),
              ),
              SizedBox(
                height: 30.0,
              ),
              AuthPageName(
                Name: 'Sign in',
              ),
              SizedBox(
                height: 30.0,
              ),
              FormFieldName(
                label: 'Phone Number',
              ),
              MyFormField(
                Controller:phoneNumController,
              textInputType: TextInputType.phone,
                hintText: 'eg.812345678',
                isPhone: true,

              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                  onTabbed: null,
                  myStyle: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                  myColor: Color(0XFF03A9F4),

              ),

             MyDiveder(),


          PlatformButton(
            label: 'Sign in With Google',
            imageName: 'images/google-logo.png',
          ),
              DontHaveAccount(
                onPressed: (){
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                         RegisterPage()),
                    ModalRoute.withName('/'),);
                },
                label: 'don\'t have an account !',
                btnLabel: 'Sign Up',
              ),
              Center(
                child: Text(
                  'Use the application according to policy rules.\n Any kinds of violations will be subject to sanctions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff8d8e98)
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}




