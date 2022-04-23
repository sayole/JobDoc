class ConsultantInfo {
  //firebase authentication 상의 UID
  String uid = '';

  //컨설턴트 이름
  String consultantName = '';

  //합격시킨 기업
  List<String> successedCompany = [];

  //컨설턴트 닉네임
  String nickname = '';

  //설명
  String introduction = '';

  //카테고리
  List<String> category = [];

  //컨선턴트의 서비스들
  List<Map<String, dynamic>> consultingService = [
    {
      'title': '',
      'subtitle': '',
      'price': '',
    }
  ];
}
