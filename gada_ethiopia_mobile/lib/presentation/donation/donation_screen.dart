import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/widgets/custom.dart';

import '../../application/donation/donation.dart';
import 'screens.dart';

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DonationBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: DonationScafold()),
    );
  }
}

class DonationScafold extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final creditController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donate",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        // backgroundColor: Color.fromARGB(68, 255, 255, 255),
        // title: Text("ጋዳ"),
        // centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegete());
              },
              icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
            maxRadius: 20,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Container(
        color: Colors.lightBlue,
        width: 300,
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  alignment: AlignmentDirectional.topCenter,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/kids.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "this donation",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Credit card",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    controller: creditController,
                    decoration: InputDecoration(
                      labelText: 'Credit card no',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (String? creditCardNo) {
                      if (creditCardNo == null || creditCardNo.isEmpty) {
                        return "enter credit card number";
                      }
                      final creditCardTest = RegExp('[0-9]');
                      if (creditCardTest.hasMatch(creditCardNo) == false) {
                        return "credit card can only be digits";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Donation Amount",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    controller: amountController,
                    decoration: InputDecoration(
                        labelText: 'Amount',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        )),
                    validator: (String? amount) {
                      if (amount == null || amount.isEmpty) {
                        return "field is empty";
                      }
                      if (double.tryParse(amount) == null) {
                        return "amount must be number";
                      }
                      if (double.tryParse(amount)! < 10) {
                        return "donation amount must be atleast 10";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
                  child: BlocConsumer<DonationBloc, DonationStates>(
                    listenWhen: (p, c) {
                      return c is DonationSuccessfull;
                    },
                    listener: (_, DonationStates state) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Thankyou()),
                      );
                    },
                    builder: (_, DonationStates state) {
                      Widget buttonChild = const Text("Donate");

                      if (state is Donating) {
                        buttonChild = const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      if (state is DonationSuccessfull) {
                        buttonChild = const Text("Donation Successful");
                      }

                      if (state is DonationFailed) {
                        buttonChild = const Text("Donation failed retry");
                      }

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            primary: Colors.green),
                        onPressed: state is Donating
                            ? null
                            : () {
                                final formValid =
                                    formKey.currentState!.validate();
                                if (!formValid) return;

                                final authBloc =
                                    BlocProvider.of<DonationBloc>(context);
                                authBloc.add(
                                  Donate(creditController.text, 2, 3),
                                );
                              },
                        child: buttonChild,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
