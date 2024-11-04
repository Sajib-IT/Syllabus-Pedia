
class AppString{
  static const String serverError =
      'There could be a problem either with the network or during the server request. Please try again.';

  static  List<List<String>>  allCourseNameList(String semesterName){
    return [
      if (semesterName == "Fourth Year First Semester")
        [
          "Telecommunication Engineering",
          "Simulation and Modeling",
          "Cryptography and Cyber Law",
          "E-Commerce and Web Programming",
          "Research Methodology"
        ],
      if (semesterName == "Fourth Year Second Semester")
        [
          "Digital Signal Processing",
          "Wireless and Mobile Communication",
          "Optical Communication",
          "Artificial Intelligence"
        ]
    ];

  }
  static List<Map<String, String>> allCourseContentDetailsList(String courseName){
    return [
      if (courseName == "Wireless and Mobile Communication")
        {
          "History and Evolution of Mobile Radio Communication":
          "Principle of Conventional Mobile Radio System, Limitation of Conventional Mobile Radio System",
          "Radio Paging":
          "Introduction, Paging Receiver Types, On Site Paging, Transmitter Specifications, Wide Area Paging, Transmission Specifications, Paging Receivers Architecture"
        },
      if (courseName == "Optical Communication")
        {
          "Introduction":
          "Basic Optical Communication System, Advantages and application of optical fiber Communication systems",
        }
    ];
  }
}