import 'package:flutter/material.dart';

import '../../home/data/portfolio_data.dart';
import '../../home/models/project_model.dart';
import '../../home/models/skill_model.dart';
import '../models/terminal_models.dart';

class TerminalProvider extends ChangeNotifier {
  final List<TerminalCommand> _history = [];
  String _currentDirectory = '~';
  final TextEditingController inputController = TextEditingController();
  final FocusNode inputFocusNode = FocusNode();

  List<TerminalCommand> get history => List.unmodifiable(_history);
  String get currentDirectory => _currentDirectory;

  // File system structure
  final Map<String, FileSystemNode> _fileSystem = {
    '~': const FileSystemNode(
      name: '~',
      isDirectory: true,
      children: [
        FileSystemNode(
          name: 'about.txt',
          isDirectory: false,
          content: PortfolioData.summary,
        ),
        FileSystemNode(
          name: 'contact.txt',
          isDirectory: false,
          content:
              '''
Email: ${PortfolioData.email}
Phone: ${PortfolioData.phone}
LinkedIn: ${PortfolioData.linkedIn}
GitHub: ${PortfolioData.github}
Location: ${PortfolioData.location}
''',
        ),
        FileSystemNode(name: 'projects', isDirectory: true),
        FileSystemNode(name: 'skills', isDirectory: true),
        FileSystemNode(name: 'experience', isDirectory: true),
      ],
    ),
  };

  TerminalProvider() {
    _addWelcomeMessage();
  }

  void _addWelcomeMessage() {
    _history.add(
      TerminalCommand(
        input: '',
        output: '''
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║   Welcome to Pradeep Tharu's Portfolio Terminal v1.0     ║
║                                                           ║
║   Type 'help' to see available commands                  ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
''',
        timestamp: DateTime.now(),
      ),
    );
  }

  void executeCommand(String input) {
    final trimmedInput = input.trim();
    if (trimmedInput.isEmpty) return;

    final parts = trimmedInput.split(' ');
    final command = parts[0].toLowerCase();
    final args = parts.length > 1 ? parts.sublist(1) : <String>[];

    String output;

    switch (command) {
      case 'help':
        output = _helpCommand();
        break;
      case 'ls':
        output = _lsCommand(args);
        break;
      case 'cd':
        output = _cdCommand(args);
        break;
      case 'cat':
        output = _catCommand(args);
        break;
      case 'pwd':
        output = _pwdCommand();
        break;
      case 'whoami':
        output = _whoamiCommand();
        break;
      case 'projects':
        output = _projectsCommand();
        break;
      case 'skills':
        output = _skillsCommand();
        break;
      case 'experience':
        output = _experienceCommand();
        break;
      case 'contact':
        output = _contactCommand();
        break;
      case 'clear':
        _clearCommand();
        return;
      default:
        output =
            'Command not found: $command\nType \'help\' for available commands.';
    }

    _history.add(
      TerminalCommand(
        input: trimmedInput,
        output: output,
        timestamp: DateTime.now(),
      ),
    );

    inputController.clear();
    notifyListeners();
  }

  String _helpCommand() {
    return '''
Available Commands:
  help        - Show this help message
  ls          - List files and directories
  cd [dir]    - Change directory
  cat [file]  - Display file contents
  pwd         - Print working directory
  whoami      - Display information about me
  projects    - List all projects
  skills      - Display skills
  experience  - Show work experience
  contact     - Display contact information
  clear       - Clear terminal screen
''';
  }

  String _lsCommand(List<String> args) {
    final currentNode = _fileSystem[_currentDirectory];
    if (currentNode == null || !currentNode.isDirectory) {
      return 'Error: Not a directory';
    }

    if (currentNode.children == null || currentNode.children!.isEmpty) {
      if (_currentDirectory == '~/projects') {
        return PortfolioData.projects.map((p) => '${p.id}.txt').join('  ');
      }
      return 'Directory is empty';
    }

    return currentNode.children!
        .map((node) => node.isDirectory ? '${node.name}/' : node.name)
        .join('  ');
  }

  String _cdCommand(List<String> args) {
    if (args.isEmpty) {
      _currentDirectory = '~';
      notifyListeners();
      return '';
    }

    final target = args[0];
    if (target == '..') {
      if (_currentDirectory != '~') {
        _currentDirectory = '~';
        notifyListeners();
      }
      return '';
    }

    final newPath = _currentDirectory == '~'
        ? '~/$target'
        : '$_currentDirectory/$target';

    // Check if directory exists
    final validDirs = ['~', '~/projects', '~/skills', '~/experience'];
    if (validDirs.contains(newPath)) {
      _currentDirectory = newPath;
      notifyListeners();
      return '';
    }

    return 'cd: $target: No such directory';
  }

