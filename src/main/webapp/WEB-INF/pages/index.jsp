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
                        <!-- collection -->
                        <div class="col-xs-12">
                            <div class="nav-tabs-custom">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">
                                        <table class="table table-hover valve-table">
                                            <thead>
                                            <tr>
                                                <th>工事先</th>
                                                <th>工事先略称</th>
                                                <th>弁番号</th>
                                                <th>決定図番号</th>
                                                <th>寸法図番号</th>
                                                <th>備考</th>
                                                <th>操作</th>
                                            </tr></thead>
                                            <tbody>
                                            <c:forEach items="${newKoujiImages}" var="newKoujiImages">
                                                <tr>
                                                    <td>${newKoujiImages.placename}</td>
                                                    <td>${newKoujiImages.placeshortname}</td>
                                                    <td>${newKoujiImages.valveimagenum}</td>
                                                    <td>${newKoujiImages.decideimagenum}</td>
                                                    <td>${newKoujiImages.sizeimagenum}</td>
                                                    <td>${newKoujiImages.commend}</td>
                                                    <td>
                                                        <div class="operation-button">
                                                            <a class="btn btn-primary btn-sm operation-button-btn" href="/image/edit/${newKoujiImages.id}"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm operation-button-btn" href="/image/delete/${newKoujiImages.id}"><i class="fa fa-trash-o"></i></a>
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