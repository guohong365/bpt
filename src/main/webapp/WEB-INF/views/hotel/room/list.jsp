<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<title>${modelTitle}</title>
<!-- ajax layout which only needs content area -->
<div class="row" id="content_container">
  <div class="col-xs-12">
    <!-- PAGE CONTENT BEGINS -->
    <div class="row">
      <!-- search condition begin -->
      <div class="col-xs-12">
        <form:form class="form-horizontal" role="form" modelAttribute="queryInput" action="#">
          <div class="row">
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryStorey" cssClass="control-label col-xs-12 col-sm-4">楼层：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <form:input path="queryStorey" cssClass="form-control" />
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryRoomNo" cssClass="control-label col-xs-12 col-sm-4">房间号：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <form:input path="queryRoomNo" cssClass="form-control" />
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <div class="col-xs-12 col-sm-8 col-sm-offset-4">
                  <form:label path="queryAll" cssClass="checkbox-inline">
                    <form:checkbox path="queryAll"></form:checkbox>所有  </form:label>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12">
              <div class="form-group align-right">
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
    </div>
    <!-- search condition end -->
    <div class="hr hr-8"></div>
    <div class="row">
      <!-- result table begin -->
      <div class="col-xs-12">
        <div id="listResult">
          <form id="FORM_TABLE_FUNCTION" role="form" action="#" method="post">
            <div class="dataTables_wrapper form-inline no-footer">
              <div class="row">
                <!-- functon button begin -->
                <div class="col-xs-12">
                  <div class="btn-group">
                    <button class="btn btn-sm btn-success" data-action="new" type="button">
                      <i class="ace-icon fa fa-pencil"></i>新建
                    </button>
                    <button class="btn btn-sm btn-success" data-action="batchNew" type="button">
                      <i class="ace-icon fa fa-pencil"></i>批量新建
                    </button>
                  </div>
                </div>
              </div>
              <!-- function button end -->
              <input type="hidden" id="action" name="action" value="${action}" />
              <input type="hidden" id="selectedId" name="selectedId" value="" />
              <input type="hidden" id="queryInput.queryStorey" name="queryInput.queryStorey" value="${queryInput.queryStorey}" />
              <input type="hidden" id="queryInput.queryRoomNo" name="queryInput.queryRoomNo" value="${queryInput.queryRoomNo}" />
              <input type="hidden" id="queryInput.queryAll" name="queryInput.queryAll" value="${queryInput.queryAll}" />
              
              <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy }" />
              <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}" />
            <input type="hidden" id="pageCtrl.pageSize" name="pageCtrl.pageSize" value="${pageCtrl.pageSize}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.offset" name="pageCtrl.offset" value="${pageCtrl.offset }" />
              <!-- table data begin-->
              <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                  <tr>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='楼层' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="楼层">楼层</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="楼层">楼层</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='房间号' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="房间号">房间号</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="房间号">房间号</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='设备名称' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="设备名称">设备名称</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="设备名称">设备名称</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='设备编号' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="设备编号">设备编号</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="设备编号">设备编号</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='设备状态' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="设备状态">设备状态</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="设备状态">设备状态</th>
                      </c:otherwise>
                    </c:choose>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${records}">
                  <c:set var="statuseClass" value=""></c:set>
                  <c:choose>
                    <c:when test="${item.deviceStatus==0}">
                      <c:set var="statusClass" value="label-success"></c:set>
                    </c:when>
                    <c:when test="${item.deviceStatus==15}">
                      <c:set var="statusClass" value="label-warning"></c:set>
                    </c:when>
                    <c:when test="${item.deviceStatus ge 1 and item.deviceStatus le 8}">
                      <c:set var="statusClass" value="label-danger"></c:set>
                    </c:when>
                    <c:otherwise>
                      <c:set var="statuseClass" value=""></c:set>
                    </c:otherwise>
                  </c:choose>                  
                    <tr>
                      <td>${item.storey}</td>
                      <td>${item.roomNo}</td>
                      <td>${item.deviceName}</td>
                      <td>${item.deviceSerial}</td>
                      <td>
                        <c:if test="${item.device!=null}">
                          <span class="label ${statusClass}">${item.deviceStatusString}</span>
                        </c:if>
                      </td>
                      <td>
                        <div class="btn-group">
                          <button data-original-title="查看" data-rel="tooltip" title="" class="btn btn-xs btn-info" data-action="view" data-item="${item.id }" type="button">
                            <i class="ace-icon fa fa-search bigger-120"></i>查看
                          </button>
                          <button data-original-title="修改" data-rel="tooltip" title="" class="btn btn-xs btn-warning" data-action="modify" data-item="${item.id }" type="button">
                            <i class="ace-icon fa fa-edit bigger-120"></i>修改
                          </button>
                          <button data-original-title="注销" data-rel="tooltip" title="" class="btn btn-xs btn-danger" data-action="cancel" data-item="${item.id }" type="button">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>注销
                          </button>
                        </div>
                      </td>
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
        <div id="dialogPanel"></div>
      </div>
    </div>
    <!-- result table end -->
  </div>
  <!-- PAGE CONTENT ENDS -->
</div>
<!-- page specific plugin scripts -->
<script type="text/javascript">
	var scripts = [ null, null ];
	ace.load_ajax_scripts(scripts, function() {
		$('#content_container').bindPage({
			reset : function() {
				$('#queryStorey').val();
				$('#queryRoomNo').val();
				$('#queryAll').prop('checked', false);
			},
			afterSave: function(){
				 $('[id="pageCtrl.total"]').val("-1");
				 console.log("set pageCtrl.total= -1....")
				 return true;
			},
			baseUrl : '<c:url value="${baseUrl}" />',
		});
	});
</script>