@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">


@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div role_name - {{ Session::get('role_id')}}</div> -->

@php
$user_role_id = Session::get('role_id');
@endphp

<div class="container">    
  <div class="row">

  <div class="col-lg-4 col-sm-4"> 
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">Sample</div>
            <div class="panel-body panel-class">

            <!-- customer sample start -->
                <a href="/dashboard/customerSample" class="panel-content"><span>Customer</span></a>
            <!-- customer sample end -->

            <!-- vendor sample start -->
                @if($user_role_id=='3' || $user_role_id=='7' || $user_role_id=='10' || $user_role_id=='11')
                    <a href="/dashboard/vendorSample" class="panel-content" style="margin-bottom: 12%"><span >Vendor</span></a>
                @else
                    <span class="panel-content" style="margin-bottom: 12%">Vendor</span>
                @endif
            <!-- vendor sample end     -->
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4">
        <div class="panel panel-default boxShadow">

            <div class="panel-heading panel-heading-class">Registartion</div>
            <div class="panel-body panel-class">

            <!-- customer registration start -->
                @if($user_role_id=='3' || $user_role_id=='5' || $user_role_id=='7')
                   <!--  <a href="/dashbaord/customerRegistration" class="panel-content"><span style="color: #c48d07;">Customer</span></a> -->
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Customer</span></a>
                @else
                    <span class="panel-content">Customer</span>
                @endif
            <!-- customer registration end     -->

            <!-- vendor registration start -->
                @if($user_role_id=='3' || $user_role_id=='7')
                   <!--  <a href="/dashbaord/vendorRegistration" class="panel-content"><span style="color: #c48d07;">Vendor</span></a> -->
                   <a href="#" class="panel-content"><span style="color: #c48d07;">Vendor</span></a> 

                @else
                    <span class="panel-content">Vendor</span>
                @endif
            <!-- vendor registration end -->

            <!-- user registration start -->
                @if($user_role_id=='3')
                    <a href="/dashbaord/erpUserRegistration"><span >User</span></a>
                @else
                    <span>User</span>
                @endif
            <!-- user registration end     -->
                
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4">
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">Dispatch</div>
            <div class="panel-body panel-class">
             
            <!-- dispatch service info section start -->
                @if($user_role_id=='3' || $user_role_id=='7' || $user_role_id=='12')
                    <a href="/dashboard/dispatchService" class="panel-content"><span>Dispatch Service</span></a>
                    <a href="/dashboard/dispatchInfo" class="panel-content" style="margin-bottom: 12%;"><span>Dispatch Info</span></a>
                @else
                    <span class="panel-content">Dispatch Service</span>
                    <span>Dispatch Info</span>
                @endif
            <!-- dispatch service info section end     -->
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4">
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">Stock</div>
            <div class="panel-body panel-class">
            
            <!-- product ,category , method section start here -->
                @if($user_role_id=='3' || $user_role_id=='11')
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Product</span></a>
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Category</span></a>
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Method</span></a>
                @else
                    <span class="panel-content">Product</span>
                    <span class="panel-content">Category</span>
                    <span class="panel-content">Method</span>
                @endif 
            <!-- product ,category , method section end here     -->

            <!-- product price and valid till section start here -->
                @if($user_role_id=='3')
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Price Range / Valid Till</span></a>
                @else
                    <span class="panel-content">Price Range / Valid Till</span>
                @endif
            <!-- product price and valid till section end here -->

            <!-- Add wish list section start here -->
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Wish List</span></a>
            <!-- Add wish list section end here   --> 
                
            <!-- stock, warehouse section start here -->
                @if($user_role_id=='3' || $user_role_id=='11')    
                    <a href="/dashboard/stockEntryInit" class="panel-content"><span>Stock Entry</span></a>
                    <a href="/dashboard/warehouseInit" class="panel-content"><span>Warehouse</span></a>
                @else
                    <span class="panel-content">Stock Entry</span>
                    <span class="panel-content">Warehouse</span>
                @endif
            <!-- stock, warehouse section end here     -->

            <!-- Material Requization Note (MRN) section start here -->
                @if($user_role_id=='3' || $user_role_id=='7'|| $user_role_id=='8' || $user_role_id=='10')
                    <a href="/dashboard/mrnInit" class="panel-content"><span>Material Requization Note (MRN)</span></a>
                @else
                    <span class="panel-content">Material Requization Note (MRN)</span>
                @endif
            <!-- Material Requization Note (MRN) section end here     -->

            <!-- Purchase Requization Note (PRN) section start here -->
                @if($user_role_id=='3' || $user_role_id=='13')
                    <a href="#" class="panel-content"><span style="color: #c48d07">Purchase Requization Note (PRN)</span></a>
                    <!-- <a href="/dashboard/prnInit" class="panel-content"><span>Purchase Requization Note (PRN)</span></a> -->
                @else
                    <span class="panel-content">Purchase Requization Note (PRN)</span>
                @endif
            <!-- Purchase Requization Note (PRN) section end here -->

            <!-- Goods Receipt Note (GRN - Material Receipt Note) section start here -->
                @if($user_role_id=='3' || $user_role_id=='11')
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Goods Receipt Note (GRN - Material Receipt Note)</span></a>
                @else
                    <span class="panel-content">Goods Receipt Note (GRN - Material Receipt Note)</span>
                @endif
            <!-- Goods Receipt Note (GRN - Material Receipt Note) section end here -->

            <!-- Stock Report section start here -->
                @if($user_role_id=='3' || $user_role_id=='7' || $user_role_id=='9' || $user_role_id=='11')
                    <a href="/dashboard/StockReport"><span>Stock Report</span></a>
                @else
                    <span class="panel-content">Stock Report</span>
                @endif
            <!-- Stock Report section end here     -->
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4"> 
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">Purcahse</div>
            <div class="panel-body panel-class">

            <!-- verify PRN,Qutation,approved vendor list section start here -->
                @if($user_role_id=='3' || $user_role_id=='13')
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Verify Purchase Requization Note (PRN)</span></a>
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Qutation</span></a>
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Supplier Quotation</span></a>
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Approved Vendor List</span></a>
                @else
                    <span class="panel-content">Verify Purchase Requization Note (PRN)</span>
                    <span class="panel-content">Qutation</span>
                    <span class="panel-content">Supplier Quotation</span>
                    <span class="panel-content">Approved Vendor List</span>
                @endif
            <!-- verify PRN,Qutation,approved vendor list section end here     -->

            <!-- purchase indent,purchase order,performa invoice section start here -->
                @if($user_role_id=='3' || $user_role_id=='7')
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Purchase Indent</span></a>
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Purchase Order (PO) Information</span></a>
                    <a href="#" class="panel-content" style="margin-bottom: 48%"><span style="color: #c48d07;">Performa Invoice</span></a>
                @else
                    <span class="panel-content">Purchase Indent</span>
                    <span class="panel-content">Purchase Order (PO) Information</span>
                    <span style="margin-bottom: 48%">Performa Invoice</span>
                @endif
            <!-- purchase indent,purchase order,performa invoice section end here     -->
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4"> 
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">Production</div>
            <div class="panel-body panel-class">

            <!-- Bill of Materials , Production planing details section start here -->
                @if($user_role_id=='3' || $user_role_id=='8')
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Bill of Materials (BOM)</span></a>
                    <a href="#" class="panel-content"><span style="color: #c48d07;">Production Plan Details</span></a>
                    <a href="/dashboard/customerSampleBMRList" class="panel-content" style="margin-bottom: 97%"><span>BMR Number</span></a>
                    <!-- <a href="#" class="panel-content" style="margin-bottom: 97%"><span>BMR Number</span></a> -->
                @else
                    <span class="panel-content">Bill of Materials (BOM)</span>
                    <span class="panel-content">Production Plan Details</span>
                    <span style="margin-bottom: 97%">BMR Number</span>
                @endif    
            <!-- Bill of Materials , Production planing details section end here     -->
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4"> 
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">Inquiry</div>
            <div class="panel-body panel-class">
            
            <!-- add inquiry section start -->

                <a href="#" class="panel-content" style="margin-bottom: 13%"><span style="color: #c48d07;">Inquiry</span></a>
            <!-- add inquiry section end     -->
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4"> 
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">QC</div>
            <div class="panel-body panel-class">

            <!-- QC section start here -->

                @if($user_role_id=='3' || $user_role_id=='10')
                    <a href="/dashboard/customerSampleQC" class="panel-content"  style="margin-bottom: 13%"><span>QC Details</span></a>
                @else
                    <span class="panel-content">QC Details</span>
                @endif   
            <!-- QC section end here      -->
            </div>
        </div>
    </div>

    <div class="col-lg-4 col-sm-4"> 
        <div class="panel panel-default boxShadow">
            <div class="panel-heading panel-heading-class">Contact Us</div>
            <div class="panel-body panel-class">

            <!-- contact us section start here     -->
                <a href="#" class="panel-content"><span style="color: #c48d07;">Feedback / Query</span></a>
                <a href="#"><span style="color: #c48d07;">Add Sugguestion</span></a>
            <!-- contact us section end here     -->
            </div>
        </div>
    </div>

  </div>
</div>

    
@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/custom/custom.js') }}"></script>

<!-- @extends('layout.dashboard_footer_layout')
@section('footer')
    @parent
@stop -->