import 'package:dio/dio.dart';
import 'package:find_me/core/api/api.dart';
import 'package:find_me/core/error/faliures.dart';
import 'package:find_me/feature/contacts/data/model/contacts_model.dart';
import 'package:find_me/feature/contacts/data/model/search_model.dart';

class ContactsRemoteDataSource {
  API api = API();

  Future<ContactModel> fetchContactsData({required String userID}) async {
    try {
      final Response response = await api.sendRequest.get(
        "/follow/read/following/$userID",
      );
      final status = await hanldeStatusCode(response);
      if (status.status) {
        ContactModel data = ContactModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<SearchModel> search(
      {required String query, String fields = "userName"}) async {
    try {
      final Response response =
          await api.sendRequest.get("/user/search?q=$query&fields=$fields");
      final status = await hanldeStatusCode(response);
      if (status.status) {
        SearchModel data = SearchModel.fromJson(response.data);
        return data;
      } else {
        throw status.failure!;
      }
    } catch (error) {
      rethrow;
    }
  }
}