  String _pwdCommand() {
    return _currentDirectory;
  }

  String _whoamiCommand() {
    return '''
${PortfolioData.name}
${PortfolioData.title}
${PortfolioData.location}

${PortfolioData.summary}
''';
  }

  String _catCommand(List<String> args) {
    if (args.isEmpty) {
      return 'cat: missing file operand';
    }

    final filename = args[0];

    // Special handling for project files
    if (_currentDirectory == '~/projects' && filename.endsWith('.txt')) {
      final projectId = filename.replaceAll('.txt', '');
      final project = PortfolioData.projects.firstWhere(
        (p) => p.id == projectId,
        orElse: () => throw Exception('Project not found'),
      );

      return _formatProject(project);
    }

    // Regular file handling
    final currentNode = _fileSystem[_currentDirectory];
    if (currentNode?.children != null) {
      final file = currentNode!.children!.firstWhere(
        (node) => node.name == filename,
        orElse: () => const FileSystemNode(name: '', isDirectory: false),
      );

      if (file.name.isNotEmpty && !file.isDirectory) {
        return file.content ?? 'File is empty';
      }
    }

    return 'cat: $filename: No such file';
  }

  String _projectsCommand() {
    final buffer = StringBuffer();
    buffer.writeln('Projects:\n');

    for (var i = 0; i < PortfolioData.projects.length; i++) {
      final project = PortfolioData.projects[i];
      buffer.writeln('${i + 1}. ${project.name} [${project.type.displayName}]');
      buffer.writeln('   ${project.description}');
      if (project.playStoreUrl != null) {
        buffer.writeln('   Play Store: ${project.playStoreUrl}');
      }
      buffer.writeln('');
    }

    buffer.writeln(
      'Tip: Use "cd projects" and "cat <project-id>.txt" for details',
    );
    return buffer.toString();
  }

  String _formatProject(ProjectModel project) {
    final buffer = StringBuffer();
    buffer.writeln('═══════════════════════════════════════════════════════');
    buffer.writeln('  ${project.name}');
    buffer.writeln('═══════════════════════════════════════════════════════');
    buffer.writeln('');
    buffer.writeln('Type: ${project.type.displayName}');
    if (project.company != null) {
      buffer.writeln('Company: ${project.company}');
    }
    buffer.writeln('');
    buffer.writeln('Description:');
    buffer.writeln(project.longDescription ?? project.description);
    buffer.writeln('');
    buffer.writeln('Technologies:');
    buffer.writeln(project.technologies.join(', '));
    buffer.writeln('');
    if (project.playStoreUrl != null) {
      buffer.writeln('Play Store: ${project.playStoreUrl}');
    }
    if (project.githubUrl != null) {
      buffer.writeln('GitHub: ${project.githubUrl}');
    }
    return buffer.toString();
  }

  String _skillsCommand() {
    final buffer = StringBuffer();
    buffer.writeln('Skills:\n');

    final categories = <String, List<String>>{};
    for (var skill in PortfolioData.skills) {
      final category = skill.category.displayName;
      categories.putIfAbsent(category, () => []);
      final proficiencyBar = '█' * (skill.proficiency * 10).round();
      categories[category]!.add(
        '  ${skill.name.padRight(30)} $proficiencyBar ${(skill.proficiency * 100).toInt()}%',
      );
    }

    categories.forEach((category, skills) {
      buffer.writeln('$category:');
      for (var skill in skills) {
        buffer.writeln(skill);
      }
      buffer.writeln('');
    });

    return buffer.toString();
  }

  String _experienceCommand() {
    final buffer = StringBuffer();
    buffer.writeln('Work Experience:\n');

    for (var exp in PortfolioData.workExperience) {
      buffer.writeln(exp.title);
      buffer.writeln('${exp.company} - ${exp.location}');
      buffer.writeln(
        '${_formatDate(exp.startDate)} - ${exp.endDate != null ? _formatDate(exp.endDate!) : 'Present'}',
      );
      buffer.writeln('');
      for (var resp in exp.responsibilities) {
        buffer.writeln('  • $resp');
      }
      buffer.writeln('');
    }

    return buffer.toString();
  }

  String _contactCommand() {
    return '''
Contact Information:

Email:    ${PortfolioData.email}
Phone:    ${PortfolioData.phone}
LinkedIn: ${PortfolioData.linkedIn}
GitHub:   ${PortfolioData.github}
Location: ${PortfolioData.location}
''';
  }

  void _clearCommand() {
    _history.clear();
    _addWelcomeMessage();
    notifyListeners();
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  @override
  void dispose() {
    inputController.dispose();
    inputFocusNode.dispose();
    super.dispose();
  }
}
