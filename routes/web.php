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


// Registration Route section start here
Route::get('/dashbaord/customerRegistration','UserRegistration@index');
Route::get('/dashbaord/vendorRegistration','UserRegistration@vendor_index');
Route::get('/dashbaord/erpUserRegistration','UserRegistration@erp_user_index');
Route::get('/dashboard/addNewERPUser','UserRegistration@addNewERPUser');
Route::post('/erpuser/save','UserRegistration@save');
Route::get('/erpuser/edit/{erpUserID}','UserRegistration@show');
Route::post('/erpuser/update','UserRegistration@update');
Route::post('/erpUser/changeStatus','UserRegistration@changeERPUserStatus');
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
Route::get('/product/getProductList','Product@getProductList');
Route::get('/product/getMethodList','Product@getMethod');
Route::get('/product/uom','Product@getUOM');
// product route section end  here


// warehouse route section start here

Route::get('/dashboard/warehouseInit','Warehouse@index');
Route::get('/dashboard/addNewWarehouse','Warehouse@addNew');
Route::get('/warehouse/getCityList','Warehouse@getCityList');
Route::post('/warehouse/save','Warehouse@save');
Route::get('/warehouse/edit/{warehouseId}','Warehouse@show');
Route::post('/warehouse/update','Warehouse@update');
// warehouse route section  end  here



// store route section start here

Route::get('/dashboard/stockEntryInit','Stock@index');
Route::get('/dashboard/addNewStockEntry','Stock@addNew');
Route::get('/stock/getStockEntryTypeDetails','Stock@getStockEntryTypeDetails');
Route::post('/stock/save','Stock@saveStock');
Route::get('/store/edit/{warehouseId}','Stock@show');
Route::post('/stock/update','Stock@update');
Route::get('/dashboard/StockReport','Stock@reportIndex');
Route::get('/stock/getStockByWarehouseId','Stock@getStockByWarehouseId');
// store route section  end  here


// MRN route section start here
Route::get('/dashboard/mrnInit','MRN@index');
Route::get('/dashboard/addNewMRN','MRN@addNew');
Route::post('/mrn/save','MRN@saveMRN');
Route::get('/mrn/checkMRNRequestId','MRN@checkMRNRequestId');
Route::post('/mrn/addNewPurpose','MRN@addNewPurpose');
Route::get('/mrn/getPurposeList','MRN@getPurposeList');
Route::get('/mrn/{mrnID}/stockEntry','MRN@mrnStockEntry');
// MRN route section end here


// PRN route section start here
Route::get('/dashboard/prnInit','PRN@index');
Route::get('/dashboard/addNewPRN','PRN@addNew');
// PRN route section end here


// Route::get('/sendbasicemail','MailController@basic_email');
// Route::get('/sendhtmlemail','MailController@html_email');
// Route::get('/sendattachmentemail','MailController@attachment_email');