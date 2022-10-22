import 'package:flutter/material.dart';

//////////////////////////////////////////////////////////////////////////////////////////////////

void navigatorTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

////////////////////////////// Text Form Field  ////////////////////////////

Widget defualtTextForm({
  required TextInputType? type,
  required TextEditingController? controller,
  required String? lable,
  required IconData prefixIcon,
  IconData? suffixIcon,
  required Function? validate,
  bool obScure = false,
  Function? SuffixOnPressed,
}) =>
    TextFormField(
      obscureText: obScure,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: lable,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: () {
              SuffixOnPressed!();
            }),
      ),
      validator: (value) {
        return validate!(value);
      },
    );

//////////////////////////  material Button  //////////////////////////

Widget defualtMaterialButton({
  required double? Radius,
  var color = Colors.deepOrange,
  double width = 120,
  double height = 50,
  required String? text,
  required Function Pressed,
}) =>
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Radius!),
          color: color,
        ),
        width: width,
        height: height,
        child: MaterialButton(
            child: Text(
              "$text",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Pressed();
            }));

/////////////////////////////  flutter  Toast   //////////////////////////
/* 
void ShowToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: ChooseToastColor(state),
      textColor: Colors.white,
      fontSize: 15,
    ); */

enum ToastStates { SUCCESS, ERROR, WARNING }

Color ChooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

////////////// seperator //////////////////////

Widget seperator() => Container(
      height: 1,
      width: double.infinity,
    );
