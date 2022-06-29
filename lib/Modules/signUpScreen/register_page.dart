import 'package:flutter/material.dart';
import 'package:onbordingapp/Modules/loginScreen/login_page.dart';

import '../../shared/reusable componants.dart';

class RegisterPage extends StatelessWidget {

  var formkey =GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/appBar.jpg'),
                  fit: BoxFit.fitWidth)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Welcome to Fashion Daily',
            style: TextStyle(
              color: Color(0xff8d8e98),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(

            children: [
              Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,

                ),
              ),
              Spacer(),
              TextButton(
                onPressed: (){},
                child: Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Email',
            style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff8d8e98)

            ),
          ),
           MyFormField(
              textInputType: TextInputType.emailAddress,
              Controller: emailController,
              hintText: 'EG. example@email.com',
            ),

          SizedBox(
            height: 20.0,
          ),
          Text(
            'Phone Number',
            style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff8d8e98)

            ),
          ),
          MyFormField(
            Controller:phoneController,
            textInputType: TextInputType.phone,
            hintText: 'eg.812345678',
            isPhone: true,

          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Password',
            style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff8d8e98)

            ),

          ),
          MyFormField(
            Controller:passController,
            textInputType: TextInputType.phone,
            hintText: 'Password',
            isPassWord: true,


          ),
          SizedBox(
            height: 20.0,
          ),
          MainButton(
              onTabbed: null,
              myStyle: Text(
                'Register',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              myColor:  Color(0XFF03A9F4),
          ),
          MyDiveder(),
          PlatformButton(
            label: 'Sign in With Google',
            imageName: 'images/google-logo.png',
          ),
          DontHaveAccount(
            label: 'Has any Account?',
            btnLabel: 'Sign in Here',
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen(),
                  ),
              );
            },
          ),
          Center(
            child: Text(
              'By registering your account,you are agree to our',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff8d8e98)
              ),
            ),

          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              'terms and conditions',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),),
          SizedBox(height: 25,),

        ]),
      ),
    );
  }
}
