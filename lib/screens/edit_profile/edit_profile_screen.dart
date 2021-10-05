import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/components/button/custom_button.dart';
import 'package:loyalty/constant.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit_profile_screen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime? date;

  final genders = ['Male', 'Female', 'Other'];
  final places = ['Zurich, Switzerland', 'Dhaka, Bangladesh', 'New York, USA'];

  String? genderValue;
  String? place;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: kInputDecoration.copyWith(
                          hintText: 'First name',
                        ),
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
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: kInputDecoration.copyWith(
                    hintText: 'john.doe@selise.ch',
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/mail.svg',
                      width: 20,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: 20,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  autofillHints: [AutofillHints.email],
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: kInputDecoration.copyWith(
                    hintText: '+4100000000',
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/phone.svg',
                      width: 20,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: 20,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  autocorrect: true,
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
                  autocorrect: true,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(
                        'Gender',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      dropdownColor: kButtonTextColor,
                      value: genderValue,
                      icon: SvgPicture.asset(
                          'assets/icons/keyboard_arrow_down.svg'),
                      onChanged: (value) {
                        setState(() {
                          genderValue = value;
                        });
                      },
                      items:
                          genders.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text(
                        'Place',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      dropdownColor: kButtonTextColor,
                      value: place,
                      icon: SvgPicture.asset(
                          'assets/icons/keyboard_arrow_down.svg'),
                      onChanged: (value) {
                        setState(() {
                          place = value;
                        });
                      },
                      items:
                          places.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Instagram username e.g @vicafe',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Change Password',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Current password',
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/eye_off.svg',
                      width: 20,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: 20,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  autocorrect: true,
                  autofillHints: [AutofillHints.telephoneNumber],
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: kInputDecoration.copyWith(
                    hintText: 'New password',
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/eye_off.svg',
                      width: 20,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: 20,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  autocorrect: true,
                  autofillHints: [AutofillHints.telephoneNumber],
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Re-type password',
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/eye_off.svg',
                      width: 20,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: 20,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  autocorrect: true,
                  autofillHints: [AutofillHints.telephoneNumber],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: 'Save',
                  isDisabled: false,
                  onPress: () {},
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
