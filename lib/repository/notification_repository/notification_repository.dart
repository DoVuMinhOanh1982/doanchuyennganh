import 'package:doanchuyennganh/Models/Notification.dart';
import 'package:doanchuyennganh/repository/notification_repository/base_notification_repository.dart';
import 'package:doanchuyennganh/services/NotificationService/notification_service.dart';

class NotificationRepository extends BaseNotificationRepository{
  NotificationService service = NotificationService();
  @override
  Future<List<NotificationModel>> getNotificationData() async{
    return await service.retrieveNotificationData();
  }
   @override
  Future<void> addNotification(NotificationModel notification) async {
    return await service.addNotificationData(notification);
  }
  @override
  Future<void> updateConfirmNotification(NotificationModel notification) async{
    return await service.updateNotificationConfirm(notification);
  }
}