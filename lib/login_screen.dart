import 'package:carbontrack_pro/service/authentication_service.dart';
import 'package:carbontrack_pro/utils/custom_colors.dart';
import 'package:carbontrack_pro/widgets/custom_elevated_buttons.dart';
import 'package:carbontrack_pro/widgets/custom_text_buttons.dart';
import 'package:carbontrack_pro/widgets/popup.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    String logoImage = "assets/TheLeakyCauldron.png";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.scaffoldBackgroundColor,
        title: const Text('Giriş Yap'),
      ),
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              imageContainer(logoImage, height),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(hintText: "kullanıcı adı"),
                  ),),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(hintText: 'Şifre'),
                    obscureText: true,
                  ),),),

              CustomElevatedButton(
                onPressed: () async {
                  String uid = await AuthenticationService().signIn(
                    "${_usernameController.text}@mail.com",
                    _passwordController.text,
                  );
                  if (uid == "null") {
                    popUp(context, "Hatalı Giriş",
                        "Kullanıcı adı veya Şifreniz Hatalı");
                  } else if (uid == "HnwBNl5CVGbzWBRUDU40TBhhLKw1") {
                    Navigator.pushNamed(context, "/adminRegisterScreen");
                  } else if (uid == "yk1rRtMH7QZfCKGKMYyvq1pXS823") {
                    Navigator.pushNamed(context, "/adminPage");
                  }
                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataEnterScreen(),
                      ),
                    );
                  }
                },
                buttonText: 'Giriş Yap',
              ),
              CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/userMenuPage");
                },
                buttonText: 'Misafir Girişi',
              ),
              Expanded(flex: 4,
                  child: SizedBox(
                  )),
            ],
          ),
        ),
      ),
    );
  }
  Container imageContainer(String logoImage, double height) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(logoImage),
        ),
      ),
    );
  }
}