// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_recommender_application/random_circles.dart';

class PromptScreen extends StatefulWidget {
  final VoidCallback showHomeScreen;
  const PromptScreen({
    Key? key,
    required this.showHomeScreen,
  }) : super(key: key);

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  //Genre List
  final List<String> genres = [
    'Jazz',
    'Rock',
    'Amapiano',
    'R&B',
    'Latin',
    'Hip-Hop',
    'Hip-Life',
    'Reggae',
    'Gospel',
    'Afrobeat',
    'Blues',
    'Country',
    'Punk',
    'Pop',
  ];
//selected genres list
  final Set<String> _selectedGenres = {};
//selected mood
  String? _selectedMood;
//selected moodimage
  String? _selectedMoodImage;
//function for selected Genres
  void _onGenreTap(String genre) {
    setState(() {
      if (_selectedGenres.contains(genre)) {
        _selectedGenres.remove(genre);
      } else {
        _selectedGenres.add(genre);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //container that contains all the components
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
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),

        //Padding around contents
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //first Expanded For Various Moods
              Expanded(
                child: RandomCircles(
                  onMoodSelected: (mood, image) {
                    _selectedMood = mood;
                    _selectedMoodImage = image;
                  },
                ),
              ),

              //second Expanded For Various Genres and Submit Button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Genre",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFFFFF).withOpacity(0.8),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Wrap(
                              children: genres.map((genre) {
                                final isSelected =
                                    _selectedGenres.contains(genre);

                                //Container with border for each genre
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_selectedGenres.contains(genre)) {
                                        _selectedGenres.remove(genre);
                                      } else {
                                        _selectedGenres.add(genre);
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    margin: const EdgeInsets.only(
                                      right: 4,
                                      top: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 0.4,
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? const Color(0xFF0000FF)
                                            : const Color(0xFFFFFFFF)
                                                .withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        genre,
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: isSelected
                                              ? const Color(0xFFFFFFFF)
                                              : const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),

                      //padding around the submit button
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 10,
                          right: 10,
                        ),

                        //container for submit button
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFFFCCCC),
                          ),

                          //Submit TExt
                          child: Center(
                            child: Text(
                              "Submit",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
