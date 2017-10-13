<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>设备分配历史记录</title>

<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />" />
<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css' />" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="<c:url value='/resources/css/ace-fonts.css' />" />

<!-- ace styles -->
<link rel="stylesheet" href="<c:url value='/resources/css/ace.min.css' />" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="<c:url value='/resources/css/ace-part2.min.css' />" />
		<![endif]-->
<link rel="stylesheet" href="<c:url value='/resources/css/ace-skins.min.css' />" />
<link rel="stylesheet" href="<c:url value='/resources/css/ace-rtl.min.css' />" />
<link rel="stylesheet" href="<c:url value='/resources/css/chosen.css' />" />
<link rel="stylesheet" href="<c:url value="/resources/css/uc.data.css" />" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<c:url value='/resources/css/ace-ie.min.css' />" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<c:url value='/resources/js/ace-extra.min.js' />"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="<c:url value='/resources/js/html5shiv.min.js' />" ></script>
		<script src="<c:url value='/resources/js/respond.min.js' />"></script>
		<![endif]-->
</head>

<body class="no-skin">
  <div class="main-container" id="main-container">
    <div class="main-content">
      <div class="page-content">
        <div class="page-content-area">
          <div class="row">
            <div class="col-xs-12">
              <!-- PAGE CONTENT BEGINS -->

              <div class="widget-box">
                <div class="widget-header blue">
                  <h4 class="widget-title">${entiryName}</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">名称：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.name}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">型号：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.typeName}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">编号：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.serialNo}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">状态：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.statusDetail}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">酒店：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.hotelName}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">房间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.roomNo}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">公用：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.publicUsage}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="hr hr-2"></div>
                    <div class="row">
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-6">录入人：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static blue">${detailInput.inputerName}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-6">录入时间：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static blue"><fmt:formatDate value="${detailInput.inputTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-6">修改人：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static blue">${detailInput.modifierName}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-3">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-6">修改时间：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static blue"><fmt:formatDate value="${detailInput.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12">&nbsp;</div>
              </div>
              <div class="row" id="content_container">
                <div class="col-xs-12">
                  <div class="row"><!-- search condition begin -->
                    <div class="col-xs-12">
                      <form:form class="form-horizontal" role="form" modelAttribute="queryInput" action="#">
                        <form:hidden path="querySelectedId"/>
                        <form:hidden path="queryHotel"/>
                        <div class="row">
                          <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                              <form:label path="queryOperateTimeFrom" cssClass="control-label col-xs-12 col-sm-4">操作时间：</form:label>
                              <div class="col-xs-12 col-sm-8">
                                <div class="input-daterange input-group">
                                  <form:input cssClass="form-control" path="queryOperateTimeFrom" />
                                  <span class="input-group-addon">至 </span>
                                  <form:input cssClass="form-control" path="queryOperateTimeTo" />
                                  <span class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                  </span>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                              <form:label path="queryOperaterName" cssClass="control-label col-xs-12 col-sm-4">操作人：</form:label>
                              <div class="col-xs-12 col-sm-8">
                                <form:input path="queryOperaterName" cssClass="form-control" placeholder="输入操作人姓名..." />
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                              <form:label path="queryOperation" cssClass="control-label col-xs-12 col-sm-4">操作：</form:label>
                              <div class="col-xs-12 col-sm-8">
                                <form:select path="queryOperation" cssClass="form-contrl chosen-select">
                                  <form:option value="">全部</form:option>
                                  <form:options items="${_OPTS}" itemLabel="value" itemValue="code" />
                                </form:select>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="row">  
                          <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                              <form:label path="queryHotelName" cssClass="control-label col-xs-12 col-sm-4">酒店：</form:label>
                              <div class="col-xs-12 col-sm-8">
                                <form:input path="queryHotelName" cssClass="form-control" placeholder="输入酒店全部或部分名称。。。" />
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12 col-sm-6">
                            <div class="form-group">
                              <form:label path="queryRoom" cssClass="control-label col-xs-12 col-sm-4">房间：</form:label>
                              <div class="col-xs-12 col-sm-8">
                                <form:input path="queryRoom" cssClass="form-control" />
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-12">
                            <div class="btn-group pull-right">
                              <button class="btn btn-sm btn-success" id="btnReset" type="button">
                                <i class="ace-icon fa fa-refresh"></i>重置
                              </button>
                              <button class="btn btn-sm btn-primary" id="btnSearch" type="button">
                                <i class="ace-icon fa fa-search"></i>查询
                              </button>
                            </div>
                          </div>
                        </div>
                      </form:form>
                    </div>
                  </div><!-- search condition end -->
                  <div class="hr hr-8"></div>
                  <div class="row" id="listResult">
                    <form id="FORM_TABLE_FUNCTION" role="form" action="#" method="post">
                      <div class="dataTables_wrapper form-inline no-footer">
                        <div class="row">
                          <!-- functon button begin -->
                          <div class="col-xs-12">
                            <div class="btn-group pull-right">
                              <button class="btn btn-primary" type="button" data-export="export" id="btnExport">
                                <i class="ace-icon fa fa-file-excel-o"></i>导出Excel
                              </button>
                            </div>
                          </div>
                        </div>
                        <!-- function button end -->
                        <!-- table data begin-->
                        <input type="hidden" id="action" name="action" value="${action}" />
                        <input type="hidden" id="selectedId" name="selectedId" value="" />
                        <input type="hidden" id="queryInput.queryRoom" name="queryInput.queryRoom" value="${queryInput.queryRoom }" />
                        <input type="hidden" id="queryInput.querySelectedId" name="queryInput.querySelectedId" value="${queryInput.querySelectedId}">
                        <input type="hidden" id="queryInput.queryHotelName" name="queryInput.queryHotelName" value="${queryInput.queryHotelName }" />
                        <input type="hidden" id="queryInput.queryOperation" name="queryInput.queryOperation" value="${queryInput.queryOperation }" />
                        <input type="hidden" id="queryInput.queryOperaterName" name="queryInput.queryOperaterName" value="${queryInput.queryOperaterName }" />
                        <input type="hidden" id="queryInput.queryOperateTimeFrom" name="queryInput.queryOperateTimeFrom" value="${queryInput.queryOperateTimeFrom }" />
                        <input type="hidden" id="queryInput.queryOperateTimeTo" name="queryInput.queryOperateTimeTo" value="${queryInput.queryOperateTimeTo }" />
                        <input type="hidden" id="queryInput.queryAll" name="queryInput.queryAll" value="${queryInput.queryAll }" />
                        <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy }" />
                        <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}" />
            <input type="hidden" id="pageCtrl.pageSize" name="pageCtrl.pageSize" value="${pageCtrl.pageSize}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.offset" name="pageCtrl.offset" value="${pageCtrl.offset }" />
                        <table class="table table-striped table-bordered table-hover dataTable no-footer">
                          <thead>
                            <tr>
                              <th>操作时间</th>
                              <th>操作</th>
                              <th>酒店</th>
                              <th>房间</th>
                              <th>操作人</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="item" items="${records}">
                              <tr class="">
                                <td><fmt:formatDate value="${item.operateTime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></td>
                                <td>${item.operation}</td>
                                <td>${item.hotelName}</td>
                                <td>${item.roomNo}</td>
                                <td>${item.operaterName}</td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                        <!-- table data end -->
                        <div class="row">
                          <!-- functon button begin -->
                          <c:choose>
                            <c:when test="${pageCtrl.total > 0 }">
                              <div class="col-xs-12 col-sm-6">共${pageCtrl.pageCount }页${pageCtrl.total }条记录, 当前第${pageCtrl.page + 1}页</div>
                            </c:when>
                            <c:otherwise>
                              <div class="col-xs-12 col-sm-6">无记录</div>
                            </c:otherwise>
                          </c:choose>

                          <div class="col-xs-12 col-sm-6">
                            <div>
                              <c:set var="disableFirst" value="btn-info"></c:set>
                              <c:if test="${pageCtrl.page==0}">
                                <c:set var="disableFirst" value="disabled"></c:set>
                              </c:if>
                              <c:set var="disableLast" value="btn-info"></c:set>
                              <c:if test="${pageCtrl.total==0 or pageCtrl.page==pageCtrl.pageCount -1 }">
                                <c:set var="disableLast" value="disabled"></c:set>
                              </c:if>
                              <ul class="pagination">
                                <li>
                                  <button id="firstPage" class="btn btn-xs ${disableFirst }" data-page="first" type="button">首页</button>
                                </li>
                                <li>
                                  <button id="priorPage" class="btn btn-xs ${disableFirst }" data-page="prior" type="button">上一页</button>
                                </li>
                                <li>
                                  <button id="nextPage" class="btn btn-xs ${disableLast }" data-page="next" type="button">下一页</button>
                                </li>
                                <li>
                                  <button id="lastPage" class="btn btn-xs ${disableLast }" data-page="last" type="button">末尾</button>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                        <!-- function button end -->
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- PAGE CONTENT ENDS -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.page-content-area -->
      </div>
      <!-- /.page-content -->
    </div>
    <!-- /.main-content -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
      <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
  </div>
  <!-- /.main-container -->

  <!-- basic scripts -->
  <script
        src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous"></script>
  <!--[if !IE]> -->
  <script type="text/javascript">
			window.jQuery || document.write("<script src='"+ "<c:url value='/resources/js/jquery.min.js' />" + "'><"+" /script>");
  </script>
  <!-- <![endif]-->

  <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='"+ "<c:url value='/resources/js/jquery1x.min.js' />"+"'><"+"/script>");
