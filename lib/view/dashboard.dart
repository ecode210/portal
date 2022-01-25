import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portal/view/custom_page_route.dart';
import 'package:portal/view/dashboard_widgets/course_registration.dart';
import 'package:portal/view/dashboard_widgets/details_update.dart';
import 'package:portal/view/dashboard_widgets/payment_receipts.dart';
import 'package:portal/view/dashboard_widgets/profile.dart';
import 'package:portal/view/dashboard_widgets/results.dart';
import 'package:portal/view/dashboard_widgets/school_charges.dart';
import 'package:portal/view/home.dart';
import 'package:portal/view/hostel_allocation.dart';
import 'package:portal/view/payment_section.dart';
import 'package:portal/view/school_tour.dart';
import 'package:portal/view/settings.dart';
import 'package:portal/view/siwes_application.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _advancedDrawerController = AdvancedDrawerController();
  late final ScrollController _itemScrollController;

  @override
  void initState() {
    _itemScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _itemScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AdvancedDrawer(
      backdropColor: Colors.green.shade800,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: WillPopScope(
        onWillPop: () async {
          _advancedDrawerController.showDrawer();
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFf5fff8),
          appBar: PreferredSize(
            preferredSize: Size(size.width, 70),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.green,
                  width: size.width,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: -150,
                  left: -100,
                  child: Center(
                    child: ClipOval(
                      child: Container(
                        width: size.width + 200,
                        height: 500,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: size.width,
                    height: 150,
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: WebsafeSvg.asset(
                            "assets/svg/uniabuja.svg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "UNDERGRADUATE",
                          style: GoogleFonts.benchNine(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: SafeArea(
                    child: SizedBox(
                      width: size.width,
                      height: 70,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: IconButton(
                            onPressed: () {
                              _advancedDrawerController.showDrawer();
                            },
                            icon: ValueListenableBuilder<AdvancedDrawerValue>(
                              valueListenable: _advancedDrawerController,
                              builder: (_, value, __) {
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 250),
                                  child: Icon(
                                    value.visible ? Icons.clear : Iconsax.menu5,
                                    key: ValueKey<bool>(value.visible),
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -200,
                  child: SizedBox(
                    width: size.width,
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
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
                ),
              ],
            ),
          ),
          body: Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.only(top: 70),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    delay: const Duration(seconds: 3),
                    child: const SlideAnimation(
                      child: FadeInAnimation(
                        child: Profile(),
                      ),
                    ),
                  );
                } else if (index == 1) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    delay: const Duration(milliseconds: 500),
                    child: const SlideAnimation(
                      child: FadeInAnimation(
                        child: SchoolCharges(),
                      ),
                    ),
                  );
                } else if (index == 2) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    delay: const Duration(milliseconds: 350),
                    child: const SlideAnimation(
                      child: FadeInAnimation(
                        child: DetailsUpdate(),
                      ),
                    ),
                  );
                } else if (index == 3) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    delay: const Duration(milliseconds: 350),
                    child: const SlideAnimation(
                      child: FadeInAnimation(
                        child: CourseRegistration(),
                      ),
                    ),
                  );
                } else if (index == 4) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    delay: const Duration(milliseconds: 350),
                    child: const SlideAnimation(
                      child: FadeInAnimation(
                        child: Results(),
                      ),
                    ),
                  );
                } else if (index == 5) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(seconds: 1),
                    delay: const Duration(milliseconds: 350),
                    child: const SlideAnimation(
                      child: FadeInAnimation(
                        child: PaymentReceipt(),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              controller: _itemScrollController,
              // itemScrollController: _itemScrollController,
            ),
          ),
        ),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.only(
                  top: 35,
                  bottom: 55,
                  left: 24,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/jpg/passport.jpg',
                ),
              ),
              Container(
                width: size.width * 0.6,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    _advancedDrawerController.hideDrawer();
                  },
                  leading: Icon(
                    Iconsax.profile_2user,
                    color: Colors.green.shade800,
                  ),
                  title: Text(
                    'Dashboard',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.green.shade800,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                  Navigator.push(
                    context,
                    CustomPageRoute(const PaymentSection()),
                  );
                },
                leading: const Icon(Iconsax.bill),
                title: Text(
                  'Payment Section',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                  Navigator.push(
                    context,
                    CustomPageRoute(const SiwesApplication()),
                  );
                },
                leading: const Icon(Iconsax.briefcase),
                title: Text(
                  'SIWES Application',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                  Navigator.push(
                    context,
                    CustomPageRoute(const HostelAllocation()),
                  );
                },
                leading: const Icon(Iconsax.home),
                title: Text(
                  'Hostel Allocation',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Iconsax.book),
                title: Text(
                  'Course Registration',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, CustomPageRoute(const Tour()));
                },
                leading: const Icon(Iconsax.map),
                title: Text(
                  'School Tour',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, CustomPageRoute(const Settings()));
                },
                leading: const Icon(Iconsax.setting),
                title: Text(
                  'Settings',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                      context, CustomPageRoute(const Home()));
                },
                leading: const Icon(Iconsax.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16, left: 60),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
