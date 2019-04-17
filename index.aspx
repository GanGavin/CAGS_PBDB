<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PBDB.Web.data_entry.index" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 禁用缓存（经测试FF,Chrome好使，IE11不好使） -->
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">

    <title>古生物化石数据录入</title>
    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
        rel="stylesheet">
    <link href="/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
        rel="stylesheet">
    <link href="/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    <!-- jquery-confirm -->
    <link href="/vendors/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
    <!-- fileinput -->
    <link href="/vendors/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
    <!-- select2 -->
    <link href="/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="javascript:void(0);" class="site_title"><span>古生物大类</span></a>
                    </div>
                    <div class="clearfix">
                    </div>
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <ul class="nav side-menu">
                                <li class="active"><a data-pcid="0"><i class="fa fa-cubes"></i>全部 </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="top_nav">
                <div class="nav_menu">
                    <nav>
                      <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-arrow-circle-left"></i></a>
                      </div>
                      <ul class="nav navbar-nav navbar-right">
                        <li class="">
                          <span class="navbar-text">
                              用户名：<span><%= userName%></span>&nbsp;
                              <a class="btn btn-primary btn-xs" href="/SSO/management.aspx">系统管理</a>&nbsp;
                              <a class="btn btn-warning btn-xs" onclick="logout()">注销</a>
                          </span>
                          <script type="text/javascript">
                              function logout() {
                                  window.location.href = "LoginOut.aspx";
                              }
                          </script>
                        </li>
                      </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->
            <!-- page content -->
            <style>
                .input-group-btn .btn
                {
                    margin: 0;
                }
            </style>
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3></h3>
                        </div>
                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 pull-right text-right">
                                <button id="js-add-btn" class="btn btn-success" onclick="add_dialog()">
                                    添加记录</button>
                            </div>
                        </div>
                        <!-- <div style="float: left;">属：<input type="text"> 种：<input type="text"> 地层年代：<input type="text"><button>查询</button></div> -->
                    </div>
                    <div class="clearfix">
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <!-- table -->
                            <style>
                                .datatable-hover > tbody > tr:hover {
                                    background-color: #e5e5e5;
                                }
                            </style>
                            <table id="responsived-atatable" class="table table-striped table-bordered dt-responsive datatable-hover"
                                cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>
                                            序号
                                        </th>
                                        <th>
                                            物种分类
                                        </th>
                                        <th>
                                            地质年代
                                        </th>
                                        <th>
                                            命名人
                                        </th>
                                        <!-- <th>
                                            命名时间
                                        </th> -->
                                        <th>
                                            经度
                                        </th>
                                        <th>
                                            纬度
                                        </th>
                                        <th>
                                            录入时间
                                        </th>
                                        <th>
                                            详情
                                        </th>
                                        <th>
                                            修改
                                        </th>
                                        <th>
                                            删除
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                            <!-- /table -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /page content -->
            <!-- footer content -->
            <footer>
            <footer>
                <div class="pull-right">
                    古生物标准化石数据库数据录入&nbsp;
                    访问次数：<span id="visited-times"></span>
                </div>
                <div class="clearfix"></div>
            </footer>
        </footer>
            <!-- /footer content -->
        </div>
    </div>
    <div class="modal fade" id="collectionBox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="collectionName">
                    </h4>
                </div>
                <div class="modal-body" id="collectionModalBody">
                </div>
                <div class="modal-footer">
                    <p>
                        古生物信息</p>
                </div>
            </div>
        </div>
    </div>
    <!-- end collectionBox modal -->
    <!-- jQuery -->
    <script src="/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="/vendors/datatables.net/js/jquery.dataTables.js"></script>
    <script src="/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="/vendors/jszip/dist/jszip.min.js"></script>
    <script src="/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="/vendors/pdfmake/build/vfs_fonts.js"></script>
    <!-- jquery-confirm -->
    <script src="/vendors/jquery-confirm/jquery-confirm.min.js"></script>
    <script src="/vendors/parsleyjs/dist/parsley.min.js"></script>
    <script src="/vendors/parsleyjs/dist/i18n/zh_cn.js"></script>
    <script src="/vendors/distpicker/dist/distpicker.min.js"></script>
    <!-- fileinput -->
    <script src="/vendors/bootstrap-fileinput/js/fileinput.min.js"></script>
    <script src="/vendors/bootstrap-fileinput/js/locales/zh.js"></script>
    <!-- select2 -->
    <script src="/vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- slider -->
    <script src="/vendors/slider/js/jssor.slider.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="build/js/custom.js"></script>
</body>
</html>
