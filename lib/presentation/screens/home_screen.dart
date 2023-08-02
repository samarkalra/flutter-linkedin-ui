import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:linkedin/constants/app_colors.dart";
import "package:linkedin/presentation/screens/scroll_to_hide_widget.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    setupStatusBar();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setupStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.linkedinBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: _controller,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool isScrolled) {
            return [
              SliverAppBar(
                title: const Text('Linkedin'),
                centerTitle: true,
                floating: true,
                backgroundColor: AppColors.linkedinBlue,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_rounded),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message),
                  )
                ],
              ),
            ];
          },
          body: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item ${index + 1}'),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: _controller,
        child: BottomNavigationBar(
          backgroundColor: AppColors.linkedinBlue,
          unselectedItemColor: AppColors.lightGray,
          unselectedIconTheme: const IconThemeData(color: AppColors.lightGray),
          selectedItemColor: AppColors.white,
          selectedIconTheme: const IconThemeData(color: AppColors.white),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt),
              label: 'My Network',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_rounded),
              label: 'Post',
            ),
          ],
        ),
      ),
    );
  }
}
