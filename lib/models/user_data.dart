class UserData {
  //firebase authentication 상의 UID
  late String? uid;
  //성함
  late String name;

  //학력
  late String educationGroup;
  //학교명
  late String educationSchoolName;
  //학력 상태
  late String educationStatus;

  //회사
  late String careerCompany;
  //연차
  late String careerYears;
  //직무
  late String careerPart;
  //고용형태
  late String careerType;

  //스킬셋
  late List<String> skillSet = [];

  //관심 회사
  late List<String> wishingCompany = [];

  //입사예정일
  late List<String> wishingJoinDate = [];

  //원하는 컨설팅
  late List<String> wishingConsulting = [];

  //공고
  late String jobPosting;

  UserData({
    this.uid = '',
    this.name = '',
    this.educationGroup = '',
    this.educationSchoolName = '',
    this.educationStatus = '',
    this.careerCompany = '',
    this.careerYears = '',
    this.careerPart = '',
    this.careerType = '',
    this.jobPosting = '',
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'educationGroup': educationGroup,
        'educationSchoolName': educationSchoolName,
        'educationStatus': educationStatus,
        'careerCompany': careerCompany,
        'careerYears': careerYears,
        'careerPart': careerPart,
        'careerType': careerType,
        'skillSet': skillSet,
        'wishingCompany': wishingCompany,
        'wishingJoinDate': wishingJoinDate,
        'wishingConsulting': wishingConsulting,
      };

  UserData.fromJson(Map parsedJson) {
    uid = parsedJson['uid'] ?? '';
    name = parsedJson['name'] ?? '';
    educationGroup = parsedJson['educationGroup'] ?? '';
    educationSchoolName = parsedJson['educationSchoolName'] ?? '';
    educationStatus = parsedJson['educationStatus'] ?? '';
    careerCompany = parsedJson['careerCompany'] ?? '';
    careerYears = parsedJson['careerYears'] ?? '';
    careerPart = parsedJson['careerPart'] ?? '';
    careerType = parsedJson['careerType'] ?? '';
    skillSet = parsedJson['skillSet'] ?? [];
    wishingCompany = parsedJson['wishingCompany'] ?? [];
    wishingJoinDate = parsedJson['wishingJoinDate'] ?? [];
    wishingConsulting = parsedJson['wishingConsulting'] ?? [];
  }
}
