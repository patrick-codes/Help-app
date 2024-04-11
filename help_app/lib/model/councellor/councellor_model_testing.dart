// ignore_for_file: public_member_api_docs, sort_constructors_first

class TestingCouncellorModel {
  String? fullName;
  String? profession;
  String? address;
  String? contact;
  bool? isVerified;
  double? feeCharged;
  String? imageUrl;
  String? about;
  int? review;

  TestingCouncellorModel({
    this.fullName,
    this.profession,
    this.address,
    this.contact,
    this.isVerified,
    this.feeCharged,
    this.imageUrl,
    this.about,
    this.review,
  });
}

class Activity {}

List<TestingCouncellorModel> councellorDetails = [
  TestingCouncellorModel(
    fullName: 'Boateng Patrick',
    profession: 'Medical Doctor',
    address: 'Kumasi, Tanoso',
    contact: '0245523507',
    isVerified: true,
    feeCharged: 50.00,
    imageUrl: 'null',
    about:
        "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
    review: 4,
  ),
  TestingCouncellorModel(
    fullName: 'Oppong Kyekyeku',
    profession: 'Phsychologist',
    address: 'Accra, Gbawe',
    contact: '0260377889',
    isVerified: false,
    feeCharged: 60.00,
    imageUrl: null,
    about:
        "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
    review: 3,
  ),
  TestingCouncellorModel(
    fullName: 'Noah Martey',
    profession: 'Reverend Father',
    address: 'Takoradi, Efiekumah',
    contact: '023797656',
    isVerified: true,
    feeCharged: 70.00,
    imageUrl: null,
    about:
        "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
    review: 5,
  ),
  TestingCouncellorModel(
    fullName: 'Frimpong Emmanuel',
    profession: 'Marriage Councellor',
    address: 'Tema, C9',
    contact: '023546434',
    isVerified: true,
    feeCharged: 70.00,
    imageUrl: null,
    about:
        "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
    review: 2,
  ),
  TestingCouncellorModel(
    fullName: 'Sophia Bempong',
    profession: 'Phsychologist',
    address: 'Kumasi, Kwadaso',
    contact: '024552357',
    isVerified: false,
    feeCharged: 50.00,
    imageUrl: null,
    about:
        "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
    review: 3,
  ),
  TestingCouncellorModel(
    fullName: 'Agyabeng Micheal',
    profession: 'Social Advisor',
    address: 'Ho, Abor',
    contact: '0245523507',
    isVerified: true,
    feeCharged: 90.00,
    imageUrl: null,
    about:
        "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
    review: 4,
  ),
  TestingCouncellorModel(
    fullName: 'Prince Boateng',
    profession: 'Nurse',
    address: 'Akim-Oda',
    contact: '020880999',
    isVerified: true,
    feeCharged: 50.00,
    imageUrl: null,
    about:
        "Hello ..I am Patrick, a passionate cross platform mobile applications developer with flutter having equipped with 3+ years of experience. I just came across your project and with my expertise",
    review: 3,
  ),
];
