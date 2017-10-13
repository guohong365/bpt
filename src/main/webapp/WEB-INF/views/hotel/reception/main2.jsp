<%@page import="com.uc.web.utils.SystemConfig"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta charset="utf-8" />
<title><%=SystemConfig.getConfig("system.name", "")%></title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css" />" />

<!-- date picker -->
<link rel="stylesheet" href="<c:url value="/resources/css/datepicker.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-datetimepicker.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/daterangepicker.css" />" />

<!-- text fonts -->
<link rel="stylesheet" href="<c:url value="/resources/css/ace-fonts.css" />" />

<!-- ace styles -->
<link rel="stylesheet" href="<c:url value="/resources/css/ace.min.css" />" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="<c:url value="/resources/css/ace-part2.min.css" />" />
		<![endif]-->
<link rel="stylesheet" href="<c:url value="/resources/css/ace-skins.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/ace-rtl.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/chosen.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/uc.data.css" />" />

<style type="text/css">
.strike-out {
	text-decoration: line-through;
}
.storey{
background-image: url("<c:url value='/resources/images/storey-50.png' />") !important;
background-repeat: no-repeat;
background-position: 5px center;
margin-top: 10px;
 
}
.aa{
 background-image: url("<c:url value='/resources/images/bg_room.png' />");
 background-repeat: repeat-x;
}
.room-btn{
 box-sizing:border-box;
 float:left;
 margin: 10px;
 height: 280px;
 width : 280px;
 padding:2px;
 background-color: #0094FF;
 position: relative;
}
.room-plate{
  box-sizing:border-box;
  width:200px;
  height:50px;
  margin-top: 10px;
  margin-left: auto;
  margin-right:auto;
  margin-bottom:5px;  
  padding: 0;
  background-image: url("<c:url value='/resources/images/room_plate.png' />");
  background-repeat: no-repeat; 
  font-size: 35px;
  text-align: center;
  line-height: 50px; 
}
.room-label{
  box-sizing: border-box;
  color: #FFF;
  font-size: 20px;
  vertical-align: middle;
  height: 24px;   
  width:276px;
  line-height: 24px;
  margin-top: 4px;
  border: 1px 1px 1px 1px #FFF;
}
.room-label .label{
  float: left;
  padding-left: 10px;
}
.room-label .info{
  float: left;
  padding-right: 10px;
}
.charge-panel{
  box-sizing:border-box;
  width: 276px;
  height: 50px;
  background-color: #EEE;  
  position: absolute;
  bottom: 2px;
}
.charge-panel div{
  text-align: right;
  vertical-align: middle;
  height:46px;
  line-height:46px;
  margin-top: 2px;
  margin-bottom: 2px;
}
.charge-panel .info{
  float: left;
  padding-left: 10px;
  font-size: 20px;
}
.charge-panel .charge{
  padding-right: 10px;
  float: right;
  font-size: 25px;
} 

</style>
<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<c:url value="/resources/css/ace-ie.min.css" />" />
		<![endif]-->

<!-- ace settings handler -->
<script src="<c:url value="/resources/js/ace-extra.min.js" />"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="<c:url value="/resources/js/html5shiv.js" />" ></script>
		<script src="<c:url value="/resources/js/respond.min.js" />" ></script>
		<![endif]-->
</head>

