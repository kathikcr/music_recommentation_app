// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback showPromptScreen;
  const HomeScreen({
    Key? key,
    required this.showPromptScreen,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              Color(0xFF330000),
              Color(0xFF000000),
            ],
          ),
        ), //column starts here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //First Expanded
            Expanded(
              flex: 3,

              //Padding around image in stack
              child: Padding(
                padding: const EdgeInsets.only(top: 40), //Stack starts here
                child: Stack(
                  children: [
                    //Container for images
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/sonnet.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.4,
                              color: const Color(0xFFFFFFFF),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/sonnetlogo.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //stack ends here
              ),
            ),
            //Second Expanded
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                //Column Starts here
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          height: 1.3,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Create AI curated music playlist just for your mood!!!\n",
                            style: GoogleFonts.inter(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          TextSpan(
                            text: "Get Started Now!\n",
                            style: GoogleFonts.inter(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Padding For Arrow Forward
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: widget.showPromptScreen,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFCCCC).withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_forward),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Columns Ends Here
              ),
            ),
          ],
        ), //Column Ends Here
      ),
    );
  }
}
