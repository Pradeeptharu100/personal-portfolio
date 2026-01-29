class TerminalCommand {
  final String input;
  final String output;
  final DateTime timestamp;

  const TerminalCommand({
    required this.input,
    required this.output,
    required this.timestamp,
  });
}

class FileSystemNode {
  final String name;
  final bool isDirectory;
  final String? content;
  final List<FileSystemNode>? children;

  const FileSystemNode({
    required this.name,
    required this.isDirectory,
    this.content,
    this.children,
  });
}
