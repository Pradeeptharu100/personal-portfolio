import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_style.dart';
import '../models/terminal_models.dart';
import '../providers/terminal_provider.dart';

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({super.key});

  @override
  State<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends State<TerminalScreen>
    with SingleTickerProviderStateMixin {
  late TerminalProvider _provider;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _provider = TerminalProvider();
    _provider.addListener(_scrollToBottom);

    // Auto-focus on mount and ensure persistent focus
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider.inputFocusNode.requestFocus();
    });

    // Ensure focus is maintained after keyboard interactions
    _provider.inputFocusNode.addListener(() {
      if (!_provider.inputFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 100), () {
          _provider.inputFocusNode.requestFocus();
        });
      }
    });
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
    _provider.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
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
              icon: const Icon(
                CupertinoIcons.home,
                color: AppColors.terminalText,
              ),
              onPressed: () => context.go(AppRoutes.homePath),
              tooltip: 'Home',
            ),
            IconButton(
              icon: const Icon(Icons.clear_all, color: AppColors.terminalText),
              onPressed: () => _provider.executeCommand('clear'),
              tooltip: 'Clear Terminal',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<TerminalProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () {
                      // Always refocus when tapping anywhere in terminal
                      provider.inputFocusNode.requestFocus();
                    },
                    child: Container(
                      color: Colors.black,
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(AppStyle.spacing16),
                        itemCount: provider.history.length,
                        itemBuilder: (context, index) {
                          final command = provider.history[index];
                          return _buildCommandOutput(command, provider);
                        },
                      ),
                    ),
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
    TerminalProvider provider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (command.input.isNotEmpty)
          Row(
            children: [
              Text(
                '${provider.currentDirectory} \$ ',
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
    return Consumer<TerminalProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(AppStyle.spacing16),
          decoration: const BoxDecoration(
            color: Colors.black,
            border: Border(
              top: BorderSide(color: AppColors.terminalText, width: 1),
            ),
          ),
          child: Row(
            children: [
              Text(
                '${provider.currentDirectory} \$ ',
                style: AppStyle.terminalPrompt,
              ),
              Expanded(
                child: TextField(
                  controller: provider.inputController,
                  focusNode: provider.inputFocusNode,
                  autofocus: true,
                  style: AppStyle.terminal,
                  minLines: 1,
                  maxLines: 1,
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type \'help\' for available commands...',
                    hintStyle: AppStyle.terminal.copyWith(
                      color: AppColors.terminalText.withOpacity(0.5),
                    ),
                    isDense: false,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: AppStyle.spacing8,
                      horizontal: 0,
                    ),
                  ),
                  onSubmitted: (value) {
                    provider.executeCommand(value);
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
