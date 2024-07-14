import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/buttons/primary_app_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_page.dart';
import 'package:spotify_clone/presentation/auth/widgets/text_field_widget.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});


  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signUpOption(context),
      appBar: AppBarWidget(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWidget(
                  hintText: 'Enter Email',
                  inputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldWidget(
                  hintText: 'Password',
                  inputType: TextInputType.visiblePassword,
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 15,
                ),
                PrimaryAppButton(
                  onPressed: () {},
                  title: 'Sign In',
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signUpOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Not a Member?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
            },
            child: const Text(
              'Register Now',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
