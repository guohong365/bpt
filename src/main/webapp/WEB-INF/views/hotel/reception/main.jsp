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
<link rel="stylesheet" href='<c:url value="/resources/css/jquery.gritter.css" />' />
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
 top:240px;
 margin:auto;
 height: 280px;
 width:560px;
 position: relative;
}
div.check-in{
  box-sizing: border-box;
  margin:10px;
  width: 260px;
  height: 260px;
  float:left;
}
.check-in-btn{  
  height: 260px;
  width:260px;  
  background-image: url('<c:url value="/resources/images/check-in.png" />');
  background-repeat: no-repeat; 
}

div.check-in img {
  display:inline;
  padding:10px;
  width: 260px;
  background-color: #EEEEEE;
  border: 1px solid #CCCCCC;  
}

div.check_in img:hover{
  border: 1px solid #EBEBEB;
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

    <div class="main-content">

      <div class="page-content">
        <div id="rooms" class="page-content-area"><!-- ajax content goes here -->
          <div class="row">
            <div class="col-sm-4 col-sm-offset-4">
              <div class="room-btn">
                <div class="check-in">
                  <a data-check-action="checkin" href="#">
                  <img src='<c:url value="/resources/images/check-in.png" />' alt="入住" >
                  </a>                  
                </div>
                <div class="check-in">    
                  <a data-check-action="checkout" href="#">
                    <img src='<c:url value="/resources/images/check-out.png" />' alt="退房" >
                  </a>
                </div>                              
              </div>
            </div>
          </div>
        </div><!-- /.page-content-area -->
        <div id="room_input_dlg" class="modal" tabindex="-1" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <form id="room_input_form" action="#" class="form-horizontal">
                <input type="hidden" id="isCheckIn" value="">
                <div class="modal-header">
                  <button class="close" data-dismiss="modal" type="button">&times;</button>
                  <h4 class="blue">房间号</h4>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-xs-12">
                      <label class="control-label col-xs-12 col-sm-3">房间号：</label>
                      <div class="col-xs-12 col-sm-9">
                        <input id="roomNo" class="form-control input-large" type="text" />
                      </div>  
                    </div>
                  </div>
                  <div class="row"">  
                    <div  class="col-xs-12">  
                      <div id="room_input_error" class="col-xs-12 col-sm-9 col-sm-offset-3">
                      </div>                    
                    </div>                  
                  </div>
                </div> 
                <div class="modal-footer">
                  <button class="btn btn-primary" type="submit">确定</button>
                  <button class="btn" data-dismiss="modal" type="button">取消</button>
                </div>               
              </form>
            </div>
          </div>
        </div>
        
        <div id="room_checkin_dlg" class="modal" tabindex="-1" data-backdrop="static">
          <div class="modal-dialog">
            <form id="room_checkin_form" class="form-horizontal" action="#">
            <div class="modal-content">
              <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4>入住登记</h4>
              </div>
              <div class="modal-body">
                <div class="row">
                  <div class="col-xs-12">
                    <h2 id="checkin_prompt"></h2>
                  </div>
                </div>                
              </div>
              <div class="modal-footer">
                <button class="btn btn-primary" type="submit">确定</button>
                <button class="btn" data-dismiss="modal" type="button">取消</button>
              </div>
            </div>
            </form>
          </div>
        </div>
        
        <div id="room_checkout_dlg" class="modal" tabindex="-1" data-backdrop="static">
          <div class="modal-dialog">          
            <div class="modal-content">
              <form id="room_checkout_form" action="#">
              <div class="modal-header">
                <button class="close" data-dismiss="modal" type="button">&times;</button>
                <h4 class="blue">退房</h4>
              </div>
              <div id="checkout-content" class="modal-body">
                
              </div>
              <div class="modal-footer">
                <button class="btn btn-primary" type="submit">确定</button>
                <button class="btn" data-dismiss="modal" type="button">取消</button>
              </div>
              </form>
            </div>
          </div>
        </div>
        <!-- change password modal dialog -->
        <div id="change_pwd_dlg" class="modal" tabindex="-1" data-backdrop="false">
          <div class="modal-dialog">
            <div class="modal-content">
              <form id="FORM_CHANGE_PWD" class="form-horizontal" role="from">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="blue bigger">修改密码</h4>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">                        
                        <label for="tOldPwd" class="control-label col-xs-12 col-sm-3"><span class="red">*</span>旧密码：</label>
                        <div class="col-xs-12 col-sm-9">
                          <input id="tOldPwd" class="form-control" type="password" name="tOldPwd" placeholder="旧密码">
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">  
                      <div class="form-group">
                          <label for="tNewPwd" class="control-label col-xs-12 col-sm-3"><span class="red">*</span>新密码：</label>
                          <div class="col-xs-12 col-sm-9">
                            <input class="form-control" type="password" id="tNewPwd" name="tnNewPwd" placeholder="新密码">
                          </div>  
                      </div>
                    </div>
                    <div class="col-xs-12">  
                      <div class="form-group">
                        <label for="tNewPwdAgain" class="control-label col-xs-3"><span class="red">*</span>重复新密码：</label>
                        <div class="col-xs-12 col-sm-9">
                          <input class="form-control" type="password" id="tNewPwdAgain" name="tNewPwdAgain" placeholder="重复新密码">
                        </div>  
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

    <div class="footer" >0
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
  <script type="text/javascript" src="<c:url value="/resources/js/uncompressed/bootstrap.js" />"></script>

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
  <script type="text/javascript" src='<c:url value="/resources/js/jquery.gritter.min.js" />' ></script>
  
  <script type="text/javascript">
	//Load content via ajax
	jQuery(function($) {
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
		
		$('.check-in a').on('click',function(event){
			event.preventDefault();
			switch($(this).attr('data-check-action')){
			case 'checkin':
				console.log('checkin clicked....');
				$('#isCheckIn').val('true')
		    $('#room_input_dlg').modal('show');
				break;
		  case 'checkout':
			  console.log('checkout clicked....');
			  $('#isCheckIn').val('false')
				$('#room_input_dlg').modal('show');
        break;			
			}
		});
		
		$('#room_input_dlg').on('show.bs.modal', function(){
			$('#room_input_error').html('');
			$('#roomNo').val('');
		});
		
		var buildCheckOutContent=function($con, data){
			var html='<div class="row"><div class="col-xs-12"><div class="widget-box"><div class="widget-header red"><h4 class="widget-title">'+
			        data.roomNo +
			        '</h4></div><div class="widget-body"><div class="widget-main"><div class="row"><div class="col-xs-12 col-sm-6">'+
			        '共使用' + (data.data && data.data.usages? data.data.usages.length:0)+'次'
			        +'</div></div>';
			if(data.data && data.data.usages && data.data.usages.length>0){
				  html +='<input type="hidden" name="checkIn" value="'+ data.data.checkIn +'" />';
				  html +='<input type="hidden" name="charge" value="' + data.data.charge +'" />';
				  html +='<div id="detailTable" class="row hidden"><div class="col-xs-12"><table class="table table-striped"><thead><tr><td>设备号</td><td>使用时间</td><td>收费</td></tr></thead>'+
				  '<tbody>';
				  for(var i=0; i<data.data.usages.length; i++){
					  html +='<tr>'+ '<input type="hidden" name="id" value="'+ data.data.usages[i].id +'" />'
					     +'<td>'+data.data.usages[i].deviceSerial +'</td><td>'+ data.data.usages[i].useTime +'</td><td>'+data.data.usages[i].charge +'</td></tr>';
				  }  
          html+='</tbody></table></div></div>';
			}    
      html+='</div><div class="widget-toolbox padding-8 clearfix"><button id="btnViewDetails" class="btn btn-large btn-primary pull-left" type="button">查看明细</button><h3 class="red pull-right">￥'+ data.data.charge + '</h3>'+
            '</div></div></div></div></div>';
      $con.html(html);      
		};
		
		$('#room_input_form').on('submit', function(event){
			event.preventDefault();
			if($('#roomNo').val()==''){
				$('#room_input_error').html('<p class="control-static red">请输入房间号！</p>')
				return;
			}
			var url='<c:url value="/hotel/reception/checkin" />';
			if($('#isCheckIn').val()==='false'){
				url='<c:url value="/hotel/reception/checkout" />';
			}
			$.ajax({
				async:false,
				type:'get',
				data:'roomNo=' + $('#roomNo').val(),
				url: url,
				dataType : 'json'
			}).done(function(data){
				if(data.ok){
					if($('#isCheckIn').val()=='true'){
					  $('#room_input_dlg').modal('hide');
					  $('#checkin_prompt').html('是否入住房间<strong class="red">'+data.roomNo+'</strong>?');
					  $('#room_checkin_dlg').modal('show');
					} else {						
						$('#room_input_dlg').modal('hide');
						buildCheckOutContent($('#checkout-content'), data);						
						$('#room_checkout_dlg').modal('show');
					}
				} else {
					$('#room_input_error').html('<p class="control-static red">'+ data.reason +'</p>');
				}
			});			
		});
		
		$('#checkout-content').on('click', '#btnViewDetails', function(event){
			$('#detailTable').removeClass('hidden');
		});
		
		$('#room_checkin_form').on('submit', function(event){
			event.preventDefault();
			$.ajax({
				type: 'post',
				data: 'roomNo=' + $('#roomNo').val(),
				url: '<c:url value="/hotel/reception/checkin" />',
				dataType:'json'
			}).fail(function(){
				$.gritter.add({
          title:'入住登记',
					text:'执行入住登记错误，请联系系统管理员！',
					class_name:'gritter-error'
					});
			}).done(function(data){
				if(data.ok){
				  $.gritter.add({
					  title:'入住登记',
					  text:'入住登记成功！',
					  class_name:'gritter-success'					
					});
				} else {
					$.gritter.add({
						title:'入住登记',
						text:'入住登记失败！' + data.reason,
					  class_name:'gritter-error'
					});
				}
			});
			$('#room_checkin_dlg').modal('hide');
		});
		
		$('#room_checkout_form').on('submit', function(event){
			event.preventDefault();
			$.ajax({
				type : 'post',
				url:  '<c:url value="/hotel/reception/checkout" />',
				data : $('#room_checkout_form').serialize(),
				dataType : 'text'
			}).fail(function(){
				$.gritter.add({
			    title:'退房',
			    text:'执行退房结算错误，请联系系统管理员！',
			    class_name:'gritter-error'
			  });
			}).done(function(data){
				if(data=="OK"){
					$.gritter.add({
				    title:'退房',
				    text:'退房结算完成！',
				    class_name:'gritter-success'
				    });
				} else {
					$.gritter.add({
				    title:'退房',
				    text:'执行退房结算错误，请联系系统管理员！',
				    class_name:'gritter-error'
				    });
				}
				$('#room_checkout_dlg').modal('hide');
			});
			
		});
		
		
	});
</script>
</body>
</html>
