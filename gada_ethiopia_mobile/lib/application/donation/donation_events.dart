

class DonationEvents{}

class Donate extends DonationEvents{
  String CreditCardNumber;
  int DonationAmout;
  int UserId;

  Donate(this.CreditCardNumber,this.DonationAmout,this.UserId);
}