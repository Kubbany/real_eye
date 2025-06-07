String fixLocalhostUrl(String originalUrl) {
  // Check if the URL contains 127.0.0.1
  if (originalUrl.contains('127.0.0.1')) {
    // Replace with your actual local IP (you might want to make this configurable)
    const yourLocalIp = '192.168.1.14'; // Change this to your actual local IP
    return originalUrl.replaceAll('127.0.0.1', yourLocalIp);
  }
  return originalUrl;
}
