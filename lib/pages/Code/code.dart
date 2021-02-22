import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/utilities/constants.dart';
import 'package:login_app/widgets/widgets.dart';

class CodeScreen extends StatefulWidget {
  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  void _resendForm() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => CodeScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Responsive(
            mobile: CodeScreenMobile(resendForm: _resendForm),
            desktop: CodeScreenDesktop(resendForm: _resendForm),
          ),
        ),
      ),
    );
  }
}

Widget _buildCodeText() {
  return Text(
    'Verificate Code',
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

Widget _buildCode() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Code',
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
            hintText: 'Enter your Code',
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
      onPressed: onPressed,
    ),
  );
}

class CodeScreenMobile extends StatefulWidget {
  final Function resendForm;

  const CodeScreenMobile({
    Key key,
    @required this.resendForm,
  }) : super(key: key);

  @override
  _CodeScreenMobileState createState() => _CodeScreenMobileState();
}

class _CodeScreenMobileState extends State<CodeScreenMobile> {
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
                _buildCodeText(),
                SizedBox(height: 30.0),
                _buildEmail(),
                SizedBox(height: 30.0),
                _buildCode(),
                SizedBox(height: 30.0),
                _buildSendButn(this.widget.resendForm),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CodeScreenDesktop extends StatefulWidget {
  final Function resendForm;

  const CodeScreenDesktop({
    Key key,
    @required this.resendForm,
  }) : super(key: key);

  @override
  _CodeScreenDesktopState createState() => _CodeScreenDesktopState();
}

class _CodeScreenDesktopState extends State<CodeScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorsList(),
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
                  _buildCodeText(),
                  SizedBox(height: 30.0),
                  _buildEmail(),
                  SizedBox(height: 30.0),
                  _buildCode(),
                  SizedBox(height: 30.0),
                  _buildSendButn(this.widget.resendForm),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
