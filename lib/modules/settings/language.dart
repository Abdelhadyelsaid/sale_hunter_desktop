import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class Language extends ChangeNotifier {
  String _lang  ;

  getLanguage() {
    return _lang;
  }

  setLanguage(String language) {
    _lang = language;
    notifyListeners();
  }

  ThemeData _themeData;
  ThemeData light= ThemeData.light().copyWith(
    primaryColor: Colors.white,

  );



  ThemeData dark= ThemeData.dark().copyWith(
    primaryColor: Colors.black,


  );

  Language(this._themeData
      );
  getTheme (){
    return _themeData;
  }
  setTheme(ThemeData theme){
    _themeData= theme;
    notifyListeners();
  }



  ///User Profile translated Strings
  String tSettings() {
    if (getLanguage() == 'ar') {
      return ("الاعدادات");
    } else  {
      return "Settings";
    }
  }

  String tdesSignUp() {
    if (getLanguage() == 'ar') {
      return ("قم بالتسجيل لفتح الميزات الرائعة!");
    } else  {
      return "Sign up to unlock the great features!";
    }
  }
  String twelSign() {
    if (getLanguage() == 'ar') {
      return ("مرحبًا بعودتك!");
    } else  {
      return "Welcome Back!";
    }
  }
  String tpropage() {
    if (getLanguage() == 'ar') {
      return ("المنتج");
    } else  {
      return "Product Page";
    }
  }
  String trecom() {
    if (getLanguage() == 'ar') {
      return ("المقترحات");
    } else  {
      return "Recommendations";
    }
  }
  String trecomdes() {
    if (getLanguage() == 'ar') {
      return ("يوصي المنتجات للمستخدم بناءً على البحث السابق.");
    } else  {
      return "Recommend products to the user based on previous search.";
    }
  }
  String tAboutUs() {
    if (getLanguage() == 'ar') {
      return ("حول");
    } else  {
      return "About Us";
    }
  }
  String tWho() {
    if (getLanguage() == 'ar') {
      return (" ~ من نكون ");
    } else  {
      return "~ Who we are";
    }
  }
  String tServices() {
    if (getLanguage() == 'ar') {
      return (" الخدمات ");
    } else  {
      return "Our Services";
    }
  }
  String tWhoDes() {
    if (getLanguage() == 'ar') {
      return (" نظرًا لأن العالم يميل إلى استخدام التكنولوجيا في جميع جوانب الحياة ، فإننا نقدم محرك بحث يسهل العثور على أفضل سعر والمقارنة بين المنتجات على تطبيق Android للجوال وسطح المكتب والموقع الإلكتروني. حيث سنقوم بجلب المنتجات من مواقع التجارة الإلكترونية مثل Amazon و Jumia بالإضافة إلى المتاجر المسجلة التي تستخدم منصتنا لاستضافة صفحة متجرهم ومنتجاتهم لإعطاء أفضل الأسعار للمستخدم بمعلومات تساعد المستخدم في العثور على أفضل الصفقات وتوافر المنتجات في أقرب المتاجر ");
    } else  {
      return "As the world tends to use technology in all parts of life, we provide search engine that facilitate finding the best price and comparison between products on mobile Android application, Desktop and website. Where we will fetch the products from ecommerce websites like Amazon and Jumia plus the registered stores that use our platform to host their store page and products to give the optimal prices to the user with info that helps user to find the best deals & products availability in nearest stores ";
    }
  }
  String tdesSignin() {
    if (getLanguage() == 'ar') {
      return ("قم بتسجيل الدخول إلى حسابك");
    } else  {
      return "Sign in your account";
    }
  }
  String tdelPro() {
    if (getLanguage() == 'ar') {
      return ("حذف المنتج");
    } else  {
      return "Delete product";
    }
  }
  String tDelete() {
    if (getLanguage() == 'ar') {
      return " حذف المتجر";
    } else {
      return "Delete store";
    }
  }
  String tLanguage() {
    if (getLanguage() == 'ar') {
      return "اللغة";
    } else {
      return "Language";
    }
  }

  String tApper() {
    if (getLanguage() == 'ar') {
      return "الظهور";
    }  else {
      return "Appearance";
    }
  }

  String tDarkMode() {
    if (getLanguage() == 'ar') {
      return "اسود";
    } else  {
      return "Dark ";
    }
  }

  String tLightkMode() {
    if (getLanguage() == 'ar') {
      return "ابيض";
    } else  {
      return "Light ";
    }
  }

  String tReceiveNotifications() {
    if (getLanguage() == 'ar') {
      return " الإشعارات";
    } else {
      return " Notifications";
    }
  }

  String tNotificationsDescr() {
    if (getLanguage() == 'ar') {
      return " احصل على إشعار عند انخفض السعر";
    } else {
      return " Get notified when price dropped";
    }
  }

  String tCountry() {
    if (getLanguage() == 'ar') {
      return " البلد";
    } else {
      return "Country";
    }
  }

  String tEnglish() {
    if (getLanguage() == 'ar') {
      return "الانجليزيه";
    } else  {
      return "English ";
    }
  }

  String tArabic() {
    if (getLanguage() == 'ar') {
      return "العربيه";
    } else  {
      return "Arabic ";
    }
  }

  String tChangePass() {
    if (getLanguage() == 'ar') {
      return "تغيير كلمة المرور";
    } else {
      return "Change Password ";
    }
  }

  String tOldPass() {
    if (getLanguage() == 'ar') {
      return "كلمة المرور القديمة";
    } else  {
      return "Old Password";
    }
  }

  String tNewPass() {
    if (getLanguage() == 'ar') {
      return "كلمة المرور الجديده";
    } else {
      return "New Password";
    }
  }

  String tConfPass() {
    if (getLanguage() == 'ar') {
      return "تأكيد كلمة المرور ";
    } else  {
      return "Confirm Password";
    }
  }

  String tPass() {
    if (getLanguage() == 'ar') {
      return "كلمة المرور";
    } else  {
      return " Password";
    }
  }

  String tProfile() {
    if (getLanguage() == 'ar') {
      return "الملف الشخصي";
    } else {
      return "Profile";
    }
  }

  String tUserName() {
    if (getLanguage() == 'ar') {
      return "اسم المستخدم";
    } else {
      return "UserName";
    }
  }

  String tEmail() {
    if (getLanguage() == 'ar') {
      return "البريد الالكتروني";
    } else {
      return "Email";
    }
  }

  String tStores() {
    if (getLanguage() == 'ar') {
      return "المتاجر";
    } else  {
      return "Stores";
    }
  }

  String tAddStore() {
    if (getLanguage() == 'ar') {
      return "اضافة متجر";
    } else {
      return "Add Store";
    }
  }

  String tCreateStore() {
    if (getLanguage() == 'ar') {
      return "أنشئ متجر";
    } else  {
      return "Create Store";
    }
  }
  String tUpdateStore() {
    if (getLanguage() == 'ar') {
      return "حفظ";
    } else  {
      return "Save";
    }
  }

  String tStoreDesc() {
    if (getLanguage() == 'ar') {
      return "وفر تكاليف إنشاء موقع للمحلات التجارية ، حيث يمكن للبائع إضافة منتجاته إلى صفحة المتجر ونتائج البحث مجانًا";
    } else  {
      return "Save the costs of creating website for shops,as seller can add his products to store page and search results for free";
    }
  }

  String tFacebookLink() {
    if (getLanguage() == 'ar') {
      return "لينك الفيسبوك";
    } else{
      return "Facebook Link";
    }
  }
  String tInstagarmLink() {
    if (getLanguage() == 'ar') {
      return "لينك الإنستجرام";
    } else{
      return "Instagram Link";
    }
  }
  String tWebsiteLink() {
    if (getLanguage() == 'ar') {
      return "لينك موقعك";
    } else{
      return "Website link";
    }
  }
  String tStoreName() {
    if (getLanguage() == 'ar') {
      return "اسم المتجر";
    } else{
      return "Store Name";
    }
  }
  String tSale() {
    if (getLanguage() == 'ar') {
      return "الخصم";
    } else{
      return "Sale";
    }
  }
  String taddress() {
    if (getLanguage() == 'ar') {
      return "العنوان";
    } else{
      return "Address";
    }
  }
  String tStoreType() {
    if (getLanguage() == 'ar') {
      return "نوع المتجر";
    } else{
      return "Store Type";
    }
  }
  String tCategoryEn() {
    if (getLanguage() == 'ar') {
      return "النوع بالانجليزية ";
    } else{
      return "Category EN";
    }
  }
  String tCategoryAr() {
    if (getLanguage() == 'ar') {
      return "النوع بالعربية ";
    } else{
      return "Category AR";
    }
  }
  String tStatus() {
    if (getLanguage() == 'ar') {
      return "الوصف";
    } else {
      return "Status";
    }
  }

  String tPhone() {
    if (getLanguage() == 'ar') {
      return "رقم الهاتف";
    } else {
      return "Phone Number";
    }
  }
  String tWhatsapp() {
    if (getLanguage() == 'ar') {
      return "رقم الواتساب";
    } else {
      return "Whatsapp Number";
    }
  }


  String tLocation() {
    if (getLanguage() == 'ar') {
      return "الموقع";
    } else  {
      return "Location";
    }
  }

  String tDesc() {
    if (getLanguage() == 'ar') {
      return "الوصف";
    } else  {
      return "Description";
    }
  }

  String tMyStore() {
    if (getLanguage() == 'ar') {
      return "المتجر";
    } else {
      return "My Store";
    }
  }
  String tChooselocation() {
    if (getLanguage() == 'ar') {
      return "أختر مكانك";
    } else  {
      return "Choose your location";
    }
  }
  String tDashBoard() {
    if (getLanguage() == 'ar') {
      return "لوحة التحكم";
    } else {
      return "Dashboard";
    }
  }

  String tHelp() {
    if (getLanguage() == 'ar') {
      return "المساعدة";
    } else {
      return "Help";
    }
  }

  String tSignOut() {
    if (getLanguage() == 'ar') {
      return "تسجيل الخروج";
    } else  {
      return "SignOut";
    }
  }

  String tSignIn() {
    if (getLanguage() == 'ar') {
      return "تسجيل الدخول";
    } else  {
      return "Sign In";
    }
  }

  String tRemember() {
    if (getLanguage() == 'ar') {
      return " تتذكرني";
    } else {
      return "Remember Me";
    }
  }

  String tForgetPass() {
    if (getLanguage() == 'ar') {
      return "نسيت كلمة المرور؟";
    } else {
      return "Forget Password ?";
    }
  }

  String tSignInText() {
    if (getLanguage() == 'ar') {
      return "لا تمتلك حساب؟";
    } else {
      return "Don't have an account?";
    }
  }

  String tSignUp() {
    if (getLanguage() == 'ar') {
      return "أنشاء حساب";
    } else {
      return "Sign Up";
    }
  }

  String tHaveAcc() {
    if (getLanguage() == 'ar') {
      return "لدي حساب";
    } else  {
      return "Already have an account";
    }
  }

  String tForget() {
    if (getLanguage() == 'ar') {
      return "نسيت كلمة المرور";
    } else {
      return "Forget Password ";
    }
  }

  String tForgetDesc() {
    if (getLanguage() == 'ar') {
      return "سيتم إرسال رمز التحقق إلى بريدك الإلكتروني ، يرجى التحقق منه!";
    } else {
      return "The verification code will be sent to your Email, please check it!";
    }
  }

  String tSendCode() {
    if (getLanguage() == 'ar') {
      return "ارسال الكود";
    } else  {
      return "Send Code ";
    }
  }

  String tVerCode() {
    if (getLanguage() == 'ar') {
      return "كود التحقق";
    } else  {
      return "Verification Code ";
    }
  }

  String tVerDesc() {
    if (getLanguage() == 'ar') {
      return "الرجاء إدخال الرمز الذي أرسلناه إليك خلال الدقائق العشر القادمة.";
    } else {
      return "Please Enter the code we sent to you within the next 10 minutes.";
    }
  }

  String tSendCodeAgain() {
    if (getLanguage() == 'ar') {
      return "ارسال الكود مره اخري خلال";
    } else  {
      return "Send Code again in";
    }
  }

  String tVerify() {
    if (getLanguage() == 'ar') {
      return " التحقق";
    } else {
      return "Verify ";
    }
  }

  String tReSendCode() {
    if (getLanguage() == 'ar') {
      return " اعادة ارسال الكود";
    } else  {
      return "Resend Code ";
    }
  }

  String tSendCodeDesc() {
    if (getLanguage() == 'ar') {
      return "ألم تحصل على الكود؟";
    } else  {
      return "Didn't get the code? ";
    }
  }

  String tResetPass() {
    if (getLanguage() == 'ar') {
      return "إعادة تعيين كلمة المرور";
    } else  {
      return "Reset Password ";
    }
  }

  String tResetPassDesc() {
    if (getLanguage() == 'ar') {
      return "يرجى تعيين كلمة مرور جديدة لحسابك.";
    } else {
      return "Please set a new password for your account.";
    }
  }

  String tAddProduct() {
    if (getLanguage() == 'ar') {
      return "أضافة منتج";
    } else {
      return "Add Product";
    }
  }

  String tBasicInfo() {
    if (getLanguage() == 'ar') {
      return "المعلومات الاساسيه";
    } else {
      return "Basic Information";
    }
  }
  String tFillInfo() {
    if (getLanguage() == 'ar') {
      return "املأ جميع المعلومات بالاسفل ";
    } else {
      return "Fill all information below";
    }
  }

  String tProductNameEn() {
    if (getLanguage() == 'ar') {
      return "  اسم المنتج بالانجليزية";
    } else {
      return "Product Name EN";
    }
  }
  String tProductNameAr() {
    if (getLanguage() == 'ar') {
      return "  اسم المنتج بالعربية";
    } else {
      return "Product Name AR";
    }
  }

  String tPrice() {
    if (getLanguage() == 'ar') {
      return "السعر";
    } else {
      return "Price";
    }
  }
  String tNext() {
    if (getLanguage() == 'ar') {
      return "التالي";
    } else {
      return "Next";
    }
  }

  String tPrevious() {
    if (getLanguage() == 'ar') {
      return "السابق";
    } else {
      return "Previous";
    }
  }

  String tBaseI() {
    if (getLanguage() == 'ar') {
      return "المعلومات الاساسيه";
    } else {
      return "BASIC INFO";
    }
  }

  String tPROIMG() {
    if (getLanguage() == 'ar') {
      return "صورة المنتج ";
    } else {
      return "PRODUCT IMG";
    }
  }

  String tProimg() {
    if (getLanguage() == 'ar') {
      return "صور المنتج ";
    } else {
      return "Product images";
    }
  }

  String tUploadimg() {
    if (getLanguage() == 'ar') {
      return "تحميل صورة المنتج ";
    } else {
      return "Upload product image";
    }
  }

  String tUploadFiles() {
    if (getLanguage() == 'ar') {
      return "تحميل الملفات ";
    } else {
      return "Upload Files";
    }
  }

  String tMETADATA() {
    if (getLanguage() == 'ar') {
      return "بيانات وصفيه";
    } else {
      return "META DATA";
    }
  }

  String tMetaData() {
    if (getLanguage() == 'ar') {
      return "بيانات وصفيه";
    } else {
      return "Meta data";
    }
  }

  String tBrand() {
    if (getLanguage() == 'ar') {
      return "الماركه";
    } else {
      return "Brand";
    }
  }
  String tMetaKeywords() {
    if (getLanguage() == 'ar') {
      return "كلمات وصفية";
    } else {
      return "Meta keywords";
    }
  }
  String tProductDesEn() {
    if (getLanguage() == 'ar') {
      return "وصف المنتج بالانجليزيه";
    } else {
      return "Product description EN ";
    }
  }
  String tProductDesAr() {
    if (getLanguage() == 'ar') {
      return "وصف المنتج بالعربيه";
    } else {
      return "Product description AR ";
    }
  }
  String tSave() {
    if (getLanguage() == 'ar') {
      return "حفظ";
    } else {
      return "Save";
    }
  }
  String tCancel() {
    if (getLanguage() == 'ar') {
      return "ألغاء";
    } else {
      return "Cancel";
    }
  }

  String tAddress() {
    if (getLanguage() == 'ar') {
      return "العنوان";
    } else {
      return "Address";
    }
  }
  String tCreateDes() {
    if (getLanguage() == 'ar') {
      return "يسمح للبائعين بإنشاء صفحة متجر مستضافة مجانية.";
    } else {
      return "Allows sellers to create free hosted store page.";
    }
  }
  String tpricetracker() {
    if (getLanguage() == 'ar') {
      return "تعقب السعر";
    } else {
      return "Price Tracker";
    }
  }
  String tpricetrackerdes() {
    if (getLanguage() == 'ar') {
      return "يعرض العناصر التي شهدت تغيرات كبيرة في الأسعار في وقت واحد";
    } else {
      return "Shows the items that got big price changes in a time";
    }
  }
  String tmap() {
    if (getLanguage() == 'ar') {
      return "أقرب المتاجر";
    } else {
      return "Nearest Stores";
    }
  }
  String tmapdes() {
    if (getLanguage() == 'ar') {
      return "توضح الخريطة أقرب المتاجر التي بها المنتجات المتاحة.";
    } else {
      return "The map shows the nearest stores have the available products.";
    }
  }
  String tQuick() {
    if (getLanguage() == 'ar') {
      return "دعم سريع لعملائنا";
    } else {
      return "Quick Support For Our Customers";
    }
  }
  String tQuickdes() {
    if (getLanguage() == 'ar') {
      return "يدور متجرنا حول معالجة أسئلة العملاء ، ويمكننا توظيف وكلاء خدمة العملاء لضمان الاهتمام المناسب باتصالات العملاء عبر قنوات متعددة";
    } else {
      return "our store revolves around addressing customers’ questions, we can hiring customer service agents to ensure proper attention is paid to your customer communications across multiple channel";
    }
  }
  String tinstall() {
    if (getLanguage() == 'ar') {
      return "قم بزيارة أو تثبيت تطبيقنا الآن!";
    } else {
      return "Visit or Install Our Application Now!";
    }
  }
  String tOurTeam() {
    if (getLanguage() == 'ar') {
      return "فريق العمل";
    } else {
      return "Our Team";
    }
  }


}



