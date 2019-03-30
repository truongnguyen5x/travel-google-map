@extends('user.layouts.app_user')
@section('css')
    <link rel="stylesheet" href="{{asset('css/map.css')}}">
@endsection
@section('mapjs')
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdtVaJjFLyHdn0kTk9pF8upC4nNiLlqgM" type="text/javascript"></script>
<script src="{{asset('js/ContextMenu.js')}}" type="text/javascript"></script>
<script src="{{asset('js/deleteMarker.js')}}"></script>
<script src="{{asset('js/recalculateRoute.js')}}"></script>
<script src="{{asset('js/showInfo.js')}}"></script>
<script src="{{asset('js/addWayPointToRoute.js')}}" type="text/javascript"></script>
<script type="text/javascript">
    var directionsService;
    var directionsRenderer;
    var map;

    function initialize() {
        var position = new google.maps.LatLng({{$trip->wayPoints[0]->lat}}, {{$trip->wayPoints[0]->lng}});

        directionsService = new google.maps.DirectionsService();
        directionsRenderer = new google.maps.DirectionsRenderer();
        map = new google.maps.Map($('#map')[0], {
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            center: position
        });


        directionsRenderer.setMap(map);

        drawAgain();


    }


    var locations = [
        @foreach($trip->wayPoints as $item)
        [{{ $item->id }}, {{$item->lat}}, {{$item->lng}}],
        @endforeach
        [{{ $item->id }}, {{$trip->wayPoints[0]->lat}}, {{$trip->wayPoints[0]->lng}}]];
    var markers = [];
    var polylines = [];
    var isFirst = true;

   

    

    function drawAgain() {
        //addFirstWayPoint(new google.maps.LatLng(locations[0][1], locations[0][2]));
        var request = {
            origin: new google.maps.LatLng(locations[0][1], locations[0][2]),
            destination: new google.maps.LatLng(locations[0][1], locations[0][2]),
            travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
        directionsService.route(request, function(response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                var marker = new google.maps.Marker({
                    position: response.routes[0].legs[0].start_location,
                    map: map,
                    draggable: false,
                    icon: new google.maps.MarkerImage(
                        'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
                    )
                });
                marker.arrayIndex = 0;
                markers.push(marker);
                showInfo(marker);
            }
        });
        isFirst = false;
        for (var i = 0; i < locations.length - 1; i++) {
            var request = {
                origin: new google.maps.LatLng(locations[i][1], locations[i][2]),
                destination: new google.maps.LatLng(locations[i + 1][1], locations[i + 1][2]),
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            directionsService.route(request, function(response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    var marker = new google.maps.Marker({
                        position: response.routes[0].legs[0].end_location,
                        map: map,
                        draggable: false,
                    });
                    markers.push(marker);
                    showInfo(marker);
                    marker.arrayIndex = markers.length - 1;


                    var polyline = new google.maps.Polyline();
                    var path = response.routes[0].overview_path;
                    for (var x in path) {
                        polyline.getPath().push(path[x]);
                    }
                    polyline.setMap(map);
                    polylines.push(polyline);


                }
            });
        }




    }

    // function add_the_middle_waypoint(){

    // }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>

@endsection
@section('content')

