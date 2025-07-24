import 'package:web/web.dart' as web;

/// استخدم هذه الدالة في initState أو main
void guardBackNavigation({Function()? onBackAllowed}) {
  // نضيف الحالة الحالية إلى السجل
  web.window.history.pushState(null, '', web.window.location.href);

  // عند محاولة الرجوع
  web.window.onPopState.listen((event) {
    // نعيد المستخدم لنفس الصفحة
    web.window.history.pushState(null, '', web.window.location.href);

    // إذا كنت تريد السماح بالرجوع بعد تأكيد:
    if (onBackAllowed != null) {
      onBackAllowed();
    }
  });
}
