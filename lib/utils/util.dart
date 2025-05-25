class Util {

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
