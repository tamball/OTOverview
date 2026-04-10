/// 從 YouTube `watch` 或 `youtu.be` 網址取出影片 id；無法辨識則回傳 null。
String? youtubeVideoIdFromUrl(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null) return null;
  final host = uri.host.toLowerCase();
  if (host.contains("youtube.com")) {
    if (uri.path.contains("watch")) {
      return uri.queryParameters["v"];
    }
    if (uri.pathSegments.length >= 2 && uri.pathSegments.first == "embed") {
      return uri.pathSegments[1];
    }
  }
  if (host == "youtu.be" || host.endsWith(".youtu.be")) {
    if (uri.pathSegments.isEmpty) return null;
    return uri.pathSegments.first;
  }
  return null;
}