<body class="no-skin">
  <!-- #section:basics/navbar.layout -->
  <div id="navbar" class="navbar navbar-default">
    <script type="text/javascript">        
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

    <div class="navbar-container" id="navbar-container">
      <div class="navbar-header pull-left">
        <!-- #section:basics/navbar.layout.brand -->
        <a href="#" class="navbar-brand">
          <small>
            <i class="fa fa-medkit bigger"></i>
            <%=SystemConfig.getConfig("system.name", "")%><small><%=(SystemConfig.getConfig("SystemType", "").equals("test")?"-测试版":"") %>
              Ver.<%=SystemConfig.getConfig("system.version", "")%></small>
          </small>
        </a>
        <!-- /section:basics/navbar.layout.brand -->

      </div>

      <!-- #section:basics/navbar.dropdown -->
      <div class="navbar-buttons navbar-header pull-right" role="navigation">
        <ul class="nav ace-nav">

          <!-- #section:basics/navbar.user_menu -->
          <li class="light-blue">
            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
              <i class="ace-icon fa fa-user nav-user-photo"></i>
              <span class="user-info">
                <small>欢迎,</small>
                ${userName}
              </span>
              <i class="ace-icon fa fa-caret-down"></i>
            </a>

            <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
              <li>
                <a id="changePwd" href="#change_pwd_dlg" data-toggle="modal">
                  <i class="ace-icon fa fa-user"></i> 修改密码
                </a>
              </li>

              <li class="divider"></li>

              <li>
                <a href="#logout-dlg" data-toggle="modal">
                  <i class="ace-icon fa fa-power-off"></i> 退出
                </a>
              </li>
            </ul>
          </li>

          <!-- /section:basics/navbar.user_menu -->
        </ul>
      </div>

      <!-- /section:basics/navbar.dropdown -->
    </div>
    <!-- /.navbar-container -->
  </div>

  <!-- /section:basics/navbar.layout -->
  <div class="main-container" id="main-container">
    <script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar                  responsive">
      <script type="text/javascript">
				try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
			</script>
      <div id="storeyButtons" data-toggle="buttons">
      <c:forEach items="${_storeys}" var="storey">
        <label class="btn btn-lg  btn-block storey" >
        <input type="radio" data-storey="${storey}" value="${storey}"/>${storey}层</label>
      </c:forEach>      
      </div>
      <script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
    </div>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
          <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
          </script>

        <!-- /.breadcrumb -->

        <!-- #section:basics/content.searchbox -->
        <div class="nav-search">
          <span class="input-icon">
            <input id="roomSearch" class="nav-search-input" type="text" autocomplete="off" />
            <i class="ace-icon fa fa-search"></i>            
          </span>
        </div>  
         <!-- /.nav-search -->

        <!-- /section:basics/content.searchbox -->
      </div>
      <div class="page-content">
        <div id="rooms" class="page-content-area"><!-- ajax content goes here -->
        <c:forEach items="${_roomDetails}" var="room">
          <div class="room-btn" data-storey="${room.storey}" data-room="${room.roomNo }">
            <div class="room-plate">${room.roomNo}</div> 
            <div class="room-label">
              <div class="label">入住时间：</div>
              <div class="info">${room.checkInTime }</div>
            </div>     
            <div class="room-label">
              <div class="label">使用次数：</div>
              <div class="info">${room.useTimes }</div>
            </div>
            <div class="charge-panel">
              <div class="info">应付款：</div>          
              <div class="charge red"><strong>${charge}</strong></div>            
            </div>
          </div>
        </c:forEach>
        </div><!-- /.page-content-area -->
        <!-- change password modal dialog -->
        <div id="change_pwd_dlg" class="modal" tabindex="-1" data-backdrop="false">
          <div class="modal-dialog">
            <div class="modal-content">
              <form id="FORM_CHANGE_PWD" class="form-horizonal" role="from">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="blue bigger">修改密码</h4>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-xs-12 col-sm-5">
                      <div class="form-group middle">
                        <span>
                          <label for="tOldPwd"><span class="red">*</span>旧密码：</label>
                          <input id="tOldPwd" class="input-large" type="password" name="tOldPwd" placeholder="旧密码">
                        </span>
                      </div>
                      <div class="form-group">
                        <span>
                          <label for="tNewPwd"><span class="red">*</span>新密码：</label>
                          <input class="input-large" type="password" id="tNewPwd" name="tnNewPwd" placeholder="新密码">
                        </span>
                      </div>
                      <div class="form-group">
                        <span>
                          <label for="tNewPwdAgain"><span class="red">*</span>重复新密码</label>
                          <input class="input-large" type="password" id="tNewPwdAgain" name="tNewPwdAgain" placeholder="重复新密码">
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-xs-12">
                      <p class="warning" id="changePwdNotice"></p>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-sm" data-dismiss="modal">
                    <i class="ace-icon fa fa-times"></i> 取消
                  </button>
                  <button id="btnChangePwd" class="btn btn-sm btn-primary">
                    <i class="ace-icon fa fa-save"></i> 保存
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- change password modal dialog end -->
        <!--BEGIN logout modal dialog -->
        <div id="logout-dlg" class="modal" tabindex="-1">
          <div class="modal-dialog">
            <div class="modal-content">
              <form id="FORM_LOG_OUT" action='<c:url value="/logout"/>' method="get">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="warning bigger">警告</h4>
                </div>
                <div class="modal-body">
                  <h3 class="bigger">是否退出系统？</h3>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-sm" data-dismiss="modal">
                    <i class="ace-icon fa fa-times"></i> 取消
                  </button>
                  <button id="btnLogout" class="btn btn-sm btn-primary" type="submit">
                    <i class="ace-icon fa fa-check"></i> 确定
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!--END logout modal dialog -->
      </div>
      <!-- /.page-content -->
    </div>
    <!-- /.main-content -->

    <div class="footer" >
      <div class="footer-inner" >
        <!-- #section:basics/footer -->
        <div class="footer-content" style="background-color: #EEE;">
          <span class="bigger-120">
            <span class="blue bolder">xxx有限公司</span>
            &copy; 2018
          </span>
        </div>

        <!-- /section:basics/footer -->
      </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
      <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
  </div>
  <!-- /.main-container -->

  <!-- basic scripts -->

  <!--[if !IE]> -->
  <script type="text/javascript">
			window.jQuery || document.write("<script src='<c:url value="/resources/js/jquery.min.js" />'>"+"<"+"/script>");
		</script>

  <!-- <![endif]-->

  <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<c:url value="/resources/js/jquery1x.min.js" />'>"+"<"+"/script>");
