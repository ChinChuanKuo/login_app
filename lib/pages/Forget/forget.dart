import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/pages/Code/code.dart';
import 'package:login_app/utilities/constants.dart';
import 'package:login_app/widgets/widgets.dart';

class ForgetScreen extends StatefulWidget {
  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  void _codeForm() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => CodeScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Responsive(
            mobile: ForgetScreenMobile(codeForm: _codeForm),
            desktop: ForgetScreenDesktop(codeForm: _codeForm),
          ),
        ),
      ),
    );
  }
}

Widget _buildForgetText() {
  return Text(
    'Forget Password',
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

Widget _buildBirthday() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Birthday',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.datetime,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            hintText: 'Enter your Birthday',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

Widget _buildSendButn(onPressed) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: onPressed,
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        'SEND',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

class ForgetScreenMobile extends StatefulWidget {
  final Function codeForm;

  const ForgetScreenMobile({
    Key key,
    @required this.codeForm,
  }) : super(key: key);

  @override
  _ForgetScreenMobileState createState() => _ForgetScreenMobileState();
}

class _ForgetScreenMobileState extends State<ForgetScreenMobile> {
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
                _buildForgetText(),
                SizedBox(height: 30.0),
                _buildEmail(),
                SizedBox(height: 30.0),
                _buildBirthday(),
                SizedBox(height: 30.0),
                _buildSendButn(this.widget.codeForm),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ForgetScreenDesktop extends StatefulWidget {
  final Function codeForm;

  const ForgetScreenDesktop({
    Key key,
    @required this.codeForm,
  }) : super(key: key);

  @override
  _ForgetScreenDesktopState createState() => _ForgetScreenDesktopState();
}

class _ForgetScreenDesktopState extends State<ForgetScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorsList(),
        Center(
          child: Container(
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
                  _buildForgetText(),
                  SizedBox(height: 30.0),
                  _buildEmail(),
                  SizedBox(height: 30.0),
                  _buildBirthday(),
                  SizedBox(height: 30.0),
                  _buildSendButn(this.widget.codeForm),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
