class Moto {
  String title;
  String situation;
  String moto;
  String motoEnglish;
  Moto(
      {required this.title,
      required this.motoEnglish,
      required this.situation,
      required this.moto});
}

// தேடுதல் வாழ்க்கையில் முக்கியமானது
List<Moto> motos = [
  Moto(
      title: 'About',
      situation: 'My Thinking',
      moto: 'எப்பொழுதும் எனக்குத் தேவையானதைத் தேடிக் கற்று, '
          'அதற்குத் தேவையானதைச் செய்பவர்',
      motoEnglish:
          'Always seeks what I need and learn and will do what it takes'),
  Moto(
      title: 'Handle Situation',
      situation: 'If Unexpected thing happens',
      moto: 'எல்லாம் நன்மைக்கே',
      motoEnglish: 'All is Well'),
  Moto(
      title: 'Handle Situation',
      situation: 'When i try some risky task',
      moto: 'எவ்வளவோ பண்ணிட்டோம் இத பண்ண மாட்டோமா',
      motoEnglish: 'No matter how hard we try, we will not do it'),
  Moto(
      title: 'About Time',
      situation: 'Most important Thought',
      moto: 'காலம் தடுக்க முடியாதது.'
          ' நான் யாருக்காகவும் எதற்காகவும் காத்திருக்க மாட்டேன்',
      motoEnglish: 'Time is Unstoppable. I won\'t wait for anyone or anything'),
  Moto(
      title: '',
      situation: 'Working Method',
      moto: 'பேசுவதை விட்டுவிட்டு செய்யத் தொடங்குவதே தொடங்குவதற்கான வழி',
      motoEnglish:
          'The way to get started is to quit talking and begin doing \n   [Try->(Fail->Learn)]'),
  // Moto(title: 'Time', situation: '', moto: '',motoEnglish: '' ),
  // Moto(title: 'Time', situation: '', moto: '',motoEnglish: '' ),
  // Moto(title: 'Time', situation: '', moto: '',motoEnglish: '' ),
];

class Hobby {
  String hobbyName;
  String details;
  String acheivements;
  String imagePath;
  Hobby(
      {required this.hobbyName,
      required this.details,
      required this.imagePath,
      required this.acheivements});
}

List<Hobby> hobbies = [];
