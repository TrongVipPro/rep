import 'package:app_api/app/data/api.dart';
import 'package:app_api/app/model/register.dart';
import 'package:app_api/app/page/auth/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _gender = 0;
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _numberIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _schoolKeyController = TextEditingController();
  final TextEditingController _schoolYearController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _imageURL = TextEditingController();
  String gendername = 'None';
  String temp = '';

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<String> register() async {
    // Kiểm tra các trường dữ liệu
    if (_accountController.text.isEmpty) {
      showErrorDialog('Please enter the account.');
      return '';
    }
    if (_passwordController.text.isEmpty) {
      showErrorDialog('Please enter the password.');
      return '';
    }
    if (_confirmPasswordController.text.isEmpty) {
      showErrorDialog('Please confirm your password.');
      return '';
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      showErrorDialog('Passwords do not match.');
      return '';
    }
    if (_fullNameController.text.isEmpty) {
      showErrorDialog('Please enter your full name.');
      return '';
    }
    if (_numberIDController.text.isEmpty) {
      showErrorDialog('Please enter your number ID.');
      return '';
    }
    if (_phoneNumberController.text.isEmpty) {
      showErrorDialog('Please enter your phone number.');
      return '';
    }
    if (_birthDayController.text.isEmpty) {
      showErrorDialog('Please enter your birth date.');
      return '';
    }
    if (_schoolYearController.text.isEmpty) {
      showErrorDialog('Please enter your school year.');
      return '';
    }
    if (_schoolKeyController.text.isEmpty) {
      showErrorDialog('Please enter your school key.');
      return '';
    }

    return await APIRepository().register(Signup(
      accountID: _accountController.text,
      birthDay: _birthDayController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      fullName: _fullNameController.text,
      phoneNumber: _phoneNumberController.text,
      schoolKey: _schoolKeyController.text,
      schoolYear: _schoolYearController.text,
      gender: getGender(),
      imageUrl: _imageURL.text,
      numberID: _numberIDController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          textField(
                              _accountController, "Account", Icons.person),
                          SizedBox(height: 30),
                          textField(
                              _passwordController, "Password", Icons.password,
                              obscureText: true),
                          SizedBox(height: 30),
                          textField(_confirmPasswordController,
                              "Confirm password", Icons.password,
                              obscureText: true),
                          SizedBox(height: 30),
                          textField(_fullNameController, "Full Name",
                              Icons.text_fields_outlined),
                          SizedBox(height: 30),
                          textField(_numberIDController, "NumberID", Icons.key),
                          SizedBox(height: 30),
                          textField(_phoneNumberController, "PhoneNumber",
                              Icons.phone),
                          SizedBox(height: 30),
                          textField(_birthDayController, "BirthDay",
                              Icons.date_range),
                          SizedBox(height: 30),
                          textField(_schoolYearController, "SchoolYear",
                              Icons.school),
                          SizedBox(height: 30),
                          textField(
                              _schoolKeyController, "SchoolKey", Icons.school),
                          SizedBox(height: 30),
                          const Text("What is your Gender?"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  title: const Text("Male"),
                                  leading: Transform.translate(
                                      offset: const Offset(16, 0),
                                      child: Radio(
                                        value: 1,
                                        groupValue: _gender,
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value!;
                                          });
                                        },
                                      )),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                    contentPadding: const EdgeInsets.all(0),
                                    title: const Text("Female"),
                                    leading: Transform.translate(
                                      offset: const Offset(16, 0),
                                      child: Radio(
                                        value: 2,
                                        groupValue: _gender,
                                        onChanged: (value) {
                                          setState(() {
                                            _gender = value!;
                                          });
                                        },
                                      ),
                                    )),
                              ),
                              Expanded(
                                  child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                title: const Text("Other"),
                                leading: Transform.translate(
                                    offset: const Offset(16, 0),
                                    child: Radio(
                                      value: 3,
                                      groupValue: _gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _gender = value!;
                                        });
                                      },
                                    )),
                              )),
                            ],
                          ),
                          SizedBox(height: 30),
                          textField(_imageURL, "Image URL", Icons.image),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      String response = await register();
                                      if (response == "ok") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      } else {
                                        showErrorDialog(response);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(
      TextEditingController controller, String label, IconData icon,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: label,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  String getGender() {
    if (_gender == 1) {
      return "Male";
    } else if (_gender == 2) {
      return "Female";
    }
    return "Other";
  }
}
