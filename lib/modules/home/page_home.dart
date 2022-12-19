import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_search_jisulee/modules/home/controller_home.dart';
import 'package:flutter_search_jisulee/modules/viewer/page_viewer.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: _buildSearchBar()),
            Expanded(flex: 9, child: _buildSearchResultList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      alignment: Alignment.center,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        decoration: _buildTextFieldDecoration(),
        onChanged: controller.searchKeyword,
        validator: controller.validateKeyword,
      ),
    );
  }

  InputDecoration _buildTextFieldDecoration() {
    return InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Colors.blue, width: 0.5.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Colors.grey, width: 0.5.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Colors.redAccent, width: 0.5.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          borderSide: BorderSide(color: Colors.redAccent, width: 0.5.w),
        ),
        suffixIcon: const Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
        hintText: '검색어를 입력하세요.');
  }

  Widget _buildSearchResultList() {
    return Obx(() =>
        controller.resultList.isEmpty ? _buildEmpty() : _buildResultList());
  }

  Widget _buildEmpty() {
    return Center(
      child: Text(
        '검색 결과가 없습니다.',
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }

  Widget _buildResultList() {
    return GridView.builder(
      controller: controller.scrollController,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () =>
              Get.to(ViewerPage(document: controller.resultList[index])),
          child: CachedNetworkImage(
              imageUrl: controller.resultList[index].imageUrl ?? '',
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: controller.resultList.length,
    );
  }
}
