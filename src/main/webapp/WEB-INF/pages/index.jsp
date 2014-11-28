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
<c:import url="htmlframe/headFrame.jsp" />

<body class="skin-blue">
<!-- header logo: style can be found in header.less -->
<c:import url="htmlframe/headerFrame.jsp"/>
<div class="wrapper row-offcanvas row-offcanvas-left">
<!-- Left side column. contains the logo and sidebar -->
    <c:import url="htmlframe/leftFrame.jsp" />

<!-- Right side column. Contains the navbar and content of the page -->
    <aside class="right-side">
    <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    GP
                </h1>
                <ol class="breadcrumb">
                    <li><i class="fa fa-dashboard"></i> Index</li>
                </ol>
            </section>

    <!-- Main content -->
            <section class="content">

                <div class="row">

                    <div class="box-header">
                        <h3 class="box-title">GP検索</h3>
                    </div>

                    <form action="/kouji/search" id="KoujiImageForm" name="KoujiImageForm" method="post">
                        <div class="master-row">
                            <div class="col-md-3">
                                <input type="text" id="placename" name="placename" class="form-control"
                                       placeholder="工事先">
                            </div>
                            <div class="col-md-2">
                                <input type="text" id="placeshortname" name="placeshortname" class="form-control"
                                       placeholder="略称">
                            </div>
                            <div class="col-md-2">
                                <input type="text" id="valveimagenum" name="valveimagenum"
                                       class="form-control" placeholder="弁番号">
                            </div>

                            <div class="col-md-2">
                                <input type="text" id="decideimagenum" name="decideimagenum"
                                       class="form-control" placeholder="決定図番号">
                            </div>

                            <div class="col-md-2">
                                <input type="text" id="sizeimagenum" name="sizeimagenum"
                                       class="form-control" placeholder="寸法図番号">
                            </div>

                            <button class="btn btn-success">
                                <i class="fa fa-save"></i> 検索
                            </button>
                        </div>

                    </form>

                </div>


                    <div class="row">

                        <div class="box-header">
                            <h3 class="box-title">GP一覧</h3>
                        </div>

                        <!-- collection -->
                        <div class="col-xs-12">
                            <div class="nav-tabs-custom">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                        <table class="table table-hover valve-table" width="100%">
                                            <thead>
                                            <tr>
                                                <th width="30%">工事先</th>
                                                <th width="5%">工事先略称</th>
                                                <th width="5%">弁番号</th>
                                                <th width="20%">決定図番号</th>
                                                <th width="20%">寸法図番号</th>
                                                <th width="10%">備考</th>
                                                <th width="10%">操作</th>
                                            </tr></thead>
                                            <tbody>
                                            <c:forEach items="${newKoujiImages}" var="newKoujiImages">
                                                <tr>
                                                    <td width="30%">${newKoujiImages.placename}</td>
                                                    <td width="5%">${newKoujiImages.placeshortname}</td>
                                                    <td width="5%">${newKoujiImages.valveimagenum}</td>
                                                    <td width="20%">${newKoujiImages.decideimagenum}</td>
                                                    <td width="20%">${newKoujiImages.sizeimagenum}</td>
                                                    <td width="10%">${newKoujiImages.commend}</td>
                                                    <td width="10%">
                                                        <div class="operation-button">
                                                            <a class="btn btn-primary btn-sm operation-button-btn" href="/kouji/edit/${newKoujiImages.id}"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm operation-button-btn" href="/kouji/delete/${newKoujiImages.id}"><i class="fa fa-trash-o"></i></a>
                                                        </div>
                                                    </td>
                                                </tr>

                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div>
                        </div>
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

<c:import url="htmlframe/footerFrame.jsp" />

</body>
</html>