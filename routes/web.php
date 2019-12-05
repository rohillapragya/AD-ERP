<?php

//Route::get('/', function () {return view('welcome');});

// home page Route section start here

Route::get('/','Login@show');
Route::post('/doLogin','Login@doLogin');
Route::get('/forgotPassword','ForgotPassController@show');
Route::post('/changePassword','ForgotPassController@changepassword');
Route::get('/signoff','Login@signoff');
Route::get('login','Login@show')->name('login');
// home page route section end here


// dashboard Route section start here
Route::get('dashboard','Dashboard@show')->name('dashboard');
// dashboard route section end  here


// inquiry route section start
Route::get('/inquiry/init','Inquiry@index');
Route::post('/inquiry/addProductInCart','Inquiry@addProductInCart');
Route::get('/inquiry/getCartCount','Inquiry@getCartCount');
Route::get('/inquiry/proceedCart','Inquiry@proceedCart');
Route::post('/inquiry/save','Inquiry@save');
Route::get('/inquiry/{productId}/inactiveProductInCart','Inquiry@inactiveProductInCart');

Route::get('/inquiry/proceedCart','Inquiry@proceedCart')->name('/inquiry/proceedCart');

Route::get('/user/IsCompanyExits','UserRegistration@IsCompanyExits');
Route::get('/user/IsGSTNExits','UserRegistration@IsGSTNExits');
Route::get('/user/checkRole','Login@checkRole');
// inquiry route section  end


// Registration Route section start here
Route::get('/dashbaord/customerRegistration','UserRegistration@customer_index');
Route::get('/dashbaord/vendorRegistration','UserRegistration@vendor_index');
Route::get('/dashbaord/erpUserRegistration','UserRegistration@erp_user_index');
Route::get('/dashboard/addNewERPUser','UserRegistration@addNewERPUser');
Route::post('/erpuser/save','UserRegistration@save');
Route::get('/erpuser/edit/{erpUserID}','UserRegistration@show');
Route::post('/erpuser/update','UserRegistration@update');
Route::post('/erpUser/changeStatus','UserRegistration@changeERPUserStatus');

Route::get('/dashboard/addVendor','UserRegistration@addVendor');
Route::get('/user/userContactInformation','UserRegistration@getUserContactInformation');
Route::post('/dashboard/saveVendor','UserRegistration@saveVendor');

Route::get('/vendor/edit/{vendorId}','UserRegistration@showVendor');
Route::post('/dashboard/editVendor','UserRegistration@editVendor');


Route::get('/dashboard/addCustomer','UserRegistration@addCustomer');
Route::post('/dashboard/saveCustomer','UserRegistration@saveCustomer');
Route::get('/customer/edit/{customerId}','UserRegistration@showCustomer');
Route::post('/dashboard/editCustomer','UserRegistration@editCustomer');
// Registration route section end  here


// sample Route section start here
Route::get('/dashboard/customerSample','Sample@customerSampleIndex');
Route::get('/dashboard/vendorSample','Sample@vendorSampleIndex');
Route::post('/dashboard/saveSampleRequest','Sample@saveSampleRequest');
Route::get('/dashboard/addNewSample','Sample@addSample');
Route::get('/sample/customer/show/{sampleId}','Sample@showSample');
Route::post('/dashboard/editSampleRequest','Sample@editSampleRequest');
Route::get('/sample/customer/readyForDispatch/{sampleId}','Sample@ReadyForDispatch');
Route::post('/customer/sample/readyForDispatch','Sample@proceedForDispatch');


Route::get('/dashboard/customerSampleBMRList','Production@pendingBMRList');
Route::get('/sample/customer/BMRDetails/{sampleId}','Production@ReadyForBMR');
Route::post('/production/bmr','Production@saveBMR');


Route::get('/dashboard/customerSampleQC','QC@pendingQCDetailList');
Route::get('/sample/qc/QCDetails/{sampleId}','QC@ReadyForQCDetails');
Route::post('/qcDetails/qcSave','QC@saveQCDetails');
Route::post('/qcDetails/qcStockInfoSave','QC@qcStockInfoSave');