</script>
<![endif]-->
  <script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<c:url value="/resources/js/jquery.mobile.custom.min.js" />'>"+"<"+"/script>");
		</script>
  <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

  <!-- ace scripts -->
  <script type="text/javascript" src='<c:url value="/resources/js/ace-elements.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/ace.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/jquery-ui.custom.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/jquery.ui.touch-punch.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/jquery.validate.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/additional-methods.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/bootbox.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/date-time/moment.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/date-time/bootstrap-datepicker.min.js" />' ></script>  
  <script type="text/javascript" src='<c:url value="/resources/js/date-time/daterangepicker.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/date-time/locales/bootstrap-datepicker.zh-CN.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/chosen.jquery.min.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/uc/jquery.uc.page-helper.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/uc/jquery.uc.form-helper.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/uc/jquery.uc.validate.methods.js" />' ></script>
  <script type="text/javascript" src='<c:url value="/resources/js/jquery.md5.js" />' ></script>
  
  <script type="text/javascript">
	//Load content via ajax
	jQuery(function($) {
		ace.settings.sidebar_fixed(true);
				
		$('#change_pwd_dlg').on('shown.bs.modal', function(){
			$('#tOldPwd').val('');
			$('#tNewPwd').val('');
      $('#tNewPwdAgain').val('');
		});
						
		$('#FORM_CHANGE_PWD').submit(function(event){
			if($('#tOldPwd').val()==='' ||
				$('#tNewPwd').val()===''){
				$("#changePwdNotice").text("密码不能为空！");
				return false;
			}
			if($('#tNewPwd').val() != $('#tNewPwdAgain').val()) {
				$("#changePwdNotice").text("两次密码必须一致!");
				return false;
			}
			
			var oldPwdMd5=$.md5($('#tOldPwd').val());
			var newPwdMd5=$.md5($('#tNewPwd').val());
			$('#tOldPwd').val('');
			$('#tNewPwd').val('');
			$('#tNewPwdAgain').val('');			
			$.ajax({
				type : 'POST',
				url : '<c:url value="/changePwd" />',
				data : {
					password : oldPwdMd5,
					newPassword : newPwdMd5
				}
			})
			.done(function(data, status) {
				if (data == 'OK') {
					$('#change_pwd_dlg').modal('hide');
				} else {
					$("#changePwdNotice").text("修改密码错误[" + data	+ "]！");
				}
			})
			.fail(function(xhr, status, excepts) {
				$("#changePwdNotice").text("修改密码错误[" + status	+ ":" + except	+ "]！");
			});
			return false;
		});
		
		$('#rooms').on('click','.room-btn', function(){
			console.log('btn clicked['+ $(this).attr('data-room') +']...');			
		});
		
		$('#storeyButtons').on('change', 'input[data-storey]', function(){
			if($(this).prop('checked')){
				console.log('storey['+$(this).attr('data-storey') +'] selected ');				
			  var hiddenItem=".room-btn[data-storey!='"+ $(this).attr('data-storey') +"']:visible";
			  console.log('hiddenItem:' + hiddenItem);
			  var visibleItem=".room-btn[data-storey='"+ $(this).attr('data-storey') +"']";
			  console.log('visibleItem:' + visibleItem);
			  $(hiddenItem).addClass('hidden');
			  $(visibleItem).removeClass('hidden');
			  return true;
			}
		});
		
		$('#roomSearch').keydown(function(){
			$('.room-btn').addClass('hidden');
			var filter=".room-btn[data-room*='"+ $(this).val() +"']";
			$(filter).removeClass('hidden');
		});
		
	  var buildStoreys=function(storeys){
		  var $buttons=$('#storeyButtons');
	    $buttons.html('');
	    for(var i=0; i< storeys.length; i++){
	      var $button=$('<label class="btn btn-lg  btn-block storey" ><input type="radio" data-storey="'+ 
	           storeys[i] + '" value="'+ storeys[i] +
	           '"/>'+ storeys[i] + '层</label>');
	      $buttons.append($button);
	    }
	  };
	  var buildRooms=function(rooms){
	    var $rooms=$('#rooms');
	    $rooms.html('');
	    for(var i=0; i<rooms.length; i++){
	      var $room=$('<div class="room-btn" data-storey="'+ rooms[i].storey + '" data-room="'+ rooms[i].roomNo + '">'+
	          '<div class="room-plate">'+ rooms[i].roomNo + '</div>' +
	          '<div class="">入住时间：'+ (rooms[i].chekinTime?rooms[i].chekinTime:'') +'</div>' +
	          '<div class=""><div class="info">使用次数：</div>'+ 
	          '<div class="">' +rooms[i].useTimes + '</div>' +
	          '<div class="charge-panel"><div class="info">应付款：</div>' +          
	          '<div class="charge red"><strong>'+ rooms[i].charge + '</strong></div></div></div>');
	          $rooms.append($room);    
	    }
	  };		
		
		var refreshRooms=function(){
			$.ajax({
				url : '<c:url value="/hotel/reception/rooms" />',
				type : 'post',
				data : '',
				dataType : 'json'
			}).done(function(data){
				console.log('return data=' + data.storeys);
				if(data && data.storeys){
					buildStoreys(data.storeys);
				}
				if(data && data.rooms){
					buildRooms(data.rooms);
				}
			});
		};

		setInterval(refreshRooms, 10000);		
	});
</script>
</body>
</html>
