import 'package:banking_system/features/search_account/logic/search_account_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/networking/api_result.dart';
import '../data/repo/search_account_repo.dart';


class SearchAccountCubit extends Cubit<SearchAccountState> {
  final SearchAccountRepo _repo;

  SearchAccountCubit(this._repo) : super(const SearchAccountState.initial());

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void searchAccount() async {

    emit(const SearchAccountState.loading());

    final response = await _repo.searchAccount(searchController.text.trim());

    response.when(
      success: (data) {
        emit(SearchAccountState.success(data));
      },
      failure: (error) {
        emit(SearchAccountState.error(error));
      },
    );
  }


  void clearSearch() {
    searchController.clear();

    emit(const SearchAccountState.initial());
  }
}