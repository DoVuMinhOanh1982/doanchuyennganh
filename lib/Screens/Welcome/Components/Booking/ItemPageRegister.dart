import 'package:doanchuyennganh/Models/BookingRegister.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/SpecialtyOption.dart';
import 'package:doanchuyennganh/Screens/prefixIcon.dart';
import 'package:doanchuyennganh/bloc/bookRegister/book_reg_bloc.dart';
import 'package:doanchuyennganh/widgets/BuildForm.dart';
import 'package:doanchuyennganh/widgets/birth_day.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/register_bloc/booking_bloc.dart';
import '../../../../widgets/doctors.dart';
import 'MapScreen.dart';

class ItemPage extends StatefulWidget {
  ItemPage({
    this.id_spec = 0,this.id_doc = 0,
    Key? key}) : super(key: key);
  int id_spec;
  int id_doc;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    final UserAuth = FirebaseAuth.instance.currentUser!;
    int i;
    int index_id;
    final dateController = DateTime.now();
    final timeController = TextEditingController();

    return BlocBuilder<BookingBloc,BookingState>(
      builder: (context,state) {
        if (state is UnLoadedBooking) {
          context.read<BookingBloc>().add(LoadBooking());
        }
        if (state is BookingLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is BookingLoaded) {
          return SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      //Address Hospital
                      Row(
                          children: <Widget>[
                            PrefixIcon(iconData: Icons.gps_fixed),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.0,
                                          color: Colors.grey)),
                                  SizedBox(height: 1),
                                  Text('Bệnh viện đa khoa Thủ Đức')
                                ],
                              ),
                              onTap: () {
                                //Google Map
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => GoogleMapScreen()));
                              },
                            )
                          ]
                      ),
                      SizedBox(height: 20.0),
                      //ID
                      Row(children: <Widget>[
                        PrefixIcon(
                            iconData: Icons.airline_seat_individual_suite),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("ID",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(index_id = 0;index_id<state.books.length;index_id++)
                              if(UserAuth.email == state.books[index_id].email)
                                Text(state.books[index_id].id)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //Name
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.drive_file_rename_outline),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].name)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //BirthDay
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.today),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('BirthDay',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].birthday.toDate().toLocal().toString().split(' ')[0])
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //Gender
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.person),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Gender',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].gender)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),
                      //Mobile
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.phone),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Mobile',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                    color: Colors.grey)),
                            SizedBox(height: 1),
                            for(i = 0;i<state.books.length;i++)
                              if(UserAuth.email == state.books[i].email)
                                Text(state.books[i].phone)
                          ],
                        )
                      ]),
                      SizedBox(height: 20.0),

                      //Specially
                      Row(children: <Widget>[
                        PrefixIcon(iconData: Icons.folder_special),
                        GestureDetector(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Specialty',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                      color: Colors.grey)),
                              SizedBox(height: 1),
                              Text(state.spec[widget.id_spec].spec_name)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SpecialtyOption(specialities: state.spec)));
                          },
                        )
                      ]),
                      SizedBox(height: 20.0),
                      //DayRegister
                      Doctors(
                          id_spec: widget.id_spec,
                          doctors: state.spec[widget.id_spec].list_doctors,
                          doctor_display: state.spec[widget.id_spec].list_doctors[widget.id_doc]),
                      SizedBox(height: 20.0),
                      BirthDay(
                        title: 'Medical Examination Register',
                          birthday: dateController,leftPos: 0),
                      SizedBox(height: 20),
                      BuildForm(
                          controller: timeController,
                          leftPos: -13,title: "Select Examination Time", text: "9:00 am", icondata: Icons.timelapse),
                      SizedBox(height: 20),
                      Center(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40),
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                            onPressed: () {
                              for(index_id = 0;index_id<state.books.length;index_id++)
                                if(UserAuth.email == state.books[index_id].email){
                                  var bookingReg = BookingRegister(
                                    id: state.books[index_id].id.toString(),
                                    date: dateController.toString(),
                                    time: timeController.value.text,
                                    spec: state.spec[widget.id_spec].spec_name.toString(),
                                    docName: state.spec[widget.id_spec].list_doctors[widget.id_doc].toString(),
                                  );
                                  setState(() {
                                    context.read<BookRegBloc>().add(AddBookingReg(bookingReg));
                                  });
                                }
                            },
                            child: Text("REGISTER", style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 2.2,
                                color: Colors.white
                            ),),
                          )
                      )
                    ],
                  ),
                ),
              ));
        }
        else {
          return Text("Something went wrong");
        }
      }
      );
  }
}

