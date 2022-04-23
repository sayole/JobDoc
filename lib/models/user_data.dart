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
  //재직상태
  String careerStatus;
  //직무
  String careerPart;
  //고용형태
  String careerType;

  //스킬셋
  String skillSet;

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
  String wishingJoinDate;

  //원하는 컨설팅
  String wishingConsulting;

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
    this.careerStatus = '',
    this.careerPart = '',
    this.careerType = '',
    this.skillSet = '',
    this.wishingJoinDate = '',
    this.wishingConsulting = '',
    this.jobPosting = '',
  });
}
