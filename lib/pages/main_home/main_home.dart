import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_doc/models/user_data.dart';
import 'package:job_doc/pages/myPage/edit_my_page.dart';
import 'package:job_doc/services/bottomnavi_service.dart';
import 'package:job_doc/services/user_service.dart';
import 'package:provider/provider.dart';
import '../myPage/my_page.dart';
import '../proposal/proposal_list.dart';
import 'main_home_type1.dart';
import 'settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  UserData user = UserData();
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  late TabController _tabController;
  late BtmNavProvider _navProvider;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      // _selectedIndex = _tabController.index;
      _navProvider.changeIndex(_tabController.index);
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _navProvider.addListener(() {
        // if (_navProvider.selectedIndex != _selectedIndex) {
        _tabController.animateTo(_navProvider.selectedIndex);
        // _selectedIndex = _navProvider.selectedIndex;
        // }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _navProvider = Provider.of<BtmNavProvider>(context, listen: true);
    return Consumer<BtmNavProvider>(
      builder: (context, btmNav, child) {
        UserService userService = context.read<UserService>();

        final btmNavItems = [
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(btmNav.selectedIndex == 0
                    ? 'assets/icons/home_chosen.png'
                    : 'assets/icons/home_not_chosen.png'),
              ),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(btmNav.selectedIndex == 1
                    ? 'assets/icons/proposal_chosen.png'
                    : 'assets/icons/proposal_not_chosen.png'),
              ),
              label: '나의 견적'),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(btmNav.selectedIndex == 2
                    ? 'assets/icons/my_page_chosen.png'
                    : 'assets/icons/my_page_not_chosen.png'),
              ),
              label: '내정보'),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage(
                  btmNav.selectedIndex == 3
                      ? 'assets/icons/setting_chosen.png'
                      : 'assets/icons/setting_not_chosen.png',
                ),
              ),
              label: '환경 설정'),
        ];
        return Scaffold(
          body: FutureBuilder<QuerySnapshot>(
              future: userService.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final documents = snapshot.data?.docs ?? [];
                  final userDocumentId = documents[0].id;
                  userService.retrieveUserData(documents[0]);
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      MainPage(), // tpye1
                      ProposalList(), // 프로포절 페이지 , 여기도 다 넘겨주기
                      EditMyPage(), // 내정보 페이지
                      SettingPage(),
                    ],
                  );
                }
              }),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(color: Colors.white),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            selectedItemColor: Color(0xFFF3936F1),
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              _tabController.animateTo(index);
              btmNav.changeIndex(index);
            },
            currentIndex: btmNav.selectedIndex,
            items: btmNavItems,
          ),
        );
      },
    );
  }
}
