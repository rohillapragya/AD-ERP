@extends('layout.dashboard_header_layout')

<link rel="stylesheet" href="{{ asset('css/Home/dashboard.css') }}">

@section('dashboard-home')
    @parent
@stop

@section('content')

<!-- <div>session div cart_id - {{ Session::get('cart_id')}}</div> -->

@php
    $user_role_id = Session::get('role_id');

    $user_id = Session::get('UID');
@endphp
<div class="container">  
  <div class="row">
    <div class="col-sm-12"> 
      <a href="/Index" class="btn btn-primary btn-lg" style="float: right;margin-bottom: 2%;"> <span>Dashboard</span></a>
    </div>
  </div>

  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() 
    {
      var data = google.visualization.arrayToDataTable([
        ['Website', 'Natura ERP)'],
        ['SAMPLE', 1], 
        ['INQUIRY', 1], 
        ['WISH', 1], 

        // ['DISPATCH', 1],
        // ['MRN', 1], 
        // ['BMR', 1],
        // ['QC', 1]
      ]);

      var options = {
        // title: 'Indian Language Use',
        legend: 'none',
        pieSliceText: 'label',
        is3D: true,
        // slices: {  4: {offset: 0.2},
        //   12: {offset: 0.3},
        //   14: {offset: 0.4},
        //   15: {offset: 0.5},
        // },
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      function selectHandler() 
      {
        var selectedItem = chart.getSelection()[0];
        if (selectedItem) 
        {
          var topping = data.getValue(selectedItem.row, 0);
          //alert('The user selected ' + topping);

          /*selecting the module type start here. */
          var type = document.getElementById("type");
          type.value=topping;
          /*selecting the module type end here. */

          /*from date,to date, type should be visible start here. */
          var moduleChartDiv = document.getElementById("moduleChartDiv");
          moduleChartDiv.style.display="block";
          /*from date,to date, type should be visible end here. */
        }
      }
      google.visualization.events.addListener(chart, 'select', selectHandler);
      chart.draw(data, options);
    }
  </script>
 
  <div id="piechart" style="width: 900px; height: 500px;"></div>

  <div id="moduleChartDiv" class="moduleChartDiv" style="display: none;">
    <div class="form-group row">

      <div class="col-sm-4">
          <span>From</span>
          <div class="col-sm-12">
              <div class="day-month-yaer-class">
                  <select class="form-control date-class" id="fromDateDay">
                      @for ($i = 1; $i <= 31; $i++)
                          <option  value={{ $i}}>{{ $i}}</option>
                      @endfor
                  </select>
                  <select class="form-control date-class" id="fromDateMonth">
                      <option value="01">Jan</option> 
                      <option value="02">Feb</option>
                      <option value="03">Mar</option>
                      <option value="04">Apr</option>
                      <option value="05">May</option>
                      <option value="06">Jun</option>
                      <option value="07">Jul</option>
                      <option value="08">Aug</option>
                      <option value="09">Sep</option>
                      <option value="10">Oct</option>
                      <option value="11">Nov</option>
                      <option value="12">Dec</option>
                  </select>
                  <select class="form-control date-class" id="fromDateYear">
                      @for ($i = 2019; $i <= 2022; $i++)
                         <option  value={{ $i}}>{{ $i}}</option>
                      @endfor
                  </select>
              </div> 
          </div>
      </div>


      <div class="col-sm-4">
        <span>To</span> 
        <div class="col-sm-12">
            <div class="day-month-yaer-class">
                <select class="form-control date-class" id="toDateDay">
                    @for ($i = 1; $i <= 31; $i++)
                        <option  value={{ $i}}>{{ $i}}</option>
                    @endfor
                </select>
                <select class="form-control date-class" id="toDateMonth">
                    <option value="01">Jan</option> 
                    <option value="02">Feb</option>
                    <option value="03">Mar</option>
                    <option value="04">Apr</option>
                    <option value="05">May</option>
                    <option value="06">Jun</option>
                    <option value="07">Jul</option>
                    <option value="08">Aug</option>
                    <option value="09">Sep</option>
                    <option value="10">Oct</option>
                    <option value="11">Nov</option>
                    <option value="12">Dec</option>
                </select>
                <select class="form-control date-class" id="toDateYear">
                    @for ($i = 2019; $i <= 2022; $i++)
                       <option  value={{ $i}}>{{ $i}}</option>
                    @endfor
                </select>
            </div> 
        </div>
      </div>


      <div class="col-sm-2">
        <span>Type</span>
          <div class="col-sm-12">
            <select class="form-control" id="type">
              <option  value="SAMPLE">SAMPLE</option>
              <option  value="INQUIRY">INQUIRY</option>
             <!--  <option  value="DISPATCH">DISPATCH</option> -->
              <option  value="WISH">WISH</option>
            </select>
        </div>
      </div>

      <div class="col-sm-2">
          <button type="button" class="btn btn-primary btn-lg" style="padding: 10%;" onclick="onclickSearch()">Search</button>
      </div>
      
    </div>
  </div>

  <br>

  <div class="container box-shadow" id="chartOutput" style="display: none;box-shadow: 0px 0px 0px #DDD;padding: 2%;">
      
  </div>

</div>
@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="{{ asset('js/chart/chartOutput.js') }}"></script>