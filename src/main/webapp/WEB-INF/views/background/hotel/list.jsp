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
              <form:label path="queryName" cssClass="control-label col-xs-12 col-sm-4">酒店名称：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:input path="queryName" cssClass="form-control" />
              </div>  
            </div>
          </div>          
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryTotalDeviceFrom" cssClass="control-label col-xs-12 col-sm-4">设备总数：</form:label>
              <div class="col-xs-12 col-sm-8">
                <div class="input-group">
                  <span class="input-group-addon">自</span>
                  <form:input cssClass="form-control" path="queryTotalDeviceFrom" placeholder="" />
                  <span class="input-group-addon">至</span>
                  <form:input path="queryTotalDeviceTo" cssClass="form-control"/>                  
              </div>
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryPublicUsageFrom" cssClass="control-label col-xs-12 col-sm-4">公用设备总数：</form:label>
              <div class="col-xs-12 col-sm-8">
                <div class="input-group">
                  <span class="input-group-addon">自</span>
                  <form:input cssClass="form-control" path="queryPublicUsageFrom" placeholder="" />
                  <span class="input-group-addon">至</span>
                  <form:input path="queryPublicUsageTo" cssClass="form-control"/>                  
                </div>
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryAll" cssClass="control-label col-sm-offset-4">
                <form:checkbox path="queryAll" cssClass="checkbox-inline"/>&nbsp;包括注销酒店
              </form:label>              
            </div>
          </div>          
        </div>
        <div class="row">  
          <div class="col-xs-12">
            <div class="form-group pull-right">
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
                    <i class="ace-icon fa fa-pencil"></i>新建</button>                  
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
            <input type="hidden" id="queryInput.queryName" name="queryInput.queryName" value="${queryInput.queryName }" />
            <input type="hidden" id="queryInput.queryTotalDeviceFrom" name="queryInput.queryTotalDeviceFrom" value="${queryInput.queryTotalDeviceFrom }" />
            <input type="hidden" id="queryInput.queryTotalDeviceTo" name="queryInput.queryTotalDeviceTo" value="${queryInput.queryTotalDeviceTo }" />
            <input type="hidden" id="queryInput.queryPublicUsageFrom" name="queryInput.queryPublicUsageFrom" value="${queryInput.queryPublicUsageFrom }" />
            <input type="hidden" id="queryInput.queryPublicUsageTo" name="queryInput.queryPublicUsageTo" value="${queryInput.queryPublicUsageTo }" />
            <input type="hidden" id="queryInput.queryAll" name="queryInput.queryAll"  value="${queryInput.queryAll }" />
            <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy }" />
            <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}" />
            <input type="hidden" id="pageCtrl.pageSize" name="pageCtrl.pageSize" value="${pageCtrl.pageSize}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.offset" name="pageCtrl.offset" value="${pageCtrl.offset }" />
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
              <thead>
                <tr>
                  <c:choose>
                    <c:when test="${queryInput.queryOrderBy=='酒店名称' }">
                      <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="酒店名称">酒店名称</th>
                    </c:when>
                    <c:otherwise>
                      <th class="sorting" data-column="酒店名称">酒店名称</th>
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when test="${queryInput.queryOrderBy=='设备总数' }">
                      <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="设备总数">设备总数</th>
                    </c:when>
                    <c:otherwise>
                      <th class="sorting" data-column="设备总数">设备总数</th>
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when test="${queryInput.queryOrderBy=='公用设备总数' }">
                      <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="公用设备总数">公用设备总数</th>
                    </c:when>
                    <c:otherwise>
                      <th class="sorting" data-column="公用设备总数">公用设备总数</th>
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when test="${queryInput.queryOrderBy=='已拥有' }">
                      <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="已拥有">已拥有</th>
                    </c:when>
                    <c:otherwise>
                      <th class="sorting" data-column="已拥有">已拥有</th>
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when test="${queryInput.queryOrderBy=='结算标准' }">
                      <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="结算标准">结算标准</th>
                    </c:when>
                    <c:otherwise>
                      <th class="sorting" data-column="结算标准">结算标准</th>
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when test="${queryInput.queryOrderBy=='分成比例' }">
                      <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="分成比例">分成比例</th>
                    </c:when>
                    <c:otherwise>
                      <th class="sorting" data-column="分成比例">分成比例</th>
                    </c:otherwise>
                  </c:choose> 
                  <c:choose>
                    <c:when test="${queryInput.queryOrderBy=='酒店收费' }">
                      <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="酒店收费">酒店收费</th>
                    </c:when>
                    <c:otherwise>
                      <th class="sorting" data-column="酒店收费">酒店收费</th>
                    </c:otherwise>
                  </c:choose>
                  <th>结算周期</th>
                  <th>地址</th>                          
                  <th>联系人</th>
                  <th>电话</th>
                  <th>备注</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${records}">
                  <c:set var="delClass" value=""/>
                  <c:if test="${!item.valid}">
                    <c:set var="delClass" value="deleted-text red"/>
                  </c:if>
                  
                  <tr class="${delClass}">
                    <td>${item.name}</td>
                    <td>${item.totalDevice}</td>
                    <td>${item.publicUsage}</td>
                    <td>${item.ownedDevice}</td>
                    <td><fmt:formatNumber value="${item.chargeStandard}" type="currency" currencySymbol="￥" maxFractionDigits="2" /></td>
                    <td><fmt:formatNumber value="${item.ratio}" type="percent" maxFractionDigits="2" /></td>
                    <td><fmt:formatNumber value="${item.charge}" type="currency" currencySymbol="￥" maxFractionDigits="2" /></td>                    
                    <td>${item.billingCycleString }</td>
                    <td>${item.address}</td>
                    <td>${item.linkman }</td>
                    <td>${item.tele }</td>
                    <td>${item.description}</td>
                    <td>
                      <div class="btn-group">
                        <button data-original-title="查看" data-rel="tooltip"  title="" class="btn btn-xs btn-info tooltip-info" data-action='view' data-item="${item.id }" type="button">
                          <i class="ace-icon fa fa-search bigger-120" ></i>查看
                        </button>
                        <button data-original-title="修改" data-rel="tooltip"  title="" class="btn btn-xs btn-warning tooltip-warning" data-action="modify" data-item="${item.id }" type="button">
                          <i class="ace-icon fa fa-edit bigger-120"></i>修改
                        </button>
                        <c:set var="disabled" value="" />
                        <c:if test="${item.canCancel==false}">
                          <c:set var="disabled" value="disabled" />
                        </c:if>
                        <c:if test="${item.valid}">
                        <button data-original-title="注销" data-rel="tooltip"  title="" class="btn btn-xs btn-danger tooltip-error ${disabled}" data-action="cancel" data-item="${item.id }" type="button">
                          <i class="ace-icon fa fa-ban bigger-120"></i>注销
                        </button>
                        </c:if>
                        <c:if test="${!item.valid}">
                        <button data-original-title="激活" data-rel="tooltip"  title="" class="btn btn-xs btn-success tooltip-info" data-action="reactive" data-item="${item.id }" type="button">
                          <i class="ace-icon fa fa-check bigger-120"></i>激活
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
				$('#queryInput [name="queryPublicUsageFrom"]').val("");
				$('#queryInput [name="queryPublicUsageTo"]').val("");
				$('#queryInput [name="queryName"]').val("");
				$('#queryInput [name="queryTotalDeviceFrom"]').val("");
				$('#queryInput [name="queryTotalDeviceTo"]').val("");
				$('#queryInput [name="queryAll"]').attr("checked", false);
			},
			beforeSave : function (){
				console.log('entry before save......');
				console.log()
				if(!$('#detailInput #action').val() || ($('#detailInput #action').val() !='new' && $('#detailInput #action').val()!='modify')) return true;
				console.log('retreive data....');
				var type= $('#detailInput #billingCycle').val();
				switch(type){
				case '周':
					$('#detailInput #billingDateParam1').val($('#detailInput #weekDay').val());
					$('#detailInput #billingDateParam2').val('');
					break;
				case '月':
					$('#detailInput #billingDateParam1').val('');
					$('#detailInput #billingDateParam2').val($('#detailInput #monthDay').val());
					break;
        case '季':
		      $('#detailInput #billingDateParam1').val($('#detailInput #quarterMonth').val());
		      $('#detailInput #billingDateParam2').val($('#detailInput #monthDay').val());
		      break;
		    case '年':
		      $('#detailInput #billingDateParam1').val($('#detailInput #month').val());
		      $('#detailInput #billingDateParam2').val($('#detailInput #monthDay').val());
		      break;
		    default:
		    	return false;
				}
				return true;
			},		
			baseUrl: '<c:url value="${baseUrl}" />', 
		});
		
	});
</script>
