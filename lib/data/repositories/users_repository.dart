import 'package:redux_sample/data/api/reqres_api_client.dart';
import 'package:redux_sample/data/models/user.dart';

class UsersRepository {
  UsersRepository(this._reqresApiClient);

  final ReqresApiClient _reqresApiClient;

  Future<List<User>> get users => _reqresApiClient.fetchUsers();
}
