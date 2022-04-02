<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/vendor/bootstrap/css/bootstrap.min.css">
    <!-- DataTables CSS -->
    <link href="resources/vendor/datatables/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap Validator CSS -->
    <link rel="stylesheet" href="resources/vendor/bootstrapValidator/css/bootstrapValidator.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/custom.css">
    <link rel="icon" href="resources/images/lichfl-favicon.png">
    <title>LICHFL - Feedback Client</title>
</head>

<body>
    <header>
        <!-- Sidebar navigation -->
        <div id="slide-out" class="side-nav sn-bg-4 fixed">
            <div class="float-left navbar-brand">
                <img src="./resources/images/lichfl-logo.png" />
            </div>
            <div class="nav-horizontal active">
                <div class="nav-icon"><i class="fa fa-list-alt"></i>
                </div>
                <div class="nav-title"><a href="#" class="nav-link-load" data-url="queries">Queries</a>
                </div>
            </div>
            <div class="nav-horizontal ">
                <div class="nav-icon"><i class="fa fa-search"></i>
                </div>
                <div class="nav-title"><a href="#" class="nav-link-load" data-url="search">Search</a>
                </div>
            </div>
            <div class="nav-horizontal">
                <div class="nav-icon"><i class="fa fa-line-chart"></i>
                </div>
                <div class="nav-title"><a href="#" class="nav-link-load" data-url="stats">Stats</a></div>
            </div>
            <div class="nav-horizontal">
                <div class="nav-icon"><i class="fa fa-cogs"></i>
                </div>
                <div class="nav-title"><a href="#" class="nav-link-load" data-url="adminPanel">Admin Panel</a></div>
            </div>
            <div class="nav-horizontal">
                <div class="nav-icon"><i class="fa fa-book"></i>
                </div>
                <div class="nav-title"><a href="#" class="nav-link-load" data-url="knowledgeBase">Knowledge Base</a></div>
            </div>
            <div class="nav-horizontal">
                <div class="nav-icon"><i class="fa fa-desktop"></i>
                </div>
                <div class="nav-title"><a href="#" class="nav-link-load" data-url="dashboard">Dashboard</a></div>
            </div>
            <div class="nav-horizontal" style="display:none;">
                <form:form action="logout" modelAttribute="dummy" id="logout-form" method="post">
                    <input type="hidden" name="username" value="${username}" id="username">
                    <div class="nav-icon"><i class="fa fa-sign-out"></i>
                    </div>
                    <div class="nav-title" onclick="logout();">Log Out</div>
                </form:form>
            </div>
            <div class="nav-footer">
                <div class="copyright"><i class="fa fa-copyright fa-fw"></i> 2022</div>
                <div class="company"><a href="//www.lichousing.com" target="_blank">LIC Housing Finance Ltd.</a>
                </div>
            </div>
        </div>
        <!-- Sidebar navigation -->
    </header>
    <div class="page-wrapper" id="page-wrapper">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-md navbar-light mb-2 no-content">
            <div class="web-page-title">
                Feedback Client
            </div>
            <ul class="navbar-nav ml-auto nav-flex-icons">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
                        <a class="dropdown-item" href="#" onclick="logout();">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- Navbar -->
        <!-- BreadCrumb -->
        <div class="breadcrumb">
            <div class="col-sm-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb lighten-4">
                        <li class="breadcrumb-item"><a class="black-text" href="#">Queries</a><i class="fa fa-angle-right mx-2" aria-hidden="true"></i>
                        </li>
                        <li class="breadcrumb-item active">Open Queries</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page content All the pages to be rendered inside page content-->
        <div id="page-content" class="container-fluid">
        	<%@include file="queries.jsp" %>
        </div>
    </div>
    <!--Modal: Session Timeout-->
    <div class="modal fade" id="modalSessionTimout" tabindex="-1" role="dialog" aria-labelledby="modalSessionTimout" aria-hidden="true">
        <div class="modal-dialog modal-md modal-notify modal-info" role="document">
            <!--Content-->
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header d-flex">
                    <p class="heading">
                        <i class="fa fa-exclamation-circle fa-1x animated rotateIn white-text"></i> Session is about to expire.
                    </p>
                </div>
                <!--Body-->
                <div class="modal-body">
                    <p>Click stay connected to continue or logout. Session will timeout if no action is taken.</p>
                </div>
                <!--Footer-->
                <div class="modal-footer flex-center">
                    <a href="javascript:void(0);" class="btn btn-sm btn-default" onclick="logout();">Logout</a>
                    <a type="button" class="btn btn-sm btn-info waves-effect" data-dismiss="modal">Stay Connected</a>
                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
    <!--Modal: Session Timeout -->
    <div class="lichfl-ajax-overlay"><i class="fa fa-spinner fa-spin"></i>
    </div>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="resources/vendor/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="resources/vendor/bootstrap/js/popper.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables JavaScript -->
    <script src="resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <!-- MDB JS -->
    <script src="resources/js/mdb.min.js"></script>
    <!-- Bootstrap Validator JavaScript -->
    <script src="resources/vendor/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <!-- Timeout JavaScript -->
    <script src="resources/vendor/timeout/bootstrap-session-timeout.min.js"></script>
    <!-- Optional JavaScript -->
    <script src="resources/js/custom.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('[data-toggle="tooltip"]').tooltip();

            $.sessionTimeout({
                keepAliveUrl: 'resources/keep.html',
                keepAliveInterval: 300000,
                ajaxType: 'GET',
                warnAfter: 300000,
                redirAfter: 310000,
                onWarn: function() {
                    $('#modalSessionTimout').modal('show');
                },
                onRedir: function() {
                    logout();
                }
            });

            $('#paginationFullNumbers').DataTable({
                "pagingType": "full_numbers",
                initComplete: function() {
                    this.api().columns().every(function() {
                        var column = this;
                        var search = $(` < input class = "form-control form-control-sm"
                            type = "text"
                            placeholder = "Search" > `)
                            .appendTo($(column.footer()).empty())
                            .on('change input', function() {
                                var val = $(this).val()

                                column
                                    .search(val ? val : '', true, false)
                                    .draw();
                            });

                    });
                }
            });

            window.onbeforeunload = function(evnt) {
                logout();
            };
            
            
            /* NAV MENU JSP LOAD */

            $('.nav-link-load').on('click', function(){
            	$.ajax({
                    url: "queries",
                    type: "GET",
                    success: function(data) {
                    	$(".lichfl-ajax-overlay").hide();
                    	console.log(data);
                    }
                });
            });
        });
    </script>
</body>

</html>
