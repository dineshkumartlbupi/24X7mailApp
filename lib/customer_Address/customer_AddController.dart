import 'package:get/get.dart';
import 'package:twentyfourby_seven/Service/api.dart';
import 'package:twentyfourby_seven/models/statementModell.dart';

class CustomerAddController extends GetxController {
  Rx<StatementModell> statement = StatementModell().obs;
  @override
  void onInit() {
    getStatementDetails();
    super.onInit();
  }

  Future<void> getStatementDetails() async {
    statement.value = (await getStatementApi() ?? statement.value);
  }
}
