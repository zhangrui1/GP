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
                新規登録
                <small>工事情報登録</small>
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

        <!-- add content modal -->
        <div id="kiki-modal" class="modal fade content-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <form action="/kouji/add" id="KoujiImageForm" name="KoujiImageForm" method="post">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">工事登録</h4>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-1">
                                        <input type="button" class="btn btn-danger master-sousa" onclick="getAllMaster(this)" data-toggle="modal" data-target="#masterModal" id="8" value="工事先" />
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" id="placename" name="placename" class="form-control sousa" placeholder="工事先" value="${koujiImage.placename}">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" id="ryakuplaceshortname" name="ryakuplaceshortname" class="form-control sousa" value="${koujiImage.placename}">
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
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-warning" value="登録" />
                        </div>
                    </div>
                </div>
            </form>
        </div>



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
            alert("data");

            $("#master-ul").html("");
            for(var i = 0;i<masters.length;i++){
                var tmpHTML = '<li class="list-group-item master-li" onclick="chooseThisMaster(this)">'+masters[i].placename+'   '+masters[i].ryakuplaceshortname+'</li>'
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
            if(targets.length < 2){
                targets[0].value = masters[1];
                break;
            }
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

    function removeImage(obj){
        $(obj).attr({"disabled":"true"});
        var currentObject = $(obj).next();
        $.post("/image/deleteByImagename",
                {"object":currentObject.val()},
                function(data){
                    var div = document.getElementById(currentObject.val());
                    $(div).hide(500,function(){
                        $(div).remove();
                    });
                    object = currentObject.val();
                    var request = gapi.client.storage.objects.delete({
                        'bucket': BUCKET,
                        'object': object
                    });
                    request.execute(function(resp) {
                        document.getElementById('previewImage').src="";
                    });
                });
    }

    function progressBarController(num){
        $("#progressbar").attr({"aria-valuenow":num});
        $("#progressbar").css({"width":num+"%"});
    }

    function saveChangeToDatabase(obj){
        $(obj).attr({"disabled":"true"});
        var currentObject = $(obj).next();
        $.post("/image/updateSyuByImagename",
                {"imagesyu":$(obj).val(),"object":currentObject.val()},
                function(data){
                    $(obj).removeAttr("disabled");
                });
    }

    function changeImage(obj){
        document.getElementById("previewImage").src=obj.src;
        document.getElementById("original-link").href=obj.src;
        var imageHeight = $("#previewImage").css("height");
        if(imageHeight < 600){
            $("#imageList").css("height",600);
        } else {
            $("#imageList").css("height",$("#previewImage").css("height"));
        }
    }

    function showDelete(obj){
        var content = $(obj).find(".thumbnail-content")[0];
        var btn = $(content).find(".thumbnail-delete-btn").css("opacity","1");
    }
    function hideDelete(obj){
        var content = $(obj).find(".thumbnail-content")[0];
        var btn = $(content).find(".thumbnail-delete-btn").css("opacity","0");
    }
</script>

<!-- Google Sotrage -->
<script type="text/javascript">
/**
 * The Project ID of your Google Cloud Storage Project.
 */
var PROJECT = 'power-science-20140719001';
/**
 * Enter a client ID for a web application from the Google Developers
 * Console on the "APIs & auth", "Credentials" page.
 * In your Developers Console project add a JavaScript origin
 * that corresponds to the domain from where you will be running the
 * script. For more info see:
 * https://developers.google.com/console/help/new/#generatingoauth2
 */
var clientId = '13771198627-plrtfkpr8r96ccev7n6ip1f1ublte6n1.apps.googleusercontent.com';
/**
 * Enter the API key from the Google Developers Console, by following these
 * steps:
 * 1) Visit https://cloud.google.com/console and select your project
 * 2) Click on "APIs & auth" in the left column and then click “Credentials”
 * 3) Find section "Public API Access" and use the "API key." If sample is
 * being run on localhost then delete all "Referers" and save. Setting
 * should display "Any referer allowed." For more info see:
 * https://developers.google.com/console/help/new/#generatingdevkeys
 */
var apiKey = 'AIzaSyAG-h3cIM_SsO0fE_gA8lAIl2x71zdC6NA';
/**
 * To enter one or more authentication scopes, refer to the documentation
 * for the API.
 */
var scopes = 'https://www.googleapis.com/auth/devstorage.full_control';
/**
 * Constants for request parameters. Fill these values in with your custom
 * information.
 */
var API_VERSION = 'v1';
var BUCKET = 'valdac';
/**
 * The name of the object inserted via insertObject method.
 */
var object = "";

var GROUP =
        'group-00b4903a9744bffac3b0196718449ddbaf5cbc5a1ebfff7783546ad6f13e63f6';
/**
 * Valid values are user-userId, user-email, group-groupId, group-email,
 * allUsers, allAuthenticatedUsers
 */
var ENTITY = 'allUsers';
/**
 * Valid values are READER, OWNER
 */
var ROLE = 'OWNER';
/**
 * Valid values are READER, OWNER
 */
var ROLE_OBJECT = 'OWNER';
/**
 * Google Cloud Storage API request to insert an object into
 * your Google Cloud Storage bucket.
 */
function insertObject(event) {
    try{
        var fileData = event.target.files[0];
    }
    catch(e) {
        return;
    }

    // progressbar
    progressBarController(10);
    const boundary = '-------314159265358979323846';
    const delimiter = "\r\n--" + boundary + "\r\n";
    const close_delim = "\r\n--" + boundary + "--";
    var reader = new FileReader();
    reader.readAsBinaryString(fileData);
    reader.onload = function(e) {
        var fileTypeOld = new String(fileData.name);
        var fileType = fileTypeOld.split('.');

        //make file name
        var d = new Date();
        var vYear = d.getFullYear();
        var vMon = d.getMonth() + 1;
        var vDay = d.getDate();
        if(vDay < 10){
            vDay = "0"+vDay;
        }
        var todayDate = vYear+""+vMon+""+vDay;
        var objectAndName = todayDate + "/" + d.getTime()+"."+fileType[fileType.length-1];

        //make parameters
        progressBarController(30);
        var contentType = fileData.type || 'application/octet-stream';
        var metadata = {
            'name': objectAndName,
            'mimeType': contentType
        };
        var base64Data = btoa(reader.result);
        var multipartRequestBody =
                delimiter +
                'Content-Type: application/json\r\n\r\n' +
                JSON.stringify(metadata) +
                delimiter +
                'Content-Type: ' + contentType + '\r\n' +
                'Content-Transfer-Encoding: base64\r\n' +
                '\r\n' +
                base64Data +
                close_delim;
        //Note: gapi.client.storage.objects.insert() can only insert
        //small objects (under 64k) so to support larger file sizes
        //we're using the generic HTTP request method gapi.client.request()
        var request = gapi.client.request({
            'path': '/upload/storage/v1/b/' + BUCKET + '/o',
            'method': 'POST',
            'params': {'uploadType': 'multipart'},
            'headers': {
                'Content-Type': 'multipart/mixed; boundary="' + boundary + '"'
            },
            'body': multipartRequestBody});
        progressBarController(60);
        try{
            //Execute the insert object request
            executeRequest(request, 'insertObject');
            //Store the name of the inserted object
            object = objectAndName;
        }
        catch(e) {
            alert('An error has occurred: ' + e.message);
        }
    }
}
/**
 * Google Cloud Storage API request to insert an Access Control List into
 * your Google Cloud Storage object.
 */
function insertObjectAccessControls() {
    resource = {
        'entity': ENTITY,
        'role': ROLE_OBJECT
    };
    var request = gapi.client.storage.objectAccessControls.insert({
        'bucket': BUCKET,
        'object': object,
        'resource': resource
    });
    executeRequest(request, 'insertObjectAccessControls');
}
/**
 * Google Cloud Storage API request to delete a Google Cloud Storage object.
 */
function deleteObject() {
    var request = gapi.client.storage.objects.delete({
        'bucket': BUCKET,
        'object': object
    });
    executeRequest(request, 'deleteObject');
}
function updateApiResultEntry(apiRequestName) {
    listChildren = document.getElementById('main-content')
            .childNodes;
    if (listChildren.length > 1) {
        listChildren[1].parentNode.removeChild(listChildren[1]);
    }
    if (apiRequestName != 'null') {
        window[apiRequestName].apply(this);
    }
}
function executeRequest(request, apiRequestName) {
    request.execute(function(resp) {
        console.log(resp);
        if (apiRequestName != 'insertObject') {

            document.getElementById('previewImage').src="http://storage.googleapis.com/valdac/"+resp.object;
            document.getElementById("original-link").href="http://storage.googleapis.com/valdac/"+resp.object;
            var imageListObj = '<div id="'+resp.object+'" class="col-md-12 image-div" onMouseOver="showDelete(this)" onmouseout="hideDelete(this)">'+
            '<div class="row thumbnail-object">'+
            '<div class="col-md-4 thumbnail-img">'+
            '<img src="http://storage.googleapis.com/valdac/'+resp.object+'" onclick="changeImage(this)" alt="..." style="cursor:pointer;height: 100px">'+
            '</div>'+
            '<div class="col-md-8 thumbnail-content">'+
            '<select class="form-control input-sm imagesyu" onchange="saveChangeToDatabase(this)"><option></option><option>画像種別1</option><option>画像種別2</option><option>画像種別3</option></select>'+
            '<input type="hidden" value="'+resp.object+'" >'+
            '<input type="button" class="btn btn-danger btn-xs thumbnail-delete-btn pull-right" value="X" onclick="removeImage(this)">'+
            '<input type="hidden" class="currentObject" value="'+resp.object+'" >'+
            '</div>'+
            '</div>'+
            '</div>';

//            imageListObj = '<div id="'+resp.object+'" class="col-md-12 image-div">'+
//                    '<div class="thumbnail">'+
//                        '<img src="http://storage.googleapis.com/valdac/'+resp.object+'" onclick="changeImage(this)" alt="..." style="cursor:pointer">'+
//                        '<div class="caption">'+
//                            '<div class="row">'+
//                                '<div class="col-md-9">'+
//                                    '<select class="form-control input-sm imagesyu" onchange="saveChangeToDatabase(this)"><option>画像種別1</option><option>画像種別2</option><option>画像種別3</option></select>'+
//                                    '<input type="hidden" value="'+resp.object+'" >'+
//                                    '</div><div class="col-md-3"><input type="button" class="btn btn-danger btn-xs" value="X" onclick="removeImage(this)"><input type="hidden" class="currentObject" value="'+resp.object+'" ></div>'+
//                                '</div>'+
//                            '</div>'+
//                        '</div>'+
//                    '</div>';
            document.getElementById("imageList").innerHTML = document.getElementById("imageList").innerHTML+imageListObj;

            progressBarController(100);
            //update database
            $.post("/image/saveImageByImagePath",{"object":resp.object},function(data){
                //save relation
                var kikiId = $("#kikiId").val();
                $.post("/image/addRelation",{"partid":kikiId,"object":resp.object},function(){
                    progressBarController(0);

                });
            });
        } else {
            progressBarController(80);
            insertObjectAccessControls();
        }
    });
}
/**
 * Set required API keys and check authentication status.
 */
function handleClientLoad() {
    gapi.client.setApiKey(apiKey);
    window.setTimeout(checkAuth, 1);
}
/**
 * Authorize Google Cloud Storage API.
 */
function checkAuth() {
    gapi.auth.authorize({
        client_id: clientId,
        scope: scopes,
        immediate: true
    }, handleAuthResult);
}
/**
 * Handle authorization.
 */
function handleAuthResult(authResult) {
    var authorizeButton = document.getElementById('authorize-button');
    if (authResult && !authResult.error) {
        authorizeButton.style.visibility = 'hidden';
        initializeApi();
        filePicker.onchange = insertObject;
    } else {
        authorizeButton.style.visibility = '';
        authorizeButton.onclick = handleAuthClick;
    }
}
/**
 * Handle authorization click event.
 */
function handleAuthClick(event) {
    gapi.auth.authorize({
        client_id: clientId,
        scope: scopes,
        immediate: false
    }, handleAuthResult);
    return false;
}
/**
 * Load Google Cloud Storage API v1beta12.
 */
function initializeApi() {
    gapi.client.load('storage', API_VERSION);
}
/**
 * Driver for sample application.
 */
$(window)
        .bind('load', function() {
//            addSelectionSwitchingListeners();
            handleClientLoad();
        });

</script>


<c:import url="../htmlframe/leftFrame.jsp" />

</body>
</html>