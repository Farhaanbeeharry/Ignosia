import 'package:Ignosia/Common/API.dart';
import 'package:Ignosia/Common/ApiUrl.dart';
import 'package:Ignosia/Model/BeneficiaryModel.dart';
import 'package:Ignosia/Model/DashboardModel.dart';
import 'package:Ignosia/Model/ResponseModel.dart';

class DashController {
  List<Beneficiaries> maleList = new List<Beneficiaries>();
  List<Beneficiaries> femaleList = new List<Beneficiaries>();
  List<Beneficiaries> otherList = new List<Beneficiaries>();

  DashboardModel dashboardData = new DashboardModel();

  List<String> genderValues = new List<String>();

  bool dataLoaded = false;

  Future<void> loadBeneficiaryData(Function callSetState) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getBeneficiaryData), {});

    if (response.success) {
      List<BeneficiaryModel> beneficiaries = new List<BeneficiaryModel>();

      int male0To14 = 0;
      int male15To18 = 0;
      int male19To30 = 0;
      int male31To60 = 0;
      int maleOver60 = 0;
      int female0To14 = 0;
      int female15To18 = 0;
      int female19To30 = 0;
      int female31To60 = 0;
      int femaleOver60 = 0;
      int other0To14 = 0;
      int other15To18 = 0;
      int other19To30 = 0;
      int other31To60 = 0;
      int otherOver60 = 0;

      for (int i = 0; i < response.data.length; i++) {
        beneficiaries.add(BeneficiaryModel().fromJson(response.data[i]));
      }

      for (var beneficiary in beneficiaries) {
        if (beneficiary.gender == "Male") {
          if (int.parse(beneficiary.age) >= 0 && int.parse(beneficiary.age) < 15) {
            male0To14++;
          } else if (int.parse(beneficiary.age) >= 15 && int.parse(beneficiary.age) < 19) {
            male15To18++;
          } else if (int.parse(beneficiary.age) >= 19 && int.parse(beneficiary.age) < 31) {
            male19To30++;
          } else if (int.parse(beneficiary.age) >= 31 && int.parse(beneficiary.age) < 61) {
            male31To60++;
          } else if (int.parse(beneficiary.age) >= 61) {
            maleOver60++;
          }
        } else if (beneficiary.gender == "Female") {
          if (int.parse(beneficiary.age) >= 0 && int.parse(beneficiary.age) < 15) {
            female0To14++;
          } else if (int.parse(beneficiary.age) >= 15 && int.parse(beneficiary.age) < 19) {
            female15To18++;
          } else if (int.parse(beneficiary.age) >= 19 && int.parse(beneficiary.age) < 31) {
            female19To30++;
          } else if (int.parse(beneficiary.age) >= 31 && int.parse(beneficiary.age) < 61) {
            female31To60++;
          } else if (int.parse(beneficiary.age) >= 61) {
            femaleOver60++;
          }
        } else {
          if (int.parse(beneficiary.age) >= 0 && int.parse(beneficiary.age) < 15) {
            other0To14++;
          } else if (int.parse(beneficiary.age) >= 15 && int.parse(beneficiary.age) < 19) {
            other15To18++;
          } else if (int.parse(beneficiary.age) >= 19 && int.parse(beneficiary.age) < 31) {
            other19To30++;
          } else if (int.parse(beneficiary.age) >= 31 && int.parse(beneficiary.age) < 61) {
            other31To60++;
          } else if (int.parse(beneficiary.age) >= 61) {
            otherOver60++;
          }
        }
      }

      maleList.add(Beneficiaries("0-14 yrs", male0To14));
      maleList.add(Beneficiaries("15-18 yrs", male15To18));
      maleList.add(Beneficiaries("19-30 yrs", male19To30));
      maleList.add(Beneficiaries("31-60 yrs", male31To60));
      maleList.add(Beneficiaries("60+ yrs", maleOver60));
      femaleList.add(Beneficiaries("0-14 yrs", female0To14));
      femaleList.add(Beneficiaries("15-18 yrs", female15To18));
      femaleList.add(Beneficiaries("19-30 yrs", female19To30));
      femaleList.add(Beneficiaries("31-60 yrs", female31To60));
      femaleList.add(Beneficiaries("60+ yrs", femaleOver60));
      otherList.add(Beneficiaries("0-14 yrs", other0To14));
      otherList.add(Beneficiaries("15-18 yrs", other15To18));
      otherList.add(Beneficiaries("19-30 yrs", other19To30));
      otherList.add(Beneficiaries("31-60 yrs", other31To60));
      otherList.add(Beneficiaries("60+ yrs", otherOver60));

      callSetState();
    }
  }

  Future<void> loadDashboardData(Function loadData, Function callSetState) async {
    dataLoaded = false;
    callSetState();
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getDashboardData), {});

    if (response.success) {
      dashboardData = DashboardModel().fromJson(response.data[0]);
      dataLoaded = true;
      callSetState();
    } else {
      await Future.delayed(Duration(seconds: 3));
      await loadData();
    }
  }
}

class Beneficiaries {
  Beneficiaries(this.ageRange, this.amount);
  final String ageRange;
  final int amount;
}
