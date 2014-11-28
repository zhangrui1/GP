<%--
  Created by IntelliJ IDEA.
  User: Lsr
  Date: 10/15/14
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../htmlframe/headFrame.jsp" />

<body class="skin-blue">
<!-- header logo: style can be found in header.less -->
<c:import url="../htmlframe/headerFrame.jsp"/>
<div class="wrapper row-offcanvas row-offcanvas-left">
<!-- Left side column. contains the logo and sidebar -->
    <c:import url="../htmlframe/leftFrame.jsp" />

<!-- Right side column. Contains the navbar and content of the page -->
    <aside class="right-side">
    <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    GP
                </h1>
                <ol class="breadcrumb">
                    <li><i class="fa fa-dashboard"></i> Master</li>
                </ol>
            </section>

    <!-- Main content -->
            <section class="content">

                <c:if test="${message != null}">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="alert alert-success alert-dismissable">${message}</div>
                        </div>
                    </div>
                </c:if>

                    <div class="row">
                        <form action="/master/update/${master.id}" id="MasterForm" name="MasterForm" method="post">
                        <!-- collection -->
                        <div class="col-xs-12">
                            <div class="nav-tabs-custom">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        工事先
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" name="placename" class="form-control" value="${master.placename}" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        ユニーク
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" name="placenameUnit" class="form-control" value="${master.placenameUnit}" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        略称
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input type="text" name="ryakuplaceshortname" class="form-control" value="${master.ryakuplaceshortname}" />
                                                    </div>
                                                </div>
                                            </div>
                                  　  </div><!-- /.tab-pane -->
                                        <div class="box-body clearfix">
                                            <div class="form-group">
                                                <button class="btn btn-success pull-right">
                                                    <i class="fa fa-save"></i> 更新
                                                </button>
                                            </div>
                                        </div>
                                </div><!-- /.tab-content -->
                            </div>
                        </div>
                      </div>
                     </form>
                    </div>


            </section><!-- /.content -->
    </aside><!-- /.right-side -->
</div><!-- ./wrapper -->

<!-- add new calendar event modal -->

<script type="text/javascript">
    $(document).ready(function(){
        $(".box-panel").click(function(){
            $(this).next().toggle();
        });

        $(".valve-table tr").mouseover(function(obj){
            var tr = $(obj.currentTarget)[0];
            $(tr).find(".operation-button").css("opacity","1");
        });
        $(".valve-table tr").mouseout(function(obj){
            var tr = $(obj.currentTarget)[0];
            $(tr).find(".operation-button").css("opacity","0");
        });

        $("#table_search").keyup(function(){
            var keyword = $("#table_search").val();
            var trs = $(".active .valve-table tbody tr");
            for(var i = 0;i<trs.length;i++){
                $(trs[i]).hide();
                var tds = $(trs[i]).find("td");

                for(var j = 0;j<tds.length;j++){
                    var tmpHtml = new String(tds[j].innerHTML);
                    if(tmpHtml.match(keyword)){
                        $(trs[i]).show();
                        break;
                    }
                }
            }
        });

    });
</script>

<c:import url="../htmlframe/footerFrame.jsp" />

</body>
</html>