class UserData {
  //firebase authentication 상의 UID
  String uid;
  //성함
  String name;

  //학력
  String educationGroup;
  //학교명
  String educationSchoolName;
  //학력 상태
  String educationStatus;

  //회사
  String careerCompany;
  //연차
  String careerYears;
  //직무
  String careerPart;
  //고용형태
  String careerType;

  //스킬셋
  List<String> skillSet = [];

  //관심 회사
  List<String> wishingCompany = [];
  //DB 넣을 시
  // var list = ['one', 'two', 'three'];
  // var stringList = list.join(",");
  // print(stringList); //Prints "one,two,three"

  //DB 뺄 때
  // String stringList = "one,two,three";
  // print("${stringList.split(',')}"); //Prints ['one', 'two', 'three']

  //입사예정일
  List<String> wishingJoinDate = [];

  //원하는 컨설팅
  List<String> wishingConsulting = [];

  //공고
  String jobPosting;

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
}