Route::get('/dashboard/addNewVendorSample','Sample@addVendorSample');
Route::post('/dashboard/saveVendorSampleRequest','Sample@saveVendorSample');
Route::get('/sample/vendor/show/{sampleId}','Sample@showVendorSample');
Route::post('/dashboard/editVendorSampleRequest','Sample@editVendorSample');
Route::get('/sample/vendor/saveVendorSample/{sampleId}','Sample@saveVendorSampleInformation');
Route::post('/vendor/sample/proceedVendorSampleTOStore','Sample@proceedVendorSampleTOStore');
// sample route section end  here


// dispatch Route section start here
Route::get('/dashboard/dispatchService','Dispatch@serviceIndex');
Route::get('/dashboard/addNewDistapchService','Dispatch@addNewService');
Route::post('/dispatch/saveService','Dispatch@saveService');
Route::get('/dispatch/service/edit/{serviceId}','Dispatch@showService');
Route::post('/dispatch/updateService','Dispatch@editService');
Route::post('/dispatch/add','Dispatch@addDisaptchInfo');


Route::get('/dashboard/dispatchInfo','Dispatch@dispatchInfoIndex');
Route::get('/dispatch/save/{sampleId}','Dispatch@saveDispatchInfo');

// dispatch route section end  here


// product Route section start here
Route::get('/product/productIndex','Product@productIndex');
Route::get('/product/addProduct','Product@addProduct');
Route::post('/product/saveProduct','Product@saveProduct');
Route::get('/product/edit/{productID}','Product@showProduct');
Route::post('/product/removeproductImage','Product@removeproductImage');
Route::post('/product/editProduct','Product@editProduct');
Route::post('/product/product/changeStatus','Product@editProductActiveStatus');
Route::get('/product/getProductByCategoryId','Product@getProductByCategoryId');


Route::get('/product/getProductList','Product@getProductList');
Route::get('/product/getMethodList','Product@getMethod');
Route::get('/product/uom','Product@getUOM');
Route::get('/product/categoryIndex','Product@categoryIndex');
Route::get('/product/addCategory','Product@addCategory');
Route::post('/product/saveCategory','Product@saveCategory');
Route::get('/product/category/edit/{categoryId}','Product@showCategory');
Route::post('/product/editCategory','Product@editCategory');
Route::post('/product/category/changeStatus','Product@editProductCategoryStatus');

Route::get('/product/methodIndex','Product@methodIndex');
Route::get('/product/addMethod','Product@addMethod');
Route::post('/product/saveMethod','Product@saveMethod');
Route::get('/product/method/edit/{methodId}','Product@showMethod');
Route::post('/product/editMethod','Product@editMethod');
Route::post('/product/method/changeStatus','Product@editProductMethodStatus');
// product route section end  here


// wish route section start here
Route::get('/wish/index','Wish_Master@index');
Route::get('/wish/add','Wish_Master@add');
Route::post('/wish/save','Wish_Master@save');
Route::get('wish/edit/{wishId}','Wish_Master@show');
Route::post('/wish/removeWishImage','Wish_Master@removeWishImage');
Route::post('/wish/edit','Wish_Master@edit');
Route::get('/wish/action/{wishId}','Wish_Master@action');

Route::get('/wish/{wishId}/proceedAsProduct','Wish_Master@proceedAsProduct');
Route::get('/wish/{wishId}/discardProduct','Wish_Master@discardProduct');
Route::post('/wish/proceedAs/product','Wish_Master@wishAddedAsProduct');
// wish route section start here

// warehouse route section start here

Route::get('/dashboard/warehouseInit','Warehouse@index');
Route::get('/dashboard/addNewWarehouse','Warehouse@addNew');
Route::get('/warehouse/getCityList','Warehouse@getCityList');
Route::get('/warehouse/getStateList','Warehouse@getStateList');
Route::get('/warehouse/gettingCityStateCountry','Warehouse@gettingCityStateCountry');
Route::post('/warehouse/save','Warehouse@save');
Route::get('/warehouse/edit/{warehouseId}','Warehouse@show');
Route::post('/warehouse/update','Warehouse@update');
Route::get('/warehouse/getWarehouseList','Warehouse@getWarehouseList');
// warehouse route section  end  here



