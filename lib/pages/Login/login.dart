import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/pages/pages.dart';
import 'package:login_app/utilities/constants.dart';
import 'package:login_app/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  void _changedRemember(bool value) => setState(() => _rememberMe = value);

  void _forgetForm() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ForgetScreen()));

  void _loginForm() => print("123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Responsive(
            mobile: LoginScreenMobile(
              rememberMe: _rememberMe,
              changedRemember: _changedRemember,
              forgetForm: _forgetForm,
              loginForm: _loginForm,
            ),
            desktop: LoginScreenDesktop(
              rememberMe: _rememberMe,
              changedRemember: _changedRemember,
              forgetForm: _forgetForm,
              loginForm: _loginForm,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSignInText() {
  return Text(
    'Sign In',
    style: TextStyle(
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Email',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'Enter your Email',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget _buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Password',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: 'Enter your Password',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget _buildForgetPasswordButn(onPressed) {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      padding: const EdgeInsets.only(right: 0.0),
      child: Text(
        'Forget Password?',
        style: kLabelStyle,
      ),
      onPressed: onPressed,
    ),
  );
}

Widget _buildRememberMeCheckbox(rememberMe, onChanged) {
  return Container(
    height: 20.0,
    child: Row(
      children: [
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: rememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: onChanged,
          ),
        ),
        Text(
          'Remember Me',
          style: kLabelStyle,
        ),
      ],
    ),
  );
}

Widget _buildLoginButn(onPressed) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      onPressed: onPressed,
    ),
  );
}

Widget _buildSignInWithText() {
  return Column(
    children: [
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        'Sign in with',
        style: kLabelStyle,
      ),
    ],
  );
}

Widget _buildSocialButn(Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          )
        ],
      ),
    ),
  );
}

Widget _buildSocialButnRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButn(() => print("Login with Facebook")),
        _buildSocialButn(() => print("Login with Google")),
      ],
    ),
  );
}

Widget _buildSignUpButn() {
  return GestureDetector(
    onTap: () => print('Sign Up Button Pressed'),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}

class LoginScreenMobile extends StatefulWidget {
  final bool rememberMe;
  final Function(bool) changedRemember;
  final Function forgetForm;
  final Function loginForm;

  const LoginScreenMobile({
    Key key,
    @required this.rememberMe,
    @required this.changedRemember,
    @required this.forgetForm,
    @required this.loginForm,
  }) : super(key: key);

  @override
  _LoginScreenMobileState createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorsList(),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSignInText(),
                SizedBox(height: 30.0),
                _buildEmail(),
                SizedBox(height: 30.0),
                _buildPassword(),
                _buildForgetPasswordButn(this.widget.forgetForm),
                _buildRememberMeCheckbox(
                    this.widget.rememberMe, this.widget.changedRemember),
                _buildLoginButn(this.widget.loginForm),
                _buildSignInWithText(),
                _buildSocialButnRow(),
                _buildSignUpButn(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoginScreenDesktop extends StatefulWidget {
  final bool rememberMe;
  final Function(bool) changedRemember;
  final Function forgetForm;
  final Function loginForm;

  const LoginScreenDesktop({
    Key key,
    @required this.rememberMe,
    @required this.changedRemember,
    @required this.forgetForm,
    @required this.loginForm,
  }) : super(key: key);

  @override
  _LoginScreenDesktopState createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<LoginScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Center(
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints(maxWidth: 601),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSignInText(),
                  SizedBox(height: 30.0),
                  _buildEmail(),
                  SizedBox(height: 30.0),
                  _buildPassword(),
                  _buildForgetPasswordButn(this.widget.forgetForm),
                  _buildRememberMeCheckbox(
                      this.widget.rememberMe, this.widget.changedRemember),
                  _buildLoginButn(this.widget.loginForm),
                  _buildSignInWithText(),
                  _buildSocialButnRow(),
                  _buildSignUpButn(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
