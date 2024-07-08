import 'dart:async';
import 'package:contact_manger/features/contact_list/domain/entity/contact_entity.dart';
import 'package:contact_manger/features/contact_list/domain/usecases/fetch_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController with StateMixin<List<Contact>> {
  final GetContacts getContacts;
  List<String> persianLetters = [
    'ا',
    'پ',
    'ت',
    'ث',
    'ج',
    'چ',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'ژ',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ک',
    'گ',
    'ل',
    'م',
    'ن',
    'و',
    'ه',
    'ی',
  ];

  ContactsController({required this.getContacts});

  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  List<Contact> sumContactQuery = [];

  ScrollController get scroll => _scrollController;
  double position = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchContacts(persianLetters.first);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          persianLetters.remove(persianLetters.first);
          persianLetters.reversed;
          position = sumContactQuery.length.toDouble();
          fetchContacts(persianLetters.first);
          jumpTo();

        }
      }
    });
  }

  void fetchContacts(String query) async {
    change(null, status: RxStatus.loading());
    final result = await getContacts(query);
    result.fold(
      (failure) =>
          change(null, status: RxStatus.error('Error fetching contacts')),
      (contacts) {
        sumContactQuery = sumContactQuery + contacts;
        change(sumContactQuery, status: RxStatus.success());
      },
    );
  }

  void jumpTo() {
    _scrollController.animateTo(position - 1,
        duration: const Duration(seconds: 1), curve: Curves.linear);
    change(sumContactQuery, status: RxStatus.success());
  }
}
