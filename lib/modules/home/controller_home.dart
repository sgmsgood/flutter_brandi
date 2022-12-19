import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_search_jisulee/model/document.dart';
import 'package:flutter_search_jisulee/model/search.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  StreamController ctrl = StreamController();
  final ScrollController scrollController = ScrollController();

  static HomeController get to => Get.find();

  Timer? _debounce;

  final _searchKeyword = ''.obs;

  final RxList<Document> _resultList = <Document>[].obs;

  List<Document> get resultList => _resultList;

  final _scrollPosition = 0.0.obs;

  var page = 1;

  final _isSearchEnd = false.obs;

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(() async {
      _setCurrentScrollPosition();
      await _addSearchData();
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    _debounce?.cancel();
  }

  void _setCurrentScrollPosition() {
    _scrollPosition.value = scrollController.offset;
  }

  Future<void> _addSearchData() async {
    var isScrollEnd =
        scrollController.position.atEdge && scrollController.offset > 0;

    if (isScrollEnd && !_isSearchEnd.value) {
      page++;
      await _getJSONData(_searchKeyword.value, page);
    }
  }

  Future<void> _getJSONData(String searchKeyword, int? page) async {
    var restApiKey = 'fb67490caaed04a43294f788e264bd63';
    var size = 30;

    try {
      var url =
          'https://dapi.kakao.com/v2/search/image?query=$searchKeyword&size=$size&page=${page ?? 1}';
      var response = await http.get(Uri.parse(url),
          headers: {"Authorization": "KakaoAK $restApiKey"});

      var search = Search.fromJson(jsonDecode(response.body));
      _isSearchEnd.value = search.meta?.isEnd ?? true;

      _addResultList(search);
    } catch (e) {
      log("-----------error: $e");
    }
  }

  _addResultList(Search search) {
    for (var element in search.documents) {
      _resultList.add(element);
    }
  }

  searchKeyword(String keyword) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if (_searchKeyword.value != keyword) {
        clearResultList();
      }

      if (keyword.length < 2 || keyword.length > 10) {
        return;
      }

      _searchKeyword.value = keyword;
      FocusManager.instance.primaryFocus?.unfocus();
      await _getJSONData(_searchKeyword.value, 1);
    });
  }

  void clearResultList() {
    _resultList.clear();
  }

  String? validateKeyword(String? keyword) {
    if (keyword == null || keyword.isEmpty) {
      return null;
    }

    if (keyword.length < 2 || keyword.length > 10) {
      return '검색어는 2~10자 내외입니다.';
    }

    return null;
  }
}
