// ignore_for_file: non_constant_identifier_names

part of values;

class ImagePath {
  //images route
  static const String imageDir = "assets/images";
  static const String projectDir = "assets/images/project";
  // static const String screenshotsDir = "screenshots";

  //Images
  static const String DEV = "$imageDir/anand_subbu.png";

  static const String PLAYSTORE = "$imageDir/playstore.png";

  //Certifications
  static const String Board_Infinity_Cred = "$imageDir/bord_infinity.png";
  static const String Deep_learn = "$imageDir/deep_learning.jpg";
  static const String IBM_Data_Science = "$imageDir/data_science_spec.jpg";
  static const String Flutter_Cred = "$imageDir/Flutter_cred.png";

  // Project Images
  static const String ExpenceGenApp = "$projectDir/exp_gen/dash.jpg";
  static const String BILLING_APP = "$projectDir/billing_app/desktop/dash.png";
  static const String PAWN_APP = "$projectDir/pawn_shop/desktop/dash.png";
  static const String AppDirectApp = "$projectDir/app_direct/dash.jpg";
  static const String LEDGER_APP = "$projectDir/ledger_app/dash.jpg";
  static const String PRODUCT_CATALOG =
      "$projectDir/product_catalog/prod_detail.jpg";
  static const String PORTFOLIO_WEB = "$projectDir/exp_gen/dash.jpg";

  static List<String> Lst_ExpenceGenApp =
      ["dash.jpg", "module.jpg"].map((e) => '$projectDir/exp_gen/$e').toList();
  static List<String> Lst_AppDirectApp = [
    "dash.jpg",
    "drop.jpg",
    "pop.jpg",
    "share.jpg",
  ].map((e) => '$projectDir/app_direct/$e').toList();
  static List<String> Lst_LEDGER_APP = [
    "dash.jpg",
    "party_chq.jpg",
    "party_detail.jpg",
    "party_list.jpg",
    "party_trans.jpg",
  ].map((e) => '$projectDir/ledger_app/$e').toList();
  static List<String> Lst_PRODUCT_CATALOG = [
    "prod_list.jpg",
    "pdf_1.jpg",
    "pdf_2.jpg",
    "prod_detail.jpg",
    "pdf_3.jpg",
    "pdf_4.jpg",
    "pdf_5.jpg",
  ].map((e) => '$projectDir/product_catalog/$e').toList();
  static List<String> Lst_PAWN_APP = [
    "android/dash.jpg",
    "android/login.jpg",
    "android/parties.jpg",
    "android/profile.jpg",
    "android/report.jpg",
    "android/scheme.jpg",
    "android/tick_detail.jpg",
    "android/ticket.jpg",
    "android/tickets.jpg",
    "android/vou_details.jpg",
    "desktop/dash.png",
    "desktop/report.png",
    "desktop/ticker.png"
  ].map((e) => '$projectDir/pawn_shop/$e').toList();
  static List<String> Lst_BILLING_APP = [
    "desktop/app_login.png",
    "android/bill_batch.jpg",
    "android/inv_history.jpg",
    "android/order_details.jpg",
    "android/order_entry.jpg",
    "android/party_trans_enrty.jpg",
    "android/party_trans_history.jpg",
    "android/party_trans_history2.jpg",
    "android/prod_stock_req.jpg",
    "android/prod_stock_req.jpg",
    "android/product_group.jpg",
    "android/sale_note.jpg",
    "desktop/dash.png",
    "desktop/invoice_pdf.png",
    "desktop/entry_page.png",
    "desktop/party_trans.png",
    "desktop/report_dash.png",
    "desktop/product_report.png",
  ].map((e) => '$projectDir/billing_app/$e').toList();
}
