// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
  String imgUrl;
  String title;
  String subTitle;
  String date;
  String time;
  String location;
  String detailedText;

  //List<Activity> activities;

  NewsModel({
    required this.imgUrl,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.time,
    required this.location,
    required this.detailedText,
    // required this.activities,
  });

  /* 
 Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tittle': tittle,
      'subTitle': subTitle,
      'imgUrl': imgUrl,
      'date': date,
      'time': time,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      tittle: map['tittle'] as String,
      subTitle: map['subTitle'] as String,
      imgUrl: map['imgUrl'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);
*/
}

class Activity {}

List<NewsModel> newsDetails = [
  NewsModel(
      imgUrl: 'assets/images/img1.png',
      title: 'Quick Talk & Support',
      subTitle: 'All servcie',
      date: 'Friday Nov. 08 2023',
      time: '09:00am',
      location: 'ESA Pavilion',
      detailedText: ''
      //activities: [],
      ),
  NewsModel(
      imgUrl: 'assets/images/img2.png',
      title: 'Create Panic alert',
      subTitle: 'Evening servcie',
      date: 'Wednesday Nov. 08 2023',
      time: '06:30pm',
      location: 'SRC Car Park',
      detailedText: ''

      // activities: [],
      ),
  NewsModel(
      imgUrl: 'assets/images/img3.png',
      title: 'Report Abuse',
      subTitle: 'Afternoon servcie',
      date: 'Saturday Nov. 08 2023',
      time: '03:00pm',
      location: 'Ceremonial Grounds',
      detailedText: ''

      //activities: [],
      ),
  NewsModel(
      imgUrl: 'assets/images/img4.png',
      title: 'UNICEF',
      subTitle: 'All servcie',
      date: 'Friday Nov. 08 2023',
      time: '09:00am',
      location: 'ESA Pavilion',
      detailedText: ''

      //activities: [],
      ),
];
