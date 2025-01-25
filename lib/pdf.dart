import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'dart:math';


class PDFViewerWeb extends StatelessWidget {
  const PDFViewerWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Event List'),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: PdfViewer.openAsset(
              'assets/Document.pdf',
                params: PdfViewerParams(
          layoutPages: (viewSize, pages) {
            List<Rect> rect = [];
            final viewWidth = viewSize.width;
            final viewHeight = viewSize.height;
            final maxHeight = pages.fold<double>(0.0, (maxHeight, page) => max(maxHeight, page.height));
            final ratio = viewHeight / maxHeight;
            var top = 0.0;
            for (var page in pages) {
              final width = page.width * ratio;
              final height = page.height * ratio;
              final left = viewWidth > viewHeight ? (viewWidth / 2) - (width / 2) : 0.0;
              rect.add(Rect.fromLTWH(left, top, width, height));
              top += height + 8 /* padding */;
            }
            return rect;
          },
        ),
            ),
          ),
        ));
  }
}
