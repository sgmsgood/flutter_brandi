import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_search_jisulee/model/document.dart';
import 'package:flutter_search_jisulee/modules/home/controller_home.dart';

class ViewerPage extends StatelessWidget {
  Document document;

  ViewerPage({required this.document, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: document.imageUrl ?? '',
                fit: BoxFit.contain,
              ),
              _buildText('displaySitename', document.displaySitename),
              _buildText('dataTime', document.dataTime),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String textTitle, String? text) {
    return Visibility(
      visible: text?.isNotEmpty ?? false,
      child: Row(
        children: [
          Text(
            "$textTitle : ",
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
          Text(
            text ?? '',
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
