import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';

class SiwesApplication extends StatefulWidget {
  const SiwesApplication({Key? key}) : super(key: key);

  @override
  _SiwesApplicationState createState() => _SiwesApplicationState();
}

class _SiwesApplicationState extends State<SiwesApplication> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = Provider.of<UserInformation>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 90),
        child: Container(
          width: size.width,
          height: 90,
          color: Colors.green.shade700,
          padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
          child: Row(
            children: [
              BouncingWidget(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: ClipOval(
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "SIWES Application",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: 300,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    margin: const EdgeInsets.only(top: 80),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                                children: const [
                                  TextSpan(
                                    text: "Matriculation No.\n",
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "Full Name\n",
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "Faculty\n",
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "Department\n",
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "Programme\n",
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "Current Level",
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      height: 1),
                                ),
                                children: [
                                  TextSpan(
                                    text: "${user.matricNumber}\n",
                                  ),
                                  const TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "${user.fullName}\n",
                                  ),
                                  const TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "${user.faculty}\n",
                                  ),
                                  const TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "${user.department}\n",
                                  ),
                                  const TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "${user.programme}\n",
                                  ),
                                  const TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "${user.currentLevel}",
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: SizedBox(
                      width: size.width * 0.9,
                      child: Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 110,
                              height: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/jpg/passport.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                width: size.width * 0.9,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Colors.green.shade700,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Application",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green.shade50,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: Colors.green,
                    value: user.siwesYear,
                    isExpanded: true,
                    hint: Text(
                      "SIWES Year",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                    iconEnabledColor: Colors.green,
                    items: [
                      "2020/2021",
                      "2019/2020",
                      "2018/2019",
                      "2017/2018",
                    ].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                        ),
                      );
                    }).toList(),
                    elevation: 0,
                    dropdownColor: Colors.green.shade50,
                    onChanged: (value) {
                      setState(() {
                        user.siwesYear = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _buildTextField(size, "Bank Name"),
              const SizedBox(
                height: 15,
              ),
              _buildTextField(size, "Account Number"),
              const SizedBox(
                height: 15,
              ),
              _buildTextField(size, "Sort Code"),
              const SizedBox(
                height: 15,
              ),
              _buildTextField(size, "Phone Number"),
              const SizedBox(
                height: 15,
              ),
              Consumer<UserInformation>(
                builder: (context, userInformation, child) {
                  return TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(
                            int.parse(user.currentSession.substring(0, 4)),
                            1,
                            1),
                        maxTime: DateTime(
                            int.parse(user.currentSession.substring(0, 4)) + 1,
                            12,
                            31),
                        onConfirm: (date) {
                          userInformation.setAttachmentPeriodFrom(date);
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en,
                      );
                    },
                    child: Container(
                      width: size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green.shade50,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            userInformation.siwesAttachmentPeriodFrom == ""
                                ? "Period of Attachment From"
                                : userInformation.siwesAttachmentPeriodFrom,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(
                            Iconsax.calendar5,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<UserInformation>(
                builder: (context, userInformation, child) {
                  return TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(
                            int.parse(user.currentSession.substring(0, 4)),
                            1,
                            1),
                        maxTime: DateTime(
                            int.parse(user.currentSession.substring(0, 4)) + 1,
                            12,
                            31),
                        onConfirm: (date) {
                          userInformation.setAttachmentPeriodTo(date);
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.en,
                      );
                    },
                    child: Container(
                      width: size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green.shade50,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            userInformation.siwesAttachmentPeriodTo == ""
                                ? "Period of Attachment To"
                                : userInformation.siwesAttachmentPeriodTo,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(
                            Iconsax.calendar5,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              _buildTextField(size, "Employer"),
              const SizedBox(
                height: 15,
              ),
              _buildTextField(size, "Employer Address"),
              const SizedBox(
                height: 15,
              ),
              BouncingWidget(
                onPressed: () {},
                scaleFactor: 0.3,
                child: Container(
                  height: 50,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      "Save/Update Record",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(var size, String fieldName) {
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.green.shade50,
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        cursorColor: Colors.green,
        cursorWidth: 2,
        cursorRadius: const Radius.circular(10),
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: fieldName,
          hintStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.green,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
      ),
    );
  }
}