<div class="container">
    <div class="row">


        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <br/>
                    <br/>
                    @if ($errors->any())
                    <ul class="alert alert-danger">
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                    @endif

                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Edit Trip In Map <small>Sessions</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="">Settings 1</a>
                                                </li>
                                                <li><a href="">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                {!! Form::model($trip, [
                                    'method' => 'PATCH',
                                    'url' => ['user/trip/'.$trip->id],
                                    'class' => 'form-horizontal',
                                    'files' => true
                                ]) !!}
                                {{ csrf_field() }}
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                            <h3>Tên chuyến đi:</h3>
                                            <input type="text" class="form-control" name="name" value="{{$trip->name}}">
                                            <br>
                                    </div>
                                    <h3 class="col-md-4">Ảnh cover: </h3>
                                    <h3 class="col-md-8">Map: </h3>
                                    <div class="col-md-4 col-sm-12">

                                            @if($trip->image_url)
                                            <img src="{{asset($trip->image_url)}}" id="logo-img" onclick="document.getElementById('add-new-logo').click();" style="width:100%; height:300px;"> @else
                                            <img src="{{asset('image/no-image.jpg')}}" id="logo-img" onclick="document.getElementById('add-new-logo').click();" style="width:100%; height:300px;"> @endif

                                            <input class="form-control" type="file" style="display: none" id="add-new-logo" name="file" accept="image/*" onchange="addNewLogo(this)" />

                                            <br>
                                    </div>
                                    {{--<div class="col-md-12 col-sm-12">
                                        <img src="{{asset($trip->image_url)}}" style="width:100%" alt="Ảnh Cover">
                                    </div> --}}

                                    <div id="map" class="col-md-8 col-sm-12">
                                    </div>

                                    {{-- <a id="cretrip" class="btn btn-app">
                                        <i class="fa fa-plus"></i> Create Trip
                                    </a> --}}
                                    <div class="col-md-12">
                                        <br>
                                        <br>

                                    </div>

                                    <div class="col-md-12 col-sm-12">
                                        <table id="listwp" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>

                                                    <th>Điểm Xuất Phát</th>
                                                    <th>Thời gian xuất phát</th>
                                                    <th>Điểm đến</th>
                                                    <th>Thời gian tới</th>
                                                    <th>Phương tiện</th>
                                                    <th>Hoạt Động</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                @for($i = 0; $i < count($trip->wayPoints)-1; $i++)
                                                    @if($trip->wayPoints[$i]->action == 'moving')
                                                        <tr>
                                                            <td>{{ $trip->wayPoints[$i]->address }}</td>
                                                            <td>
                                                                <div class='input-group date datetimepicker'>

                                                                    <input name="leave_time{{$i}}" value="{{ $trip->wayPoints[$i]->leave_time }}" type='text' class="form-control" />

                                                                    <span class="input-group-addon">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                            <td>{{ $trip->wayPoints[$i+1]->address }}</td>
                                                            <td>
                                                                <div class='input-group date datetimepicker'>

                                                                    <input name="arrival_time{{$i+1}}" value="{{ $trip->wayPoints[$i+1]->arrival_time }}" type='text' class="form-control" />

                                                                    <span class="input-group-addon">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </span>
                                                                </div>
                                                            </td>

                                                            <td>{{ $trip->wayPoints[$i]->vehicle }}</td>
                                                            <td>
                                                                <select name="action{{$i}}" class="selectpicker action" data-width="fit">
                                                                        <option value="moving" selected="selected">moving</option>
                                                                        <option value="activity">activity</option>
                                                                </select>

                                                            </td>
                                                        </tr>
                                                    @else
                                                        <tr>
                                                            <td>{{ $trip->wayPoints[$i]->address }}</td>
                                                            <td> ---------- </td>
                                                            <td> ---------- </td>
                                                            <td> ---------- </td>
                                                            <td> ---------- </td>
                                                            <td>
                                                                <select name="action{{$i}}" class="selectpicker action" data-width="fit">
                                                                    <option value="moving">moving</option>
                                                                    <option value="activity" selected="selected">activity</option>

                                                                </select>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>{{ $trip->wayPoints[$i]->address }}</td>
                                                            <td>
                                                                <div class='input-group date datetimepicker'>

                                                                    <input name="leave_time{{$i}}" value="{{ $trip->wayPoints[$i]->leave_time }}" type='text' class="form-control" />

                                                                    <span class="input-group-addon">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                            <td>{{ $trip->wayPoints[$i+1]->address }}</td>
                                                            <td>
                                                                <div class='input-group date datetimepicker'>

                                                                    <input name="arrival_time{{$i+1}}" value="{{ $trip->wayPoints[$i+1]->arrival_time }}" type='text' class="form-control" />

                                                                    <span class="input-group-addon">
                                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                                    </span>
                                                                </div>
                                                            </td>

                                                            <td>{{ $trip->wayPoints[$i]->vehicle }}</td>
                                                            <td>
                                                                <select class="selectpicker action" data-width="fit" disabled>
                                                                        <option value="moving" selected="selected">moving</option>
                                                                        <option value="activity">activity</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                    @endif

                                                @endfor
                                            @if($trip->wayPoints[count($trip->wayPoints)-1]->action == 'moving')
                                                <tr>
                                                    <td>{{ $trip->wayPoints[count($trip->wayPoints)-1]->address }}</td>
                                                    <td>
                                                        <div class='input-group date datetimepicker'>

                                                            <input name="leave_time{{count($trip->wayPoints)-1}}" value="{{ $trip->wayPoints[count($trip->wayPoints)-1]->leave_time }}" type='text' class="form-control" />

                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>{{ $trip->wayPoints[0]->address }}</td>
                                                    <td>
                                                        <div class='input-group date datetimepicker'>

                                                            <input name="arrival_time{{0}}" value="{{ $trip->wayPoints[0]->arrival_time }}" type='text' class="form-control" />

                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </td>

                                                    <td>{{ $trip->wayPoints[count($trip->wayPoints)-1]->vehicle }}</td>
                                                    <td>
                                                        <select name="action{{count($trip->wayPoints)-1}}" class="selectpicker action" data-width="fit">

                                                                <option value="moving" selected="selected">moving</option>
                                                                <option value="activity">activity</option>


                                                        </select>

                                                    </td>
                                                </tr>
                                            @else
                                                <tr>
                                                    <td>{{ $trip->wayPoints[count($trip->wayPoints)-1]->address }}</td>
                                                    <td> ---------- </td>
                                                    <td> ---------- </td>
                                                    <td> ---------- </td>
                                                    <td> ---------- </td>
                                                    <td>
                                                        <select name="action{{count($trip->wayPoints)-1}}" class="selectpicker action" data-width="fit">
                                                            <option value="moving">moving</option>
                                                            <option value="activity" selected="selected">activity</option>

                                                        </select>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>{{ $trip->wayPoints[count($trip->wayPoints)-1]->address }}</td>
                                                    <td>
                                                        <div class='input-group date datetimepicker'>

                                                            <input name="leave_time{{count($trip->wayPoints)-1}}" value="{{ $trip->wayPoints[count($trip->wayPoints)-1]->leave_time }}" type='text' class="form-control" />

                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>{{ $trip->wayPoints[0]->address }}</td>
                                                    <td>
                                                        <div class='input-group date datetimepicker'>

                                                            <input name="arrival_time{{0}}" value="{{ $trip->wayPoints[0]->arrival_time }}" type='text' class="form-control" />

                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td>{{ $trip->wayPoints[count($trip->wayPoints)-1]->vehicle }}</td>
                                                    <td>
                                                        <select class="selectpicker action" data-width="fit" disabled>


                                                                <option value="moving" selected="selected">moving</option>
                                                                <option value="activity">activity</option>

                                                        </select>

                                                    </td>
                                                </tr>
                                            @endif
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <a href="{{url('user/trip/edit-waypoint/'.$trip->id)}}"><input type="button" class="btn btn-warning" style="float:right" value="Sửa các điểm đến"></a>
                                <button style="float:right" class="btn btn-success" type="submit">Ghi nhận</button>
                                {!! Form::close() !!}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
