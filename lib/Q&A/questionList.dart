import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final int index;
  QuestionList(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                color: Color(0xFF25737B),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              questions[index],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                color: Color(0xFF2d919c),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Text(
              answers[index],
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> questions = [
  'Q1. What is COVID-19?',
  'Q2. Is the virus ‘natural’ or was it bio-engineered?',
  'Q3. What samples are required to test for COVID-19?',
  'Q4. Where do the tests happen?',
  'Q5. Is the test free?',
  'Q6. What happens if I test positive?',
  'Q7. Is COVID-19 fatal?',
  'Q8. Do medical insurance policies cover COVID-19?',
  'Q9. Can I travel?',
  'Q10. Is there a way to treat a coronavirus infection?',
  'Q11. Should I use a hand-sanitiser?',
];
List<String> answers = [
  'Ans. COVID-19 is the name of the disease caused by the new coronavirus. It stands for ‘coronavirus disease 2019.\nThe name of the virus itself is SARS-CoV-2. The WHO devoted considerable attention in the circumstances to finalising this name, which you can read about here.',
  'Ans. It is extremely unlikely that the virus was bio-engineered or synthesised, and extremely likely to be of natural origin.\nIt is a zoonotic virus, which means it spread from non-humans to humans. Perhaps the most famous zoonotic disease among humans is AIDS, caused by the human immunodeficiency virus that ‘jumped’ from primates in Africa to humans in the first half of the 20th century.',
  'Ans. If a test has been approved, a medical worker will collect a swab of the cells in your upper and lower respiratory tracks, and a blood sample. According to the CDC, the samples will be stored at 2-8º C and shipped to a testing lab.\nAt the lab, cells from the swab and blood will be isolated and loaded onto a PCR machine. PCR stands for polymerase chain reaction, which is a series of chemical reactions used to amplify genetic material present in the cells over the course of a few hours.\nThe material is then checked for the presence of nucleotide sequences that are unique to the new coronavirus. If a match is found, the sample is considered to have tested positive for COVID-19.\nResearchers at the lab will also check the samples for the presence of other variants of influenza.',
  'Ans. There are currently 52 associate centres around India that have been permitted by the government to test for coronavirus infections, and are led by the National Institute of Virology, the nodal institute in Pune.',
  'Ans. Yes. All COVID-19 tests being conducted at government laboratories are free of cost.\nPrivate laboratories are not allowed to conduct these tests.',
  'Ans. If you test positive, you will be hospitalised until0 doctors can ascertain you no longer have COVID-19.',
  'Ans. The potential severity of a COVID-19 infection depends on your age. \nAccording to the World Health Organisation,For COVID-19 virus, initial data indicates that children are less affected than adults and that clinical attack rates in the 0-19 age group are low. Further preliminary data from household transmission studies in China suggest that children are infected from adults, rather than vice versa. While the range of symptoms for the two viruses is similar, the fraction with severe disease appears to be different. For COVID-19, data to date suggest that 80% of infections are mild or asymptomatic, 15% are severe infection, requiring oxygen and 5% are critical infections, requiring ventilation.\nFor COVID-19, our current understanding is that older age and underlying conditions increase the risk for severe infection. … While the true mortality of COVID-19 will take some time to fully understand, the data we have so far indicate that the crude mortality ratio (the number of reported deaths divided by the reported cases) is between 3-4%, the infection mortality rate (the number of reported deaths divided by the number of infections) will be lower. … However, mortality is to a large extent determined by access to and quality of health care.',
  'Ans. Yes. The Insurance Regulatory and Development Authority of India instructed all insurers via a notice on March 4, 2020, to cover all claims pertaining to hospitalisation due to coronavirus and medical expenses incurred due to treatment of coronavirus.',
  'Ans. Try not to, especially abroad and even more especially to countries that have a high burden of coronavirus cases. If you are planning to travel, please make sure it is essential before booking your tickets.',
  'Ans. There is no one thing you can do – like take a vaccine shot – to get rid of a COVID-19 infection if you already have it. This is why prevention is very important.\nThe CDC reported, Approximately 20-30% of hospitalised patients with COVID-19 and pneumonia have required intensive care for respiratory support. … Among critically ill patients admitted to an intensive care unit, 11–64% received high-flow oxygen therapy and 47-71% received mechanical ventilation. Some hospitalised patients have required advanced organ support with endotracheal intubation and mechanical ventilation (4–42%). A small proportion have also been supported with extracorporeal membrane oxygenation (ECMO, 3–12%).',
  'Ans. A hand-sanitiser is likely to be effective only if it contains more than 60% alcohol. However, if you have access to soap and running water, go for that instead. Soap is far more effective than hand-sanitisers because its chemical properties allow it to rapidly destroy viruses on your skin.',
];
