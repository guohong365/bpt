<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<title>${modelTitle }</title>
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
              <form:label path="queryName" cssClass="control-label col-xs-12 col-sm-4">产品名称：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:input cssClass="form-control" path="queryName" placeholder="输入产品部分或全部..." />
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryType" cssClass="control-label col-xs-12 col-sm-4">设备型号：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:select path="queryType" cssClass="form-contrl chosen-select">
                  <form:option value="">全部</form:option>
                  <form:options items="${_types}" itemLabel="value" itemValue="code"/>
                </form:select>
              </div>  
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="querySerialNo" cssClass="control-label col-xs-12 col-sm-4">设备序列号：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:input path="querySerialNo" cssClass="form-control" placeholder="输入设备全部或部分序列号" />
              </div>
            </div>
          </div>

          
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryHotelName" cssClass="control-label col-xs-12 col-sm-4">酒店名称：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:input path="queryHotelName" cssClass="form-control" placeholder="输入酒店全部或部分名称" />
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryRoomNo" cssClass="control-label col-xs-12 col-sm-4">房间号：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:input path="queryRoomNo" cssClass="form-control" placeholder="输入房间号全部或部分" />
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryStatus" cssClass="control-label col-xs-12 col-sm-4">状态：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:select path="queryStatus" cssClass="form-control chosen-select"  >
                   <form:option value="">所有</form:option>
                   <form:option value="1">正常</form:option>
                   <form:option value="2">报警</form:option>
                   <form:option value="3">故障</form:option>
                   <form:option value="4">未知</form:option>
                </form:select>
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryAll" cssClass="control-label col-sm-offset-4">
              <form:checkbox path="queryAll" cssClass="checkbox-inline"></form:checkbox>&nbsp;包括报废设备</form:label>
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
      <div class="col-xs-12" >
        <div id="listResult">
        <form id="FORM_TABLE_FUNCTION" role="form" action="#" method="post">          	
          <div class="dataTables_wrapper form-inline no-footer">
            <div class="row">
              <!-- functon button begin -->
              <div class="col-xs-12">
              <div class="btn-group">
                <button class="btn btn-success" data-action="new" type="button">
                  <i class="ace-icon fa fa-pencil"></i>新增
                </button>
                <button class="btn btn-success" type="button" id="btnBatchAdd">
                  <i class="ace-icon fa fa-plus"></i>批量新增
                </button>
                <button class="btn btn-success" type="button" id="btnBatchAssign">
                  <i class="ace-icon fa fa-arrow-left"></i>批量分配</button>
              </div>
              <div class="btn-group">   
                <button class="btn btn-warning" type="button" id="btnBatchUnassign">
                  <i class="ace-icon fa fa-arrow-right"></i>批量收回
                </button>
                <button class="btn btn-danger" type="button" id="btnBatchScrp">
                  <i class="ace-icon fa fa-trash"></i>批量报废</button>
              </div>
              <div class="btn-group pull-right">    
                <button class="btn btn-primary" type="button" data-export="export" id="btnExport">
                  <i class="ace-icon fa fa-file-excel-o"></i>导出Excel</button>
              </div>
              </div>
            </div>
            <!-- function button end -->
            <!-- table data begin-->
            <input type="hidden" id="action" name="action" value="${action}" />
            <input type="hidden" id="selectedId" name="selectedId" value="" />
            <input type="hidden" id="queryInput.querySerialNo" name="queryInput.querySerialNo" value="${queryInput.querySerialNo }" />
            <input type="hidden" id="queryInput.queryHotelName" name="queryInput.queryHotelName" value="${queryInput.queryHotelName }" />
            <input type="hidden" id="queryInput.queryName" name="queryInput.queryName" value="${queryInput.queryName }" />
            <input type="hidden" id="queryInput.queryRoomNo" name="queryInput.queryRoomNo" value="${queryInput.queryRoomNo }" />
            <input type="hidden" id="queryInput.queryType" name="queryInput.queryType" value="${queryInput.queryType }" />
            <input type="hidden" id="queryInput.queryStatus" name="queryInput.queryStatus" value="${queryInput.queryStatus }" />
            <input type="hidden" id="queryInput.queryAll" name="queryInput.queryAll"  value="${queryInput.queryAll }" />
            <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy }" />
            <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}" />
            <input type="hidden" id="pageCtrl.pageCount" name="pageCtrl.pageCount" value="${pageCtrl.pageCount}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.current" name="pageCtrl.current" value="${pageCtrl.current }" />
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
              <thead>
                <tr>
                  <th>名称</th>          
                  <th>型号</th>
                  <th>序列号</th>
                  <th>有效</th>
                  <th>酒店</th>
                  <th>房间</th>
                  <th>状态</th>                          
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${records}">
                  <c:set var="isValid" value="是"></c:set>
                  <c:set var="delClass" value=""></c:set>
                  <c:if test="${!item.valid}">
                    <c:set var="isValid" value="否"></c:set>
                    <c:set var="delClass" value="deleted-text red"></c:set>
                  </c:if>
                  <c:set var="roomUsage" value="${item.roomNo}"></c:set>
                  <c:if test="${item.publicUsage}">
                    <c:set var="roomUsage" value="公用"></c:set>
                  </c:if>        
                  <c:set var="statuseClass" value=""></c:set>
                  <c:choose>
                    <c:when test="${item.status==0}">
                      <c:set var="statusClass" value="label-success"></c:set>
                    </c:when>
                    <c:when test="${item.status==15}">
                      <c:set var="statusClass" value="label-warning"></c:set>
                    </c:when>
                    <c:when test="${item.status ge 1 and item.status le 8}">
                      <c:set var="statusClass" value="label-error"></c:set>
                    </c:when>
                    <c:otherwise>
                      <c:set var="statuseClass" value=""></c:set>
                    </c:otherwise>
                  </c:choose>
                   
                  <tr class="${delClass }">
                    <td>${item.name}</td>
                    <td>${item.typeName}</td>
                    <td>${item.serialNo}</td>
                    <td>${isValid}</td>                    
                    <td>${item.hotelName}</td>
                    <td>${roomUsage}</td>
                    <td><span class="label ${statusClass}">${item.statusDetail}</span></td> 
                    <td>
                      <div class="btn-group">                                        
                        <button class="btn btn-xs btn-success" data-action="assign" data-item="${item.id}">
                          <i class="ace-icon fa fa-arrow-left bigger-120"></i>分配</button>
                        <button class="btn btn-xs btn-success" data-action="viewDetail" data-item="${item.id}">
                          <i class="ace-icon fa fa-file-text bigger-120"></i>历史</button>
                        <button data-original-title="查看" data-rel="tooltip"  title="" class="btn btn-xs btn-info tooltip-info" data-action='view' data-item="${item.id }" type="button">
                          <i class="ace-icon fa fa-search bigger-120" ></i>
                        </button>
                        <button data-original-title="编辑" data-rel="tooltip"  title="" class="btn btn-xs btn-warning tooltip-warning" data-action="modify" data-item="${item.id }" type="button">
                          <i class="ace-icon fa fa-edit bigger-120"></i>
                        </button>
                        <c:if test="${item.valid}">
                          <button data-original-title="报废" data-rel="tooltip"  title="" class="btn btn-xs btn-danger tooltip-error" data-action="cancel" data-item="${item.id }" type="button">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                          </button>
                        </c:if>
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
                  <div class="col-xs-12 col-sm-6">共${pageCtrl.pageCount }页${pageCtrl.total }条记录, 当前第${pageCtrl.current + 1}页</div>
                </c:when>
                <c:otherwise>
                  <div class="col-xs-12 col-sm-6">无记录</div>
                </c:otherwise>
              </c:choose>
                
                <div class="col-xs-12 col-sm-6">
                  <div>
                    <c:set var="disableFirst" value="btn-info"></c:set>
                    <c:if test="${pageCtrl.current==0}">
                      <c:set var="disableFirst" value="disabled"></c:set>
                    </c:if>
                    <c:set var="disableLast" value="btn-info"></c:set>
                    <c:if test="${pageCtrl.current==0 or pageCtrl.current==pageCtrl.pageCount -1 }">
                      <c:set var="disableLast" value="disabled" ></c:set>
                    </c:if>                    
                    <ul class="pagination">
                      <li>
                        <button id="firstPage" class="btn btn-xs ${disableFirst }" data-page="first" type="button" >首页</button>
                      </li>
                      <li>
                        <button id="priorPage" class="btn btn-xs ${disableFirst }" data-page="prior" type="button"  >上一页</button>
                      </li>
                      <li>
                        <button id="nextPage" class="btn btn-xs ${disableLast }" data-page="next" type="button"  >下一页</button>
                      </li>
                      <li>
                        <button id="lastPage" class="btn btn-xs ${disableLast }" data-page="last" type="button" >末尾</button>
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

    <!-- PAGE CONTENT ENDS -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
	var scripts = [ null, null ]
	ace.load_ajax_scripts(scripts, function() {
		
		$('.chosen-select').chosen({width:"100%"});
		
		$('#content_container').bindPage(
		{
			bindPagation : false,
			reset : function() {
				$('#queryInput [name="querySerailNo"]').val("");
				$('#queryInput [name="queryHotelName"]').val("");
				$('#queryInput [name="queryRoomNo"]').val("");
				$('#queryInput [name="queryName"]').val("");
				$('#queryInput [name="queryType"]').val("");
				$('#queryInput [name="queryAll"]').attr("checked", false);
			},
			afterSave : function (){return true;},		
			baseUrl: '<c:url value="${baseUrl}" />', 
		});
		
		$('#btnBatchAdd').on('click', function(e){
			$.ajax({
				url: "<c:url value='/mgr/device/batchAdd' />",
				type : "get"				
			}).fail(function(){
				alert("error");
			}).done(function(data){
				$('#dialogPanel').html(data);
				$('#batchAdd-dialog').modal('show');
			})			
		});
		
	});
</script>
