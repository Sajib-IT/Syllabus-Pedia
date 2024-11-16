class AppString {
  static const String serverError =
      'There could be a problem either with the network or during the server request. Please try again.';

  static List<List<String>> allCourseNameList(String semesterName) {
    return [
      if (semesterName == "First Year First Semester")
        [
          "Basic Electrical Circuit",
          "Computer Programming",
          "Physics",
          "Mathematics-I (Differential and Integral Calculus)",
          "Technical Communicative English",
        ],
      if (semesterName == "First Year Second Semester")
        [
          "Electronic Devices and Circuit Theory",
          "Programming with C++",
          "Data Structure",
          "Discrete Mathematics",
          "Matrices and Co-ordinate Geometry",
        ],
      if (semesterName == "Second Year First Semester")
        [
          "Operational Amplifier and Timer Circuits",
          "Digital Logic Design",
          "Object Oriented Programming with Java",
          "Algorithm Design and Analysis",
          "Differential Equation and Vector Calculus",
          "Statistics"
        ],
      if (semesterName == "Second Year Second Semester")
        [
          "Computer Organization and Architecture",
          "Computer Based Numerical Methods",
          "Advanced Java and Mobile Application",
          "Database Management Systems",
          "Complex Variables and Fourier Analysis",
          "Economics",
          "Financial and Managerial Accounting"
        ],
      if (semesterName == "Third Year First Semester")
        [
          "Data Mining",
          "Analog and Digital Communication",
          "Microprocessor and Assembly Language",
          "Theory of Computation",
          "Operating Systems",
        ],
      if (semesterName == "Third Year Second Semester")
        [
          "Microwave Engineering",
          "Compiler Design",
          "Computer Peripheral and Interfacing",
          "Computer Networks",
          "Software Engineering",
          "Bio-Informatics"
        ],
      if (semesterName == "Fourth Year First Semester")
        [
          "Research Thesis/Project",
          "Telecommunication Engineering",
          "Simulation and Modeling",
          "Cryptography and Cyber Law",
          "E-Commerce and Web Programming",
          "Research Methodology"
        ],
      if (semesterName == "Fourth Year Second Semester")
        [
          "Research Thesis/Project",
          "Wireless and Mobile Communication",
          "Optical Communication",
          "Digital Signal Processing",
          "Artificial Intelligence"
        ]
    ];
  }

  static List<Map<String, String>> allCourseContentDetailsList(
      String courseName) {
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
