/// Create mixin named [Logger]
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

/// Constrained Mixin
/// Can only be applied to classes that have Logger
mixin ApiUsageTracker on Logger {
  @override
  void log(String message) {
    super.log(message);
    print('API Usage Logged');
  }
}

/// Single Mixin
class FileService with Logger {
  void read() {
    log('Reading file');
  }
}

/// Multiple Mixins (order matters)
class ApiService with Logger, ApiUsageTracker {
  void fetch() {
    log('Fetching data');
  }
}

void main() {
  print('=== Mixins ===');

  final fileService = FileService();
  fileService.read();

  final apiService = ApiService();
  apiService.fetch();
}
