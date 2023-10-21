class TextFieldValidator {
  // Video validator
  videoValidator(name) {
    List<String> validVideoExtensions = ["mp4", "avi", "mkv"];
    String extension = name.split('.').last.toLowerCase();
    if (!validVideoExtensions.contains(extension)) {
      return "Invalid File Type";
    } else {
      return null;
    }
  }
}
