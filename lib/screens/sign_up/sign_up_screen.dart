import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/components/button/custom_button.dart';
import 'package:loyalty/constant.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign_up_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isDisabled = true;
  bool isLoading = false;
  DateTime? date;
  String? email, firstName, lastName, phone, password;

  final _formKey = GlobalKey<FormState>();

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd-MM-yyyy').format(date!);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  Future<Null> _selectedDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;
    setState(() => date = newDate);
    print(getText());
  }

  Future _submitFn(BuildContext ctx) async {
    try {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();

      print(firstName);
      print(lastName);
      print(email);
      print(password);
      print(date);
      if (isValid) {}
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kButtonTextColor,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: isLoading
                  ? Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset.zero,
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: CircularProgressIndicator(
                        color: kButtonBgColor,
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create new account',
                            style: TextStyle(
                              color: kBodyTextColor,
                              fontSize: 20,
                              fontFamily: kFontFamily,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: kInputDecoration.copyWith(
                              hintText: 'example@selise.ch',
                              suffixIcon: SvgPicture.asset(
                                'assets/icons/mail.svg',
                              ),
                              suffixIconConstraints: BoxConstraints(
                                maxWidth: 30,
                              ),
                            ),
                            onChanged: (value) {},
                            onSaved: (value) {
                              email = value;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: kInputDecoration.copyWith(
                                    hintText: 'First name',
                                  ),
                                  autocorrect: false,
                                  onSaved: (value) {
                                    firstName = value;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: kInputDecoration.copyWith(
                                    hintText: 'Last name',
                                  ),
                                  onSaved: (value) {
                                    lastName = value;
                                  },
                                  autocorrect: false,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: kInputDecoration.copyWith(
                              hintText: 'Mobile number',
                              suffixIcon: SvgPicture.asset(
                                'assets/icons/phone.svg',
                                width: 20,
                              ),
                              suffixIconConstraints: BoxConstraints(
                                maxWidth: 20,
                              ),
                            ),
                            onSaved: (value) {
                              phone = value;
                            },
                            keyboardType: TextInputType.phone,
                            autocorrect: false,
                            autofillHints: [AutofillHints.telephoneNumber],
                          ),
                          TextFormField(
                            onTap: () {
                              _selectedDate(context);
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: kInputDecoration.copyWith(
                              hintText: date == null ? 'dd-mm-yyyy' : getText(),
                              hintStyle: TextStyle(
                                color: date == null
                                    ? Color.fromRGBO(193, 193, 193, 0.5)
                                    : Colors.white,
                              ),
                              suffixIcon: SvgPicture.asset(
                                'assets/icons/calendar.svg',
                                width: 20,
                              ),
                              suffixIconConstraints: BoxConstraints(
                                maxWidth: 20,
                              ),
                            ),
                            readOnly: true,
                            keyboardType: TextInputType.datetime,
                            autocorrect: false,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: kInputDecoration.copyWith(
                              hintText: 'Password',
                              suffixIcon: SvgPicture.asset(
                                'assets/icons/eye_off.svg',
                                width: 20,
                              ),
                              suffixIconConstraints: BoxConstraints(
                                maxWidth: 20,
                              ),
                            ),
                            onSaved: (value) {
                              password = value;
                            },
                            keyboardType: TextInputType.phone,
                            autocorrect: false,
                            autofillHints: [AutofillHints.telephoneNumber],
                          ),
                        ],
                      )),
            ),
            Spacer(),
            Text.rich(
              TextSpan(
                text: 'By clicking “Create Account”, I agree to all ',
                style: TextStyle(fontSize: 12, color: Colors.white),
                children: [
                  TextSpan(
                    text: ' terms and conditions',
                    style: TextStyle(
                      fontSize: 12,
                      color: kButtonBgColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onPress: isDisabled
                  ? null
                  : () {
                      _submitFn(context);
                    },
              buttonText: 'Create account',
              isDisabled: isDisabled,
            ),
          ],
        )));
  }
}
