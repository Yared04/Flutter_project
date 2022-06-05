import 'package:flutter_test/flutter_test.dart';
import 'package:gada_ethiopia_mobile/domain/donation/models.dart';
import 'package:gada_ethiopia_mobile/infrastructure/donation/data_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'donation_repo_test.mocks.dart';
@GenerateMocks([],customMocks: [MockSpec<DonationDataProvider>(as: #MockDonationRepository)])
void main() {
  late MockDonationRepository mockDonationRepository;
  late DonationRepository donationRepository;
  setUp((){
    mockDonationRepository=MockDonationRepository();
    donationRepository=DonationRepository(dataProvider: mockDonationRepository);
  });
  
  final donation=Donation(donated_amount: 10000, user: 10, account_number:"1000012321", post: 23);
  test('if a donation is succesfuly created',(() async{
    //arrange
    when(mockDonationRepository.createDonation(donation)).thenAnswer((_)async=>donation);
    //act
     final obtain=await donationRepository.createDonation(donation);
    //assert
    expect(obtain, donation);
    
  }));

test('if a donation is not created and it throws an exception',(() {
    //arrange
    when(mockDonationRepository.createDonation(donation)).thenAnswer((_)async=>throw Exception('Failed to create Donation.'));
    //act
     final obtain= donationRepository.createDonation(donation);
    //assert
    expect(obtain, throwsException);
    
  }));

  test('if a donation is not created and it throws an exception',(() {
    //arrange
    when(mockDonationRepository.createDonation(donation)).thenAnswer((_)async=>throw Exception('Failed to create Donation.'));
    //act
     final obtain= donationRepository.createDonation(donation);
    //assert
    expect(obtain, throwsException);
    
  }));
final id=10;
  test('if a donation is not deleted and it throws an exception',(() {
    //arrange
    when(mockDonationRepository.deleteDonation(id)).thenAnswer((_)async=>throw Exception('deletion failed'));
    //act
     final obtain= donationRepository.deleteDonation(id);
    //assert
    expect(obtain, throwsException);
    
  }));

}