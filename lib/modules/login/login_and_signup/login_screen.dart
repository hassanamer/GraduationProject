import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/SignUpScreen.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import '../login_cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          if (state is AppLoginSuccessState) {
            if (state.loginModel!.status!) {
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel!.data!.token,
              ).then(
                (value) {
                  navigateAndFinish(
                    context: context,
                    widget: AppLayout(),
                  );
                },
              );
              Fluttertoast.showToast(
                msg: "${state.loginModel!.message!}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            } else {
              print('error in login');
              showToast(
                message: "${state.loginModel!.message!}",
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          radius: 10,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: AppLoginCubit.get(context).isPassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                          },
                          label: 'Password',
                          suffix: AppLoginCubit.get(context).suffix,
                          suffixPressed: () {
                            AppLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          prefix: Icons.lock_outlined,
                          radius: 10,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              AppLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! AppLoginLoadingState,
                          builder: (context) => defaultButton(
                            text: 'login',
                            isUpperCase: true,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                AppLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            radius: 10,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              text: Text(
                                "REGISTER",
                              ),
                              onPressed: () {
                                navigateTo(
                                  widget: SignUpScreen(),
                                  context: context,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:smarttouristguide/modules/home/home_screen.dart';
// import 'package:smarttouristguide/modules/login/login_and_signup/forget_password.dart';
// import 'package:smarttouristguide/modules/login/login_and_signup/register_container.dart';
// import 'package:smarttouristguide/shared/components/components.dart';
// import 'package:smarttouristguide/shared/styles/buttons_style.dart';
// import 'package:smarttouristguide/shared/styles/textStyle.dart';
//
// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(18),
//       child: Column(
//         children: [
//           RegisterContainer('Email Address'),
//           RegisterContainer(
//             ('Password'),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   navigateTo(
//                     context: context,
//                     widget: ForgetPassword(),
//                   );
//                 },
//                 child: textStyle.normal('Forget Password?', 13.5),
//               ),
//             ],
//           ),
//           Spacer(),
//          button(function: (){Navigator.of(context).pushNamed(HomeScreen.routeName);}, text: 'Login')
//         ],
//       ),
//     );
//   }
// }
