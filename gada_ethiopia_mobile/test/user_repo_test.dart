import 'package:flutter_test/flutter_test.dart';
import 'package:gada_ethiopia_mobile/domain/auth/user_model.dart';
import 'package:gada_ethiopia_mobile/infrastructure/auth/data_provider.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserDataProvider{}
void main() {
  final MockUserRepository mockUserRepository=MockUserRepository();
  final UserRepository userRepository=UserRepository(dataProvider: mockUserRepository);

  User user=User(first_name: 'Ayele', last_name: "bekele" , email: 'Ayele@gmail.com', password: 'Ayele1234');
  test("if user is created", () async {
    when(mockUserRepository.createUser(user)).thenAnswer((_) async=>user );
    expect(await userRepository.createUser(user), user);
  } );  

}