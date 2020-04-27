import 'package:flutter/material.dart';
import 'package:flutter_app/common/services/user.dart';
import 'package:flutter_app/components/topbar.dart';

class RegistPage extends StatefulWidget {
  static final String pageName = 'regist_page';

  const RegistPage({this.mobileNumber});
  final String mobileNumber;

  @override
  State<StatefulWidget> createState() {
    return new _RegistPageState();
  }
}

class _RegistPageState extends State<RegistPage> {
  TextEditingController vrCodeController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  void _onSubmit() {
    if ((_formKey.currentState as FormState).validate()) {
      registMobile(
          widget.mobileNumber, vrCodeController.text, passwordController.text,
          successCallback: (response) {
        if (response.code == 0) {
          print('---registFinish----');
        } else {}
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
                child: Text('注册', style: TextStyle(fontSize: 20)),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child:
                    Text(widget.mobileNumber, style: TextStyle(fontSize: 20)),
              ),
              Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        controller: vrCodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: '输入验证码'),
                        validator: (v) {
                          return v.trim().length > 0 ? null : "验证码不能为空";
                        },
                      ),
                      Container(
                        height: 30,
                      ),
                      TextFormField(
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
                      )
                    ],
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
