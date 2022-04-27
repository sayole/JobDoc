import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_doc/pages/login/widgets/drop_down_input.dart';

import 'login_styles.dart';

class SubmitWidgets {
  //학력
  static final Map<String, dynamic> hintValueList = {
    '학력': '학력을 선택해주세요',
    '학교명': '학교 이름을 작성해주세요',
    '재학 상태': '현재 상태를 선택해주세요',
    '회사': '회사명을 입력해주세요',
    '년차': '년차를 선택해주세요',
    '직무': '부서명과 직책을 입력해주세요',
    '고용형태': '고용형태를 선택해 주세요',
    '스킬셋': '',
    '목표회사': '',
    '입사시기': ['지금 당장 바로 할거에요', '차근차근 준비해나가고 싶어요', '아직은 생각이 없어요'],
    '컨설팅': [
      '이력서 및 자기소개서',
      '경력기술서',
      '맞춤 채용공고 추천',
      '퍼스널 브랜딩',
      '커리어 전환',
      '면접',
      '직무 및 기업 분석',
      '기타'
    ],
    '링크': '링크 추가하기'
  };

  static final Map<String, List<String>> dropDownValueList = {
    '학력': ['고등학교', '전문대', '학사', '석사', '박사'],
    '재학 상태': ['졸업', '재학'],
    '년차': ['1~2년차', '3~5년차', '6~7년차', '8~11년차', '12년차 이상'],
    '고용형태': ['정규', '계약', '인턴']
  };

  static List<Widget> infoText(String headline, String caption) {
    print(dropDownValueList['학력']);
    return [
      SizedBox(height: 20),
      Text(headline, style: LoginStyles.headline),
      SizedBox(height: 20),
      Text(
        caption,
        style: LoginStyles.caption,
      ),
      SizedBox(height: 25),
    ];
  }

  static Widget submitTextField(
      String widgetName, TextEditingController editingController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widgetName == '이름'
            ? SizedBox(height: 0, width: 0)
            : Text(
                widgetName,
                style: LoginStyles.textFieldSubtitle,
              ),
        TextField(
          controller: editingController,
          style: LoginStyles.inputStyle,
          decoration: InputDecoration(
            hintText: hintValueList[widgetName],
            hintStyle: LoginStyles.hintStyle,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  static Widget submitDropDownField(
      String widgetName, TextEditingController editingController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widgetName,
          style: LoginStyles.textFieldSubtitle,
        ),
        DropdownSearch(
          mode: Mode.MENU,
          showSelectedItems: true,
          items: dropDownValueList[widgetName],
          dropdownSearchDecoration: InputDecoration(
            hintText: hintValueList[widgetName],
            hintStyle: LoginStyles.hintStyle,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          onChanged: (value) {
            editingController.text = value.toString();
          },
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  static Widget textBox(String inputColor, String inputText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: inputColor == 'blue' ? Color(0xff3936f1) : Color(0xffdfdfdf),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              inputText,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                color: inputColor == 'blue' ? Color(0xff3936f1) : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            inputColor == 'blue'
                ? Icon(
                    Icons.clear,
                    color: Color(0xff3936f1),
                    size: 20,
                  )
                : Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20,
                  ),
          ],
        ),
      ),
    );
  }

  // static Widget skillSetWidget() {}
}