</script>
<![endif] -->
<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='"+"<c:url value='/resources/jquery.mobile.custom.min.js' />"+"'><"+"/script>");
</script>

  <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

  <!-- page specific plugin scripts -->

  <!-- ace scripts -->
  <script src="<c:url value='/resources/js/ace-elements.min.js' />"></script>
  <script src='<c:url value="/resources/js/jquery-ui.custom.min.js" />'></script>
  <script src='<c:url value="/resources/js/jquery.ui.touch-punch.min.js" />'></script>
  <script src='<c:url value="/resources/js/jquery.validate.min.js" />'></script>
  <script src='<c:url value="/resources/js/additional-methods.min.js" />'></script>
  <script src='<c:url value="/resources/js/bootbox.min.js" />'></script>
  <script src='<c:url value="/resources/js/date-time/moment.min.js" />'></script>
  <script src='<c:url value="/resources/js/date-time/bootstrap-datepicker.min.js" />'></script>
  <script src='<c:url value="/resources/js/date-time/daterangepicker.min.js" />'></script>
  <script src='<c:url value="/resources/js/date-time/locales/bootstrap-datepicker.zh-CN.js" />'></script>
  <script src='<c:url value="/resources/js/chosen.jquery.min.js" />'></script>
  <script src='<c:url value="/resources/js/uc/jquery.uc.page-helper.js" />'></script>
  <script src='<c:url value="/resources/js/uc/jquery.uc.form-helper.js" />'></script>
  <script src='<c:url value="/resources/js/uc/jquery.uc.validate.methods.js" />'></script>
  
  <script type="text/javascript">  
  console.log('detail list loaded.....');  
  $(document).ready(function(){
    $('.chosen-select').chosen({ width : '100%'});    	

    $('.input-daterange').datepicker({
      format : 'yyyy-mm-dd',
      autoclose : true,
      todayHighlight : true,
      todayBtn : true,
      language : 'zh-CN'
    });
    	
    $('#content_container').bindPage({
	    bindPagation : false,
	    reset : function() {
		    $('#queryInput [name="queryOperateTimeFrom"]').val("");
		    $('#queryInput [name="queryOperateTimeTo"]').val("");
  		  $('#queryInput [name="queryHotelName"]').val("");
	  	  $('#queryInput [name="queryRoomNo"]').val("");
		    $('#queryInput [name="queryOperaterName"]').val("");
		    $('#queryInput [name="queryOperation"]').val("");
		    $('#queryInput [name="queryOperation"]').trigger('chosen:update');
		    },
		  baseUrl: '<c:url value="${baseUrl}/detail" />',
		});	
  });
  </script>  
</body>
</html>
