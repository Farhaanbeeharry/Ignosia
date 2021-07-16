import 'package:mobile/Common/API.dart';
import 'package:mobile/Common/ApiUrl.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/ResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BeneficiaryController {
  Position currentPosition;

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController nationalIDController = new TextEditingController();
  TextEditingController latitudeController = new TextEditingController();
  TextEditingController longitudeController = new TextEditingController();

  TextEditingController homePhoneController = new TextEditingController();
  TextEditingController mobilePhoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();

  TextEditingController schoolController = new TextEditingController();
  TextEditingController universityController = new TextEditingController();
  TextEditingController qualificationYearController = new TextEditingController();

  TextEditingController workExperienceController = new TextEditingController();
  TextEditingController workingCapabilitiesController = new TextEditingController();
  TextEditingController workFromDateController = new TextEditingController();
  TextEditingController workToDateController = new TextEditingController();
  TextEditingController currentWorkplaceController = new TextEditingController();
  TextEditingController currentWorkplaceRoleController = new TextEditingController();
  TextEditingController salaryController = new TextEditingController();

  TextEditingController responsiblePartyNameController = new TextEditingController();
  TextEditingController responsiblePartyRelationshipController = new TextEditingController();
  TextEditingController maritalStatusController = new TextEditingController();
  TextEditingController numberOfChildrenController = new TextEditingController();

  TextEditingController skillsController = new TextEditingController();

  TextEditingController notesController = new TextEditingController();

  Widget deleteBtnWidget = Icon(
    FontAwesomeIcons.solidTrashAlt,
    color: Colors.white,
  );

  Widget chevronDown = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );
  Widget chevronUp = Icon(
    FontAwesomeIcons.chevronUp,
    color: Colors.white,
  );

  double defaultHeight = 90.0;

  bool basicDetailsVisibility = false;
  double basicDetailsHeight = 90.0;
  double basicDetailsMaxHeight = 470.0;
  Widget basicDetailsBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool contactDetailsVisibility = false;
  double contactDetailsHeight = 90.0;
  double contactDetailsMaxHeight = 407.0;
  Widget contactDetailsBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool educationVisibility = false;
  double educationHeight = 90.0;
  double educationMaxHeight = 305.0;
  Widget educationBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool workExperienceVisibility = false;
  double workExperienceHeight = 90.0;
  double workExperienceMaxHeight = 555.0;
  Widget workExperienceBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool relationshipVisibility = false;
  double relationshipHeight = 90.0;
  double relationshipMaxHeight = 350.0;
  Widget relationshipBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool otherDetailsVisibility = false;
  double otherDetailsHeight = 90.0;
  double otherDetailsMaxHeight = 360.0;
  Widget otherDetailsBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool notesVisibility = false;
  double notesHeight = 90.0;
  double notesMaxHeight = 360.0;
  Widget notesBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool maleChecked = true;
  bool femaleChecked = false;
  bool otherGenderChecked = false;
  String selectedGender = "Male";
  Color selectedGenderBGColor = Color(0xffff6366);
  Color selectedGenderTextColor = Colors.white;
  Color unselectedGenderBGColor = Color(0xffccfff4);
  Color unselectedGenderTextColor = Colors.grey.shade400;
  Color maleBGColor = Color(0xffff6366);
  Color maleTextColor = Colors.white;
  Color femaleBGColor = Color(0xffccfff4);
  Color femaleTextColor = Colors.grey.shade400;
  Color otherGenderBGColor = Color(0xffccfff4);
  Color otherGenderTextColor = Colors.grey.shade400;

  bool policeRecordValue = false;
  bool receivesPensionValue = false;
  bool socialAidValue = false;

  DateTime dateToday = DateTime.now();
  String selectedDate = 'Date of birth';

  ScrollController scrollController = new ScrollController();

  Widget saveBtnWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        FontAwesomeIcons.solidSave,
        color: Colors.white,
        size: 24.0,
      ),
      SizedBox(
        width: 15.00,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 7.0, right: 5.0),
        child: Text(
          'Save',
          style: TextStyle(color: Colors.white, fontFamily: Stem.medium, fontSize: 24.0),
        ),
      )
    ],
  );

  animateToPosition(int index) {
    double value = 0;
    if (index == 0) {
      value = 0;
    } else if (index == 1) {
      value = basicDetailsHeight + 15.0;
    } else if (index == 2) {
      value = basicDetailsHeight + contactDetailsHeight + 30.0;
    } else if (index == 3) {
      value = basicDetailsHeight + contactDetailsHeight + educationHeight + 45.0;
    } else if (index == 4) {
      value = basicDetailsHeight + contactDetailsHeight + educationHeight + workExperienceHeight + 60.0;
    } else if (index == 5) {
      value = basicDetailsHeight + contactDetailsHeight + educationHeight + workExperienceHeight + relationshipHeight + 75.0;
    } else if (index == 6) {
      value = basicDetailsHeight + contactDetailsHeight + educationHeight + workExperienceHeight + relationshipHeight + otherDetailsHeight + notesHeight;
    }

    scrollController.animateTo(value, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  getCurrentLocation(Function callSetState) {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true).then((Position position) {
      currentPosition = position;
      latitudeController.text = currentPosition.latitude.toStringAsFixed(2);
      longitudeController.text = currentPosition.longitude.toStringAsFixed(2);
      callSetState();
    }).catchError((e) {
      print(e);
    });
  }

  Future<bool> deleteBeneficiary(String id, Function loadData) async {
    var body = {"beneficiaryID": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteBeneficiary), body);

    if (response.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveBeneficiaryData(String id, Function loadData, BuildContext context) async {
    var body = {
      "id": id,
      "firstName": firstNameController.text == "First name" ? "null" : firstNameController.text.replaceAll("'", ""),
      "lastName": lastNameController.text == "Last name" ? "null" : lastNameController.text.replaceAll("'", ""),
      "age": selectedDate == "Date of birth" ? "null" : Common.getAge(selectedDate),
      "gender": selectedGender,
      "nationalID": nationalIDController.text == "NationalID" ? "null" : nationalIDController.text,
      "dateOfBirth": selectedDate == "Date of birth" ? "null" : selectedDate,
      "emailAddress": emailController.text == "Email address" ? "null" : emailController.text,
      "location": locationController.text == "Location" ? "null" : locationController.text,
      "latitude": latitudeController.text == "Latitude" ? "null" : latitudeController.text,
      "longitude": longitudeController.text == "Longitude" ? "null" : longitudeController.text,
      "responsiblePartyName": responsiblePartyNameController.text == "Responsible party name" ? "null" : responsiblePartyNameController.text.replaceAll("'", ""),
      "responsiblePartyRelationship": responsiblePartyRelationshipController.text == "Responsible party relationship" ? "null" : responsiblePartyRelationshipController.text.replaceAll("'", ""),
      "qualificationYear": qualificationYearController.text == "Qualification year" ? "null" : qualificationYearController.text,
      "school": schoolController.text == "School" ? "null" : schoolController.text.replaceAll("'", ""),
      "university": universityController.text == "University" ? "null" : universityController.text.replaceAll("'", ""),
      "skill": skillsController.text == "Skill(s)" ? "null" : skillsController.text.replaceAll("'", ""),
      "workExperience": workExperienceController.text == "Work experience" ? "null" : workExperienceController.text.replaceAll("'", ""),
      "workingCapabilities": workingCapabilitiesController.text == "Working capabilities" ? "null" : workingCapabilitiesController.text.replaceAll("'", ""),
      "currentWorkplace": currentWorkplaceController.text == "Current workplace" ? "null" : currentWorkplaceController.text.replaceAll("'", ""),
      "currentWorkplaceRole": currentWorkplaceRoleController.text == "Current workplace role" ? "null" : currentWorkplaceRoleController.text.replaceAll("'", ""),
      "maritalStatus": maritalStatusController.text == "Marital status" ? "null" : maritalStatusController.text,
      "policeRecord": policeRecordValue ? "true" : "false",
      "receivesPension": receivesPensionValue ? "true" : "false",
      "socialAid": socialAidValue ? "true" : "false",
      "homePhone": homePhoneController.text == "Home phone number" ? "null" : homePhoneController.text,
      "mobilePhone": mobilePhoneController.text == "Mobile phone number" ? "null" : mobilePhoneController.text,
      "workFromDate": workFromDateController.text == "Work from date" ? "null" : workFromDateController.text,
      "workToDate": workToDateController.text == "Work to date" ? "null" : workToDateController.text,
      "salary": salaryController.text == "Salary (Rs)" ? "null" : salaryController.text,
      "numberOfChildren": numberOfChildrenController.text == "Number of children" ? "null" : numberOfChildrenController.text,
      "notes": notesController.text == "Notes" ? "null" : notesController.text.replaceAll("'", "")
    };

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.saveBeneficiaryData), body);

    if (response.success) {
      await loadData();
      Navigator.pop(context);
    } else {
      Alert(
        context: context,
        style: Common.errorAlertStyle,
        type: AlertType.error,
        title: "Save failed",
        desc: response.error,
        buttons: [
          DialogButton(
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: Stem.regular),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
    }
  }

  showError(BuildContext context, String text) {
    Alert(
      context: context,
      style: Common.errorAlertStyle,
      type: AlertType.error,
      title: "Validation error",
      desc: text,
      buttons: [
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: Stem.regular),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }
}
