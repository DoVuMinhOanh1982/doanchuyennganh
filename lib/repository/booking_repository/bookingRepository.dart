import 'package:doanchuyennganh/Models/Doctor.dart';
import 'package:doanchuyennganh/Models/Speciality.dart';
import 'package:doanchuyennganh/repository/booking_repository/base_booking_repository.dart';
import 'package:doanchuyennganh/services/BookingService/BookingService.dart';

import '../../Models/Booking.dart';
import '../../Models/BookingRegister.dart';

class BookingRepository extends BaseBookingRepository {
  BookingService service = BookingService();
  @override
  Future<List<Booking>> getAllBooking() async {
    return service.retrieveBookingData();
  }

  @override
  Future<List<Speciality>> getAllSpeciality() async {
    return service.retrieveSpecialityData();
  }

  @override
  Future<List<Doctor>> getAllDoctor() async {
    return service.retrieveDoctorData();
  }

  @override
  Future<List<BookingRegister>> getAllBookingRegister() async {
    return service.retrieveBookingRegData();
  }

  @override
  Future<void> addBookingUser(Booking book) async {
    return await service.addBookingUserData(book);
  }

  @override
  Future<void> addBookingRegister(BookingRegister bookReg) async {
    return await service.addBookingRegData(bookReg);
  }
  @override
  Future<void> updateBookingPhoneUser(Booking book,String phone) async{
    return await service.updatePhoneNumber(book,phone);
  }
}
