import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();
  final QuillController _controller = () {
    return QuillController.basic(
      config: QuillControllerConfig(
        clipboardConfig: QuillClipboardConfig(enableExternalRichPaste: true),
      ),
    );
  }();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Title',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Expanded(
              child: QuillEditor(
                focusNode: _editorFocusNode,
                scrollController: _editorScrollController,
                controller: _controller,
                config: QuillEditorConfig(
                  placeholder: 'Start writing your notes...',
                  padding: const EdgeInsets.all(16),
                  embedBuilders: [
                    ...FlutterQuillEmbeds.editorBuilders(
                      imageEmbedConfig: QuillEditorImageEmbedConfig(
                        imageProviderBuilder: (context, imageUrl) {
                          if (imageUrl.startsWith('assets/')) {
                            return AssetImage(imageUrl);
                          }
                          return null;
                        },
                      ),
                      videoEmbedConfig: QuillEditorVideoEmbedConfig(
                        customVideoBuilder: (videoUrl, readOnly) {
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            QuillSimpleToolbar(
              controller: _controller,
              config: QuillSimpleToolbarConfig(
                embedButtons: FlutterQuillEmbeds.toolbarButtons(),
                showClipboardPaste: true,
                showQuote: false,
                showUnderLineButton: false,
                showStrikeThrough: false,
                showCodeBlock: false,
                showInlineCode: false,
                showIndent: false,
                showLink: false,
                showSubscript: false,
                showSuperscript: false,
                buttonOptions: QuillSimpleToolbarButtonOptions(
                  base: QuillToolbarBaseButtonOptions(
                    afterButtonPressed: () {
                      final isDesktop = {
                        TargetPlatform.linux,
                        TargetPlatform.windows,
                        TargetPlatform.macOS,
                      }.contains(defaultTargetPlatform);
                      if (isDesktop) {
                        _editorFocusNode.requestFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