// store route section start here

Route::get('/dashboard/stockEntryInit','Stock@index');
Route::get('/dashboard/addNewStockEntry','Stock@addNew');
Route::get('/stock/getStockEntryTypeDetails','Stock@getStockEntryTypeDetails');
Route::post('/stock/save','Stock@saveStock');
Route::get('/store/edit/{storeId}','Stock@show');
Route::post('/stock/update','Stock@update');
Route::get('/dashboard/StockReport','Stock@reportIndex');
Route::get('/stock/getStockByWarehouseId','Stock@getStockByWarehouseId');
Route::get('/stock/qc/QCDetails/{sampleId}','QC@StockReadyForQCDetails');
// store route section  end  here


// MRN route section start here
Route::get('/dashboard/mrnInit','MRN@index');
Route::get('/dashboard/addNewMRN','MRN@addNew');
Route::post('/mrn/save','MRN@saveMRN');
Route::get('/mrn/checkMRNRequestId','MRN@checkMRNRequestId');
Route::post('/mrn/addNewPurpose','MRN@addNewPurpose');
Route::get('/mrn/getPurposeList','MRN@getPurposeList');
Route::get('/mrn/{mrnID}/stockEntry','MRN@mrnStockEntry');
Route::get('/mrn/{mrnID}/prnEntry','MRN@prnEntry');
// MRN route section end here


// PRN route section start here
Route::get('/dashboard/prnInit','PRN@index');
Route::get('/dashboard/addNewPRN','PRN@addNew');
Route::post('/prn/save','PRN@savePRN');
Route::get('/prn/edit/{prnId}','PRN@show');
Route::post('/prn/update','PRN@update');
Route::get('/dashoard/prn/verify','PRN@showVerifyPRN');
Route::get('/prn/show/{prnId}','PRN@showPRN');
Route::post('/prn/verifyPRN','PRN@verifyPRN');
// PRN route section end here


// BOM route section start here
Route::get('/dashboard/BOM','BOM@index');
Route::get('/dashboard/addBom','BOM@addNew');
Route::post('/bom/save','BOM@save');
Route::get('/bom/edit/{bomID}','BOM@show');
Route::post('/bom/update','BOM@update');
Route::get('/production/checkBOM','BOM@checkBom');
Route::get('/bom/{bomId}/production','BOM@BomToProduction');
// BOM route section end here


// Production route section start here
Route::get('/dashboard/production','Production@index');
Route::get('/dashboard/addProduction','Production@addProduction');
Route::post('/production/save','Production@save');
Route::get('/production/edit/{productionId}','Production@show');
Route::post('/production/update','Production@update');
// Production route section start here


// Purchase route section start here
Route::get('/dashboard/pI','PurchaseIndent@index');
Route::get('/pi/inquiry/{inquiryId}','PurchaseIndent@showInquiryDetails');
Route::post('/pi/save','PurchaseIndent@save');
Route::get('/pi/{piID}/action','PurchaseIndent@action');
Route::post('/pi/action/save','PurchaseIndent@action_save');
Route::get('/pi/{piID}/SampleRequest','PurchaseIndent@pi_to_SampleRequest');
Route::post('/dashboard/pi_to_sample_save','PurchaseIndent@pi_to_sample_save');
// Purchase route section  end here


// quotation route section start here
Route::get('/dashoard/qutationInit','Quotation@index');
Route::get('/prn/{pID}/quotation/create','Quotation@add');
Route::post('/quotation/save','Quotation@save');
// quotation route section end here


// Route::get('/sendbasicemail','MailController@basic_email');
Route::get('/sendhtmlemail','MailController@html_email');
// Route::get('/sendattachmentemail','MailController@attachment_email');