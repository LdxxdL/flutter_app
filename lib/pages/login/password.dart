import 'package:flutter/material.dart';
import 'package:flutter_app/common/services/user.dart';
import 'package:flutter_app/components/topbar.dart';
import 'package:flutter_app/providers/user.dart';
import 'package:provider/provider.dart';

class PasswordPage extends StatefulWidget {
  static final String pageName = 'password_page';

  const PasswordPage({this.mobileNumber});
  final String mobileNumber;

  @override
  State createState() {
    return new _PasswordPageState();
  }
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController passwordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  void _onSubmit(context, userState) async {
    if ((_formKey.currentState as FormState).validate()) {
      final result =
          await loginWithPassword(widget.mobileNumber, passwordController.text);
      if (result) {
        userState.getUserInfo();
        Navigator.of(context).pop();
      } else {
        print('-----登录失败------');
      }
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
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: '输入密码'),
                    validator: (v) {
                      return v.trim().length > 0 ? null : "密码不能为空";
                    },
                  )),
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 20),
                child: SizedBox.expand(
                  child: Consumer<UserStateModel>(
                      builder: (context, userState, child) {
                    return FlatButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      child: Text("Submit"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      onPressed: () => _onSubmit(context, userState),
                    );
                  }),
                ),
              )
            ],
          )),
    );
  }
}
