import 'package:flutter/material.dart';
import 'package:flutter_app/common/services/user.dart';
import 'package:flutter_app/components/topbar.dart';
import 'package:flutter_app/pages/login/password.dart';
import 'package:flutter_app/pages/login/regist.dart';

class LoginPage extends StatefulWidget {
  static final String pageName = 'login_page';

  @override
  State createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  void _onSubmit() {
    if ((_formKey.currentState as FormState).validate()) {
      findMobile(phoneController.text, successCallback: (response) {
        if (response.code == 0) {
          Navigator.of(context).pushReplacementNamed(PasswordPage.pageName,
              arguments: phoneController.text);
        } else {
          Navigator.of(context).pushReplacementNamed(RegistPage.pageName,
              arguments: phoneController.text);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text('登录', style: TextStyle(fontSize: 20)),
              ),
              Form(
                  key: _formKey,
                  autovalidate: true,
                  child: TextFormField(
                    autofocus: true,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: '输入手机号码'),
                    validator: (v) {
                      return v.trim().length > 0 ? null : "手机号码不能为空";
                    },
                  )),
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 20),
                child: SizedBox.expand(
                  child: FlatButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("Submit"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed: _onSubmit,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
