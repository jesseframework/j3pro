// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RestApiService extends RestApiService {
  _$RestApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestApiService;

  @override
  Future<Response<dynamic>> login(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/TokenAuth/Authenticate');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> isTenantAvailable(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Account/IsTenantAvailable');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUser(int id) {
    final Uri $url = Uri.parse('/api/services/app/User/Get');
    final Map<String, dynamic> $params = <String, dynamic>{'id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUserHash(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/User/UpdateMobileHash');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> mobileAppLogger(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/MobileAppLogger/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPreference() {
    final Uri $url =
        Uri.parse('/api/services/app/Preference/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNonGlobalPreference() {
    final Uri $url = Uri.parse(
        '/api/services/app/NonGlobalPreference/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBusinessRule() {
    final Uri $url = Uri.parse(
        '/api/services/app/BusinessRule/GetAll?MaxResultCount=300000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getNonGlobalBusinessRule() {
    final Uri $url = Uri.parse(
        '/api/services/app/NonGlobalBusinessRule/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getMobileDesktop() {
    final Uri $url = Uri.parse(
        '/api/services/app/MobileDesktop/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createSalesOrder(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/SalesOrder/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllCustomer() {
    final Uri $url =
        Uri.parse('/api/services/app/Customer/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllCustomerById() {
    final Uri $url =
        Uri.parse('/api/services/app/Customer/Get?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllAddress() {
    final Uri $url =
        Uri.parse('/api/services/app/AddressBook/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllAddressByUser() {
    final Uri $url = Uri.parse(
        '/api/services/app/AddressBook/GetAllByUserId?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createCustomerInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Customer/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateCustomerInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Customer/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllJourney() {
    final Uri $url =
        Uri.parse('/api/services/app/Journey/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getJourneyPlanBySalesRep() {
    final Uri $url = Uri.parse(
        '/api/services/app/Journey/GetBySalesRep?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllItems() {
    final Uri $url =
        Uri.parse('/api/services/app/Item/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllIsalestax() {
    final Uri $url =
        Uri.parse('/api/services/app/SalesTax/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllCurrency() {
    final Uri $url =
        Uri.parse('/api/services/app/Currency/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllExchangeRate() {
    final Uri $url =
        Uri.parse('/api/services/app/ExchangeRate/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getItemById() {
    final Uri $url =
        Uri.parse('/api/services/app/Item/Get?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createItemInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Item/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateItemInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Item/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllItemGroup() {
    final Uri $url =
        Uri.parse('/api/services/app/ItemGroup/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getItemGroup() {
    final Uri $url =
        Uri.parse('/api/services/app/ItemGroup/Get?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createItemGroupInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/ItemGroup/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateItemGroupInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/ItemGroup/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllCategory() {
    final Uri $url =
        Uri.parse('/api/services/app/Category/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCategory() {
    final Uri $url =
        Uri.parse('/api/services/app/Category/Get?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createCategoryInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Category/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateCategoryInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Category/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPriceList() {
    final Uri $url =
        Uri.parse('/api/services/app/PriceList/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPriceList() {
    final Uri $url =
        Uri.parse('/api/services/app/PricingBundle/Get?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createPriceListInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/PricingMaster/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePriceListInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/PricingMaster/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPrices() {
    final Uri $url = Uri.parse(
        '/api/services/app/PricingMaster/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPrice() {
    final Uri $url = Uri.parse('/api/services/app/PricingMaster/Get');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createPriceInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/PriceList/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePriceInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/PriceList/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllPricingRule() {
    final Uri $url =
        Uri.parse('/api/services/app/PricingRule/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPricingRule() {
    final Uri $url = Uri.parse('/api/services/app/PricingRule/Get');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createPricingRuleInServer(
      Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/PricingRule/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updatePricingRuleInServer(
      Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/PricingRule/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllStockUOM() {
    final Uri $url =
        Uri.parse('/api/services/app/StockUOM/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getStockUOM() {
    final Uri $url = Uri.parse('/api/services/app/StockUOM/Get');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createStockUOMInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/StockUOM/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateStockUOMInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/StockUOM/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllUom() {
    final Uri $url =
        Uri.parse('/api/services/app/Uom/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUom() {
    final Uri $url = Uri.parse('/api/services/app/Uom/Get');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUomInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Uom/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUomInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/Uom/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllUpcCode() {
    final Uri $url =
        Uri.parse('/api/services/app/UpcCode/GetAll?MaxResultCount=30000');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUpcCode() {
    final Uri $url = Uri.parse('/api/services/app/UpcCode/Get');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUpcCodeInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/UpcCode/Create');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUpcCodeInServer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/services/app/UpcCode/Update');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sampleWithUrlAndQuery(
    String url,
    String page,
  ) {
    final Uri $url = Uri.parse('/api/${url}');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> sampleGet() {
    final Uri $url = Uri.parse('/api/get');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> register(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/api/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> logout() {
    final Uri $url = Uri.parse('/api/logout');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
