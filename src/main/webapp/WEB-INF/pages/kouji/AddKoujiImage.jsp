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

<link type="text/css" rel="stylesheet" href="/css/kiki.css"/>

<body class="skin-blue">
<!-- header logo: style can be found in header.less -->

<c:import url="../htmlframe/headerFrame.jsp" />

<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <c:import url="../htmlframe/leftFrame.jsp" />

    <!-- Right side column. Contains the navbar and content of the page -->
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                工事情報
            </h1>
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



            <form action="/image/add" id="KoujiImageForm" name="KoujiImageForm" method="post">
                <div class="col-lg-12">
                    <div class="box box-primary">

                        <div class="box-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-sousa" onclick="getAllMaster(this)" data-toggle="modal" data-target="#masterModal" id="8" value="工事先" />
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="placename" name="placename" class="form-control sousa" placeholder="工事先" value="${koujiImage.placename}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="placeshortname" name="placeshortname" class="form-control sousa" value="${koujiImage.placeshortname}">
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        弁番号
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="valveimagenum" class="form-control" value="${koujiImage.valveimagenum}" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                       決定図番号
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="decideimagenum" class="form-control" value="${koujiImage.decideimagenum}" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        寸法図番号
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="sizeimagenum" class="form-control" value="${koujiImage.sizeimagenum}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        備考
                                    </div>
                                    <div class="col-md-10">
                                        <input type="text" name="commend" class="form-control" value="${koujiImage.commend}" />
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="box-body clearfix">
                            <div class="form-group">
                                <button class="btn btn-success pull-right">
                                    <i class="fa fa-save"></i> 保存
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>




        </section><!-- /.content -->
    </aside><!-- /.right-side -->
</div><!-- ./wrapper -->

<style type="text/css">

    .master-li:hover{
        cursor:pointer;
        background-color: #eee;
    }
</style>

<div id="masterModal" class="modal fade masterModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content model-content-master" style="height:600px;overflow:scroll;">
            <input id="master-type" type="hidden" value="" />
            <input type="hidden" id="master-class" value="" />
            <ul id="master-ul" class="list-group">
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">


    function getAllMaster(obj){
        var type=obj.value;
        var masterName = new String($(obj).attr("class"));
        var masterNames = masterName.split("master-");
        $("#master-class").val(masterNames[1]);
        var typeName="";
//        alert(id);
        $.post("/master/getAllMaster",function(data){
//            $("#master-type").val(type);
            var masters = JSON.parse(data);
            $("#master-ul").html("");
            for(var i = 0;i<masters.length;i++){
                var tmpHTML = '<li class="list-group-item master-li" onclick="chooseThisMaster(this)">'+masters[i].placename+''+ masters[i].placenameUnit+'   '+masters[i].ryakuplaceshortname+'</li>'
                $("#master-ul").html($("#master-ul").html()+tmpHTML);
            }
//            console.log($('.masterModal'));
        });
    }

    function chooseThisMaster(obj) {
        $("#master-type").val();
        var masterName = $("#master-class").val();
        var values = new String(obj.innerHTML);
        var masters = values.split("   ");
        var targets = $("."+masterName);

        for(var i = 0;i<targets.length;i++){
            targets[i].value = masters[i];
        }
    }
</script>


<script type="text/javascript">
    $(document).ready(function(){

        $("#left-menu-new").addClass("active");

        $(".box-panel").click(function(){
            $(this).next().toggle();
        });

        $(".kiki-table tr").mouseover(function(obj){
            var tr = $(obj.currentTarget)[0];
            $(tr).find(".operation-button").css("opacity","1");
        });
        $(".kiki-table tr").mouseout(function(obj){
            var tr = $(obj.currentTarget)[0];
            $(tr).find(".operation-button").css("opacity","0");
        });

    });
</script>


<c:import url="../htmlframe/leftFrame.jsp" />

</body>
</html>