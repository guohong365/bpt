<%@page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>血压计租赁管理系统</title>		
		<meta name="description" content="血压计租赁管理系统" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
		<!-- basic styles -->

		<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
		<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css" />" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome-ie7.min.css" />" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<!-- ace styles -->

		<link rel="stylesheet" href="<c:url value="/resources/css/ace.min.css" />" />
		<link rel="stylesheet" href="<c:url value="/resources/css/ace-rtl.min.css" />" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<c:url value="/resources/css/ace-ie.min.css" />" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="<c:url value="/resources/js/html5shiv.js" />"></script>
		<script src="<c:url value="/resources/js/respond.min.js" />"></script>
		<![endif]-->
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1><span class="white">血压计租赁管理系统</span></h1>
								<h4 class="blue">&copy; xxxx公司</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												请输入用户名和密码
											</h4>
											<div class="space-6"></div>
											<form id="loginForm" action="login" method="post">
												<fieldset>                          
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="登录名" name="userId"/>
															<i class="icon-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="password" type="password" class="form-control" placeholder="密码" name="password"/>
															<i class="icon-lock"></i>
														</span>
													</label>
                          <div class="red ${param.error==true ? '' : 'hidden' }">登录失败!</div>
													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> 记住我</span>
														</label>

														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="icon-key"></i>登录
														</button>
													</div>
													<div class="space-4"></div>
												</fieldset>
											</form>										
										</div><!-- /widget-main -->
									</div><!-- /widget-body -->
								</div><!-- /login-box -->
							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script src="<c:url value="/resources/js/jquery.min.js" />"></script>

		<!-- <![endif]-->

		<!--[if IE]>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery.min.js" /> >' + "<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
    <script type="text/javascript">
      window.jQuery || document.write("<script src='<c:url value="/resources/js/jquery1x.min.js" />'>"+"<"+"/script>");
    </script>
<![endif]-->
<script src='<c:url value="/resources/js/jquery.md5.js" />'></script>
<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='<c:url value="/resources/js/jquery.mobile.custom.min.js" />'>"+"<"+"/script>");
	//$('#loginForm').on('submit', function(){
	//var md5Pwd=$.md5($('#tPassword').val());
	//$('#tPassword').val('');
	//$('#password').val(md5Pwd);
	//return true;
	//});
</script>

<!-- inline scripts related to this page -->
  </body>
</html>
