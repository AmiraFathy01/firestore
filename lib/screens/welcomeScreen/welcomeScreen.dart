import 'package:flutter/material.dart';
import '../loginScreen/loginScreen.dart';
import '../registerScreen/registerScreen.dart';

class welcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
                'https://th.bing.com/th/id/R.d237e8bebde68e7b0cb91fb5127de459?rik=%2f81m3B5%2bGeGPIg&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2fa%2fd%2f9%2f1244612-beautiful-peaceful-anime-wallpaper-1242x2208-for-meizu.jpg&ehk=WBYNvcA6nI4teDYi1dkEIXlz5BbWuxiPes72IreFpB4%3d&risl=&pid=ImgRaw&r=0'),
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 45, 101, 47)),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                  },
                  child: Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 45, 101, 47)),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RegisterScreen()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
