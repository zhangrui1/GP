<%--
  Created by IntelliJ IDEA.
  User: Lsr
  Date: 10/15/14
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../htmlframe/headFrame.jsp"/>

<body class="skin-blue">
<!-- header logo: style can be found in header.less -->
<c:import url="../htmlframe/headerFrame.jsp"/>
<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <c:import url="../htmlframe/leftFrame.jsp"/>

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
                <form action="/master/add" id="MasterForm" name="MasterForm" method="post" onsubmit="return check()">
                    <%--<tr>--%>
                    <%--<td><input type="text" name="placename" class="form-control" value="工事先" /></td>--%>
                    <%--<td><input type="text" name="placenameUnit" class="form-control" value="ユニーク" /></td>--%>
                    <%--<td><input type="text" name="ryakuplaceshortname" class="form-control" value="略称" /></td>--%>
                    <%--</tr>--%>
                    <div class="master-row">
                        <div class="col-md-3">
                            <input type="text" id="placename" name="placename" class="form-control sousa"
                                   placeholder="工事先(必須)">
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="placenameUnit" name="placenameUnit" class="form-control sousa"
                                   placeholder="ユニーク">
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="ryakuplaceshortname" name="ryakuplaceshortname"
                                   class="form-control sousa" placeholder="略称">
                        </div>
                        <button class="btn btn-success">
                            <i class="fa fa-save"></i> 新規保存
                        </button>
                    </div>

                </form>

            </div>

            <br><br><br>

            <div class="row">
                <!-- collection -->
                <div class="col-xs-12">
                    <div class="nav-tabs-custom">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_1">
                                <table class="table table-hover valve-table">
                                    <thead>
                                    <tr>
                                        <th><a class="SortPN" name="SortPN" href="/master/sort/placename">工事先</a></th>
                                        <th><a class="SortPNU" name="SortPNU"
                                               href="/master/sort/placenameUnit">工事先ユニーク</a></th>
                                        <th><a class="SortPNS" name="SortPNS" href="/master/sort/ryakuplaceshortname">工事先略称</a>
                                        </th>

                                        <%--<th>工事先</th>--%>
                                        <%--<th>工事先ユニーク</th>--%>
                                        <%--<th>工事先略称</th>--%>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${masterLists}" var="masterLists">
                                        <tr>
                                                <%--<td><input type="text" name="placename" class="form-control" value="${masterLists.placename}" /></td>--%>
                                                <%--<td><input type="text" name="placenameUnit" class="form-control" value="${masterLists.placenameUnit}" /></td>--%>
                                                <%--<td><input type="text" name="ryakuplaceshortname" class="form-control" value="${masterLists.ryakuplaceshortname}" /></td>--%>
                                            <td>${masterLists.placename}</td>
                                            <td>${masterLists.placenameUnit}</td>
                                            <td>${masterLists.ryakuplaceshortname}</td>

                                            <td>
                                                <div class="operation-button">
                                                    <a class="btn btn-primary btn-sm operation-button-btn"
                                                       href="/master/edit/${masterLists.id}"><i
                                                            class="fa fa-pencil"></i></a>
                                                    <a class="btn btn-danger btn-sm operation-button-btn"
                                                       href="/master/delete/${masterLists.id}"><i
                                                            class="fa fa-trash-o"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</div>
<!-- ./wrapper -->

<!-- add new calendar event modal -->

<script type="text/javascript">
    $(document).ready(function () {
        $(".box-panel").click(function () {
            $(this).next().toggle();
        });

        $(".valve-table tr").mouseover(function (obj) {
            var tr = $(obj.currentTarget)[0];
            $(tr).find(".operation-button").css("opacity", "1");
        });
        $(".valve-table tr").mouseout(function (obj) {
            var tr = $(obj.currentTarget)[0];
            $(tr).find(".operation-button").css("opacity", "0");
        });

        $("#table_search").keyup(function () {
            var keyword = $("#table_search").val();
            var trs = $(".active .valve-table tbody tr");
            for (var i = 0; i < trs.length; i++) {
                $(trs[i]).hide();
                var tds = $(trs[i]).find("td");

                for (var j = 0; j < tds.length; j++) {
                    var tmpHtml = new String(tds[j].innerHTML);
                    if (tmpHtml.match(keyword)) {
                        $(trs[i]).show();
                        break;
                    }
                }
            }
        });

    });
</script>

<script type="text/javascript">
    function check(){
        var flag=0;
        //必須項目設定
        if(document.MasterForm.placename.value==""){flag=1;}

        if(flag){
            window.alert("工事先は必須入力項目です");
            return false;
        }else{
            return true;
        }

    }

</script>

<c:import url="../htmlframe/footerFrame.jsp"/>

</body>
</html>