import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mythBusterCard.dart';

class FactsVMyths extends StatefulWidget {
  @override
  _FactsVMythsState createState() => _FactsVMythsState();
}

class _FactsVMythsState extends State<FactsVMyths> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double borderRadius = 0;
  bool drawerActive = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius))),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 6,
            padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
            decoration: BoxDecoration(
                color: Color(0xFF26757D),
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(borderRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/logo.png',
                      color: Colors.white,
                      height: 45,
                    ),
                  ),
                ),
                Text(
                  'Myth Buster',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                FittedBox(
                  child: Column(
                    children: <Widget>[
                      drawerActive
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                size: 32,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  borderRadius = 0;
                                  drawerActive = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 32,
                              ),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  xOffset = -50;
                                  yOffset =
                                      MediaQuery.of(context).size.height / 5;
                                  borderRadius = 30;
                                  scaleFactor = 0.6;
                                  drawerActive = true;
                                });
                              },
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7.5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 15,
                ),
                MythBusterCard(
                  myth:
                      'Eating garlic or lemon (and other foods commonly used as home remedies for flu and common cold) can help prevent infection with the new Corona virus.',
                  fact:
                      'Garlic is a healthy food that may have some antimicrobial properties. Similarly, vitamin C is an essential nutrient that can support immune function. However, there is no evidence from the current outbreak that eating garlic or lemon (or other foods for that matter) has protected people from the Corona virus.',
                ),
                MythBusterCard(
                  myth:
                      'Regularly gargling with saltwater or saline can help prevent infection with the new Corona virus, as well as drinking water to “Flush” the virus from your mouth.',
                  fact:
                      'There is no evidence that regularly gargling has protected people from infection with the new coronavirus. While this may help soothe a sore throat, this practice will not prevent the virus from entering your lungs—neither will drinking frequent sips of water.',
                ),
                MythBusterCard(
                  myth:
                      "Drinking warm water and getting enough sunlight are effective in preventing COVID-19.",
                  fact:
                      "There is no evidence that the COVID-19 can be killed at higher temperatures. Drinking warm water and getting enough sunlight may have other health benefits. For example, sunlight is good to get Vitamin D, but too much exposure to sunlight may also lead to sunburn.",
                ),
                MythBusterCard(
                  myth:
                      "Taking a hot bath can prevent the Corona virus disease.",
                  fact:
                      "Taking a hot bath will not prevent you from catching COVID-19. Your normal body temperature remains around 36.5°C to 37°C, regardless of the temperature of your bath or shower. Actually, taking a hot bath with extremely hot water can be harmful, as it can burn you. The best way to protect yourself against COVID-19 is by frequently cleaning your hands. By doing this you eliminate viruses that may be on your hands and avoid infection that could occur by then touching your eyes, mouth, and nose.",
                ),
                MythBusterCard(
                  myth:
                      " Hand dryers are effective in killing the new Corona virus.",
                  fact:
                      "Hand dryers are not effective in killing COVID-19. To protect yourself against the Corona virus, you should frequently clean your hands with an alcohol-based hand-rub (“sanitizer”) or wash them with soap and water. Once your hands are cleaned, you should dry them thoroughly by using towels or a warm air dryer.",
                ),
                MythBusterCard(
                  myth:
                      "Spraying alcohol or chlorine all over your body can kill the Corona virus.",
                  fact:
                      "Spraying alcohol or chlorine all over your body will not kill viruses that have already entered your body. Spraying such substances can be harmful to clothes or mucous membranes (i.e. eyes, mouth). Be aware that both alcohol and chlorine can be useful to disinfect surfaces, but they need to be used under appropriate recommendations.",
                ),
                MythBusterCard(
                  myth:
                      "Vaccines against Pneumonia can protect you against the Corona virus.",
                  fact:
                      "No. Vaccines against pneumonia, such as pneumococcal vaccine and Haemophilus influenza type B (Hib) vaccine, do not provide protection against the Corona virus. The virus is so new and different that it needs its own vaccine. Researchers are trying to develop a vaccine against COVID-19, and WHO is supporting their efforts. Although these vaccines are not effective against COVID-19, vaccination against respiratory illnesses such as flu is highly recommended to protect your health.",
                ),
                MythBusterCard(
                  myth:
                      "The Corona virus can be transmitted through mosquito bites.",
                  fact:
                      "To date there has been no evidence to suggest that the Corona virus could be transmitted by mosquitoes. The Corona virus is a respiratory virus which spreads primarily through droplets generated when an infected person coughs or sneezes, or through droplets of saliva or discharge from the nose. To protect yourself, clean your hands frequently with an alcohol-based hand rub or wash them with soap and water. Also, avoid close contact with anyone who is coughing and sneezing.",
                ),
                MythBusterCard(
                  myth: "The Corona virus affects only older people.",
                  fact:
                      "People of ALL AGES can be infected by the new Corona virus. Older people, and people with pre-existing medical conditions (such as asthma, diabetes, heart disease) appear to be more vulnerable to becoming severely ill with the virus. WHO advises people of all ages to take steps to protect themselves from the virus, for example by following good hand hygiene and good respiratory hygiene.",
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
