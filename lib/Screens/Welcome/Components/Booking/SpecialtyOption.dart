import 'package:doanchuyennganh/Models/Speciality.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Booking/Register.dart';
import 'package:doanchuyennganh/widgets/SpecialtyTitle.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Notification/NotificationDetail.dart';
import 'package:flutter/material.dart';

class SpecialtyOption extends StatefulWidget {
  SpecialtyOption({
    required this.specialities,
    Key? key}) : super(key: key);
  List<Speciality> specialities;
  @override
  State<SpecialtyOption> createState() => _SpecialtyOptionState();
}

class _SpecialtyOptionState extends State<SpecialtyOption> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Speciatly",),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              return RegisterPage();
            }));
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.white,),
        ),
      ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index){
            return SpeciatlyTitle(
              image: 'assets/images/icon.png',
              title: widget.specialities[index].spec_name,
              enable: true,
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage())),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: widget.specialities.length),
    );
  }
}
