class Format{
  String formatTime(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600; // Calculate hours
    final int minutes = (totalSeconds % 3600) ~/ 60; // Calculate minutes
    final int seconds = totalSeconds % 60; // Calculate seconds

    // Format hours, minutes, and seconds into HH:MM:SS
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  String formatTimeHumanReadable(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600; // Calculate hours
    final int minutes = (totalSeconds % 3600) ~/ 60; // Calculate minutes
    final int seconds = totalSeconds % 60; // Calculate seconds

    // Build the human-readable string
    final List<String> parts = [];
    if (hours > 0) {
      parts.add('$hours hour${hours > 1 ? 's' : ''}');
    }
    if (minutes > 0) {
      parts.add('$minutes minute${minutes > 1 ? 's' : ''}');
    }
    if (seconds > 0) {
      parts.add('$seconds second${seconds > 1 ? 's' : ''}');
    }

    // Join the parts with commas and "and"
    if (parts.isEmpty) {
      return '0 seconds';
    } else if (parts.length == 1) {
      return parts.first;
    } else if (parts.length == 2) {
      return '${parts[0]} and ${parts[1]}';
    } else {
      return '${parts[0]}, ${parts[1]}, and ${parts[2]}';
    }
  }
}