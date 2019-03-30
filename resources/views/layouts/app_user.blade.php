
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!-- Meta, title, CSS, favicons, etc. -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  	<link rel="icon" href="{{ URL::asset('gentelella_master/production/images/favicon.ico') }}" type="image/ico" />

      <title>User Travel </title>
      <!-- Bootstrap -->
      <link href="{{ URL::asset('gentelella_master/vendors/bootstrap/dist/css/bootstrap.min.css') }}" rel="stylesheet">
      <!-- Font Awesome -->
      <link href="{{ URL::asset('gentelella_master/vendors/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet">
      <!-- NProgress -->
      <link href="{{ URL::asset('gentelella_master/vendors/nprogress/nprogress.css') }}" rel="stylesheet">
      <!-- iCheck -->
      <link href="{{ URL::asset('gentelella_master/vendors/iCheck/skins/flat/green.css') }}" rel="stylesheet">

      <!-- bootstrap-progressbar -->
      <link href="{{ URL::asset('gentelella_master/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css') }}" rel="stylesheet">
      <!-- JQVMap -->
      <link href="{{ URL::asset('gentelella_master/vendors/jqvmap/dist/jqvmap.min.css') }}" rel="stylesheet"/>
      <!-- bootstrap-daterangepicker -->
      <link href="{{ URL::asset('gentelella_master/vendors/bootstrap-daterangepicker/daterangepicker.css') }}" rel="stylesheet">
      <link href="{{ URL::asset('gentelella_master/vendors/bootstrap-select/css/bootstrap-select.min.css') }}" rel="stylesheet">
      <link href="{{ URL::asset('gentelella_master/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css') }}" rel="stylesheet">
      <!-- Custom Theme Style -->
      <link href="{{ URL::asset('gentelella_master/build/css/custom.min.css') }}" rel="stylesheet">

      <!-- Datatables -->
      <link href="{{ URL::asset('gentelella_master/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ URL::asset('gentelella_master/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ URL::asset('gentelella_master/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ URL::asset('gentelella_master/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ URL::asset('gentelella_master/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ URL::asset('gentelella_master/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css') }}" rel="stylesheet">

      <!-- Dropzone.js -->
      <link href="{{ URL::asset('gentelella_master/vendors/dropzone/dist/min/dropzone.min.css') }}" rel="stylesheet">
      @yield('css')
      @yield('mapjs')
    </head>

    <body class="nav-md">
      <div class="container body">
        <div class="main_container">
          <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
              <div class="navbar nav_title" style="border: 0;">
                <a href="{{url('/home')}}" class="site_title"><i class="fa fa-paw"></i> <span>Travelling</span></a>
              </div>

              <div class="clearfix"></div>



              <br />
              @yield('sidebar')


              {{-- <!-- /menu footer buttons -->
              <div class="sidebar-footer hidden-small">
                <a data-toggle="tooltip" data-placement="top" title="Settings">
                  <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                  <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="Lock">
                  <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                </a>
                <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                  <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                </a>
              </div> --}}
              <!-- /menu footer buttons -->
            </div>
          </div>

          <!-- top navigation -->
          <div class="top_nav">
            <div class="nav_menu">
              <nav>
                <div class="nav toggle">
                  <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>

                <ul class="nav navbar-nav navbar-right">
                  <li class="">

                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                      @if(Auth::user()->g_avatar_url)
                        <img src="{{asset(Auth::user()->g_avatar_url)}}" alt="">
                      @else
                      <img src="{{asset('avatar/defaut_avt.jpg')}}" alt="">
                      @endif
                      {{ Auth::user()->name }} <span class=" fa fa-angle-down"></span>

                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                      <li><a href="{{url('user/userProfile/profile/'.Auth::user()->id)}}"> Profile</a></li>
                      <li>
                        <a href="#set">
                          <span>Settings</span>
                        </a>
                      </li>

                      <li>

                        <a href="{{ route('logout') }}" onclick="event.preventDefault();
                                      document.getElementById('logout-form').submit();"><i class="fa fa-sign-out pull-right"></i>
                         {{ __('Log Out') }}
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                      </li>
                    </ul>
                  </li>

                  <li class="">
                    <a href="{{url('user/trip/create')}}" class="user-profile" >
                          Lên kế hoạch
                    </a>

                  </li>

                </ul>
              </nav>
            </div>
          </div>
          <!-- /top navigation -->

          <!-- page content -->
          <div class="right_col" role="main">
            @yield('content')
          </div>
          <!-- /page content -->

          <!-- footer content -->
          <footer>
            <div class="pull-right">
              Bootstrap Admin Template by <a href="https://github.com/quanghung97/gentelella">Quang Hưng</a>
            </div>
            <div class="clearfix"></div>
          </footer>
          <!-- /footer content -->
        </div>
      </div>

      <!-- jQuery -->
      <script src="{{ URL::asset('gentelella_master/vendors/jquery/dist/jquery.min.js') }}"></script>
      <!-- Bootstrap -->
      <script src="{{ URL::asset('gentelella_master/vendors/bootstrap/dist/js/bootstrap.min.js') }}"></script>
      <!-- FastClick -->
      <script src="{{ URL::asset('gentelella_master/vendors/fastclick/lib/fastclick.js') }}"></script>
      <!-- NProgress -->
      <script src="{{ URL::asset('gentelella_master/vendors/nprogress/nprogress.js') }}"></script>
      <!-- Chart.js -->
      <script src="{{ URL::asset('gentelella_master/vendors/Chart.js/dist/Chart.min.js') }}"></script>
      <!-- gauge.js -->
      <script src="{{ URL::asset('gentelella_master/vendors/gauge.js/dist/gauge.min.js') }}"></script>
      <!-- bootstrap-progressbar -->
      <script src="{{ URL::asset('gentelella_master/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js') }}"></script>
      <!-- iCheck -->
      <script src="{{ URL::asset('gentelella_master/vendors/iCheck/icheck.min.js') }}"></script>
      <!-- Skycons -->
      <script src="{{ URL::asset('gentelella_master/vendors/skycons/skycons.js') }}"></script>
      <!-- Flot -->
      <script src="{{ URL::asset('gentelella_master/vendors/Flot/jquery.flot.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/Flot/jquery.flot.pie.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/Flot/jquery.flot.time.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/Flot/jquery.flot.stack.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/Flot/jquery.flot.resize.js') }}"></script>
      <!-- Flot plugins -->
      <script src="{{ URL::asset('gentelella_master/vendors/flot.orderbars/js/jquery.flot.orderBars.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/flot-spline/js/jquery.flot.spline.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/flot.curvedlines/curvedLines.js') }}"></script>
      <!-- DateJS -->
      <script src="{{ URL::asset('gentelella_master/vendors/DateJS/build/date.js') }}"></script>
      <!-- JQVMap -->
      <script src="{{ URL::asset('gentelella_master/vendors/jqvmap/dist/jquery.vmap.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/jqvmap/dist/maps/jquery.vmap.world.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js') }}"></script>
      <!-- bootstrap-daterangepicker -->
      <script src="{{ URL::asset('gentelella_master/vendors/moment/min/moment.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/bootstrap-daterangepicker/daterangepicker.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/bootstrap-select/js/bootstrap-select.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js') }}"></script>

      <!-- Custom Theme Scripts -->
      <script src="{{ URL::asset('gentelella_master/build/js/custom.min.js') }}"></script>
      <!-- Datatables -->
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net/js/jquery.dataTables.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-buttons/js/dataTables.buttons.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-buttons/js/buttons.flash.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-buttons/js/buttons.html5.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-buttons/js/buttons.print.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/datatables.net-scroller/js/dataTables.scroller.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/jszip/dist/jszip.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/pdfmake/build/pdfmake.min.js') }}"></script>
      <script src="{{ URL::asset('gentelella_master/vendors/pdfmake/build/vfs_fonts.js') }}"></script>

      <!-- Dropzone.js -->
      <script src="{{ URL::asset('gentelella_master/vendors/dropzone/dist/min/dropzone.min.js') }}"></script>
      @yield('js')

    </body>
  </html>
