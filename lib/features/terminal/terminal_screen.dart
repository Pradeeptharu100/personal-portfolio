import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/app_colors.dart';
import '../themes/app_style.dart';
import 'terminal_controller.dart';
import 'terminal_models.dart';

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({super.key});

  @override
  State<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends State<TerminalScreen>
    with SingleTickerProviderStateMixin {
  late TerminalController _controller;
  final ScrollController _scrollController = ScrollController();
  late AnimationController _cursorController;
  bool _cursorVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = TerminalController();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _cursorController.addListener(() {
      setState(() {
        _cursorVisible = _cursorController.value > 0.5;
      });
    });

    _controller.addListener(_scrollToBottom);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _controller,
      child: Scaffold(
        backgroundColor: AppColors.terminalBackground,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDark,
          title: Row(
            children: [
              const Icon(Icons.terminal, color: AppColors.terminalText),
              const SizedBox(width: AppStyle.spacing8),
              Text(
                'Terminal',
                style: AppStyle.h6.copyWith(color: AppColors.terminalText),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: () => _controller.executeCommand('clear'),
              tooltip: 'Clear Terminal',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<TerminalController>(
                builder: (context, controller, child) {
                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(AppStyle.spacing16),
                    itemCount: controller.history.length,
                    itemBuilder: (context, index) {
                      final command = controller.history[index];
                      return _buildCommandOutput(command, controller);
                    },
                  );
                },
              ),
            ),
            _buildInputSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCommandOutput(
    TerminalCommand command,
    TerminalController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (command.input.isNotEmpty)
          Row(
            children: [
              Text(
                '${controller.currentDirectory} \$ ',
                style: AppStyle.terminalPrompt,
              ),
              Text(command.input, style: AppStyle.terminal),
            ],
          ),
        if (command.output.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: AppStyle.spacing8,
              bottom: AppStyle.spacing16,
            ),
            child: SelectableText(command.output, style: AppStyle.terminal),
          ),
      ],
    );
  }

  Widget _buildInputSection() {
    return Consumer<TerminalController>(
      builder: (context, controller, child) {
        return Container(
          padding: const EdgeInsets.all(AppStyle.spacing16),
          decoration: BoxDecoration(
            color: AppColors.backgroundDark,
            border: Border(
              top: BorderSide(color: AppColors.borderPrimary, width: 1),
            ),
          ),
          child: Row(
            children: [
              Text(
                '${controller.currentDirectory} \$ ',
                style: AppStyle.terminalPrompt,
              ),
              Expanded(
                child: TextField(
                  controller: controller.inputController,
                  autofocus: true,
                  style: AppStyle.terminal,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type a command...',
                    hintStyle: AppStyle.terminal.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    suffixIcon: _cursorVisible
                        ? Container(
                            width: 8,
                            height: 20,
                            color: AppColors.terminalCursor,
                          )
                        : null,
                  ),
                  onSubmitted: (value) {
                    controller.executeCommand(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
