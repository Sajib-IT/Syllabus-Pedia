class Util {
  // Function to clean and format the AI response
 // static String cleanResponse(String response) {
 //    // Remove markdown formatting like ** and * and keep the structure
 //    response = response.replaceAll(RegExp(r"\*{1,2}|`"), "");
 //
 //    // Add line breaks for readability between sections and bullet points
 //    response = response.replaceAll(RegExp(r"\n{2,}"), "\n\n");
 //
 //    // Properly format headings and subheadings with clear line breaks
 //    response = response.replaceAllMapped(
 //      RegExp(r"(\d+\.)|(\*{1,2}[A-Za-z\s]+[:])"),
 //          (match) {
 //        if (match.group(1) != null) {
 //          return "\n\n${match.group(1)}\n";  // For numbers like "1.", "2.", etc.
 //        } else if (match.group(2) != null) {
 //          return "\n\n${match.group(2)}\n";  // For headings like "Foundational Concepts:"
 //        }
 //        return "";
 //      },
 //    );
 //
 //    return response.trim();
 //  }

  static  String cleanResponse(String response) {
    // Remove markdown formatting like ** and * and keep the structure
    response = response.replaceAll(RegExp(r"\*{1,2}|`"), "");

    // Remove extra spaces around year or similar terms (e.g., "1998" should not have extra space before it)
    response = response.replaceAll(RegExp(r"\s*(\d{4})\s*"), r" $1");

    // Add line breaks for readability between sections
    response = response.replaceAll(RegExp(r"\n{2,}"), "\n\n");

    return response.trim();
  }


}