@endsection

@section('js')
<script type="text/javascript">
    
    function createTable() {
        var i = 0;
        while (i < markers.length) {

            (function(i) {
                setTimeout(function() {
                    var geocoderr = new google.maps.Geocoder;
                    results = null;
                    geocoderr.geocode({
                        'location': markers[i].position
                    }, function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            $('#listwp > tbody:last-child').append(
                                '<tr>' + // need to change closing tag to an opening `<tr>` tag.
                                '<td name="order_num' + i + '">' + (i + 1) + '<input type="hidden" name="order_num' + i + '" value="' + i + '">' + '</td>' +
                                '<td>' + results[0].geometry.location.lat() + '<input type="hidden" name="lat' + i + '" value="' + results[0].geometry.location.lat() + '">' + '</td>' +
                                '<td name="lng' + i + '">' + results[0].geometry.location.lng() + '<input type="hidden" name="lng' + i + '" value="' + results[0].geometry.location.lng() + '">' + '</td>' +
                                '<td name="address' + i + '">' + results[0].formatted_address + '<input type="hidden" name="address' + i + '" value="' + results[0].formatted_address + '">' + '</td>' +
                                '</tr>');
                        } else {
                            console.log('query limited');
                        }
                    });
                }, 3000 * i);
            })(i);
            i++;

        }
        setTimeout(function() {
            $("#submit").removeAttr("disabled");
        }, 3000 * markers.length);


    }
</script>

<script type="text/javascript">
    $( document ).ready(function() {
        $(document).on('click', '.datetimepicker', function() {
                 $(this).datetimepicker({widgetPositioning:{
                               horizontal: 'auto',
                               vertical: 'bottom'
                           },
                           format:'YYYY-MM-DD HH:mm:00'
               });
            });
        $(document).on('change', '.action', function() {

                if($(this).val() == 'moving') {

                    $(this).closest("tr").next("tr").find("td:eq(5) select").removeAttr('disabled');
                    var name = $(this).closest("tr").find("td:eq(5) select").attr('name');
                    $(this).closest("tr").next("tr").find("td:eq(5) select").attr("name", name);
                    $(this).closest("tr").next("tr").find('.selectpicker').selectpicker('refresh');

                    $(this).closest("tr").remove();

                    //$(this).closest("tr").next().find('.actionopen').removeAttr("disabled");
                } else if ($(this).val() == 'activity') {
                    //prev().after("<tr><td>new row</td></tr>")
                    var address1 = $(this).closest("tr").find("td:eq(0)").text();
                    var leave_time = $(this).closest("tr").find("td:eq(1)").html();
                    var address2 = $(this).closest("tr").find("td:eq(2)").text();
                    var arrival_time = $(this).closest("tr").find("td:eq(3)").html();
                    var vehicle = $(this).closest("tr").find("td:eq(4)").text();
                    $(this).closest("tr").find("td:eq(1)").text('----------');
                    $(this).closest("tr").find("td:eq(2)").text('----------');
                    $(this).closest("tr").find("td:eq(3)").text('----------');
                    $(this).closest("tr").find("td:eq(4)").text('----------');
                    $(this).closest("tr").after(
                        function() {
                            return '<tr><td>'+address1+'</td><td>'+leave_time+'</td><td>'+address2+'</td><td>'+arrival_time+'</td><td>'+vehicle+'</td><td><select class="selectpicker action" data-width="fit" disabled><option value="moving" selected="selected">moving</option><option value="activity">activity</option></select></td></tr>';
                        }
                    );

                    $(this).closest("tr").next("tr").find('.selectpicker').selectpicker('refresh');
                }



        });

    });
</script>
<script src="{{asset('js/changeImage.js')}}"></script>
@endsection
