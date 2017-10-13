<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%><%@taglib prefix="spring"
  uri="http://www.springframework.org/tags"%><title>${modelTitle}</title>
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
                <form:label path="queryStatMethod" cssClass="control-label col-xs-12 col-sm-4">统计口径：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <form:select path="queryStatMethod" cssClass="form-control chosen-select">
                    <option value="1">按年</option>
                    <option value="2">按季度</option>
                    <option value="3">按月</option>
                  </form:select>
                </div>
              </div>
            </div>
          </div>          
          <div class="row">
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryHotels" cssClass="control-label col-xs-12 col-sm-4">酒店：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <form:select path="queryHotels" cssClass="form-control chosen-select" />
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryTimeFrom" cssClass="control-label col-xs-12 col-sm-4">统计时间区间：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon">自</span>
                    <form:input cssClass="form-control" path="queryTimeFrom" />
                    <span class="input-group-addon">至</span>
                    <form:input path="queryTimeTo" cssClass="form-control" />
                    <span class="input-group-addon">
                      <i class="fa fa-calendar"></i>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryIncomeFrom" cssClass="control-label col-xs-12 col-sm-4">酒店收入：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon">自</span>
                    <form:input cssClass="form-control" path="queryIncomeFrom" />
                    <span class="input-group-addon">至</span>
                    <form:input path="queryIncomeTo" cssClass="form-control" />
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryRentFrom" cssClass="control-label col-xs-12 col-sm-4">分成：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon">自</span>
                    <form:input cssClass="form-control" path="queryRentFrom" />
                    <span class="input-group-addon">至</span>
                    <form:input path="queryRentTo" cssClass="form-control" />
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryState" cssClass="control-label col-xs-12 col-sm-4">付款状态：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <form:select path="queryState" cssClass="form-control chosen-select" >
                   <form:options items="${_QUERY_STATE}" itemLabel="value" itemValue="code" />
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryPayTimeFrom" cssClass="col-xs-12 col-sm-4 control-label">付款时间：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <div class="input-daterange input-group">
                    <form:input path="queryPayTimeFrom" cssClass="form-control" />
                    <span class="input-group-addon">至 </span>
                    <form:input path="queryPayTimeTo" cssClass="form-control" />
                    <span class="input-group-addon">
                      <i class="fa fa-calendar"></i>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryPayerName" cssClass="control-label col-xs-12 col-sm-4">付款人：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <form:input path="queryPayerName" cssClass="form-control" />
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryVerifyTimeFrom" cssClass="col-xs-12 col-sm-4 control-label">确认时间：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <div class="input-daterange input-group">
                    <form:input path="queryVerifyTimeFrom" cssClass="form-control" />
                    <span class="input-group-addon">至 </span>
                    <form:input path="queryVerifyTimeTo" cssClass="form-control" />
                    <span class="input-group-addon">
                      <i class="fa fa-calendar"></i>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-lg-4">
              <div class="form-group">
                <form:label path="queryVerifierName" cssClass="control-label col-xs-12 col-sm-4">确认人：</form:label>
                <div class="col-xs-12 col-sm-8">
                  <form:input path="queryVerifierName" cssClass="form-control" />
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
                  <div class="btn-group pull-right">    
                    <button class="btn btn-primary" type="button" data-export="export" id="btnExport">
                      <i class="ace-icon fa fa-file-excel-o"></i>导出Excel</button>
                  </div>               
                </div>
              </div>
              <!-- function button end -->
              <input type="hidden" id="action" name="action" value="${action}" />
              <input type="hidden" id="selectedId" name="selectedId" value="" />
              <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy }" />
              <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}" />
            <input type="hidden" id="pageCtrl.pageSize" name="pageCtrl.pageSize" value="${pageCtrl.pageSize}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.offset" name="pageCtrl.offset" value="${pageCtrl.offset }" />
              <input type="hidden" id="queryInput.queryHotels" name="queryInput.queryHotels" value="${queryInput.queryHotels}" />
              <input type="hidden" id="queryInput.queryTimeFrom" name="queryInput.queryTimeFrom" value="${queryInput.queryTimeFrom}" />
              <input type="hidden" id="queryInput.queryTimeTo" name="queryInput.queryTimeTo" value="${queryInput.queryTimeTo}" />
              <input type="hidden" id="queryInput.queryIncomeFrom" name="queryInput.queryIncomeFrom" value="${queryInput.queryIncomeFrom}" />
              <input type="hidden" id="queryInput.queryIncomeTo" name="queryInput.queryIncomeTo" value="${queryInput.queryIncomeTo}" />
              <input type="hidden" id="queryInput.queryRentFrom" name="queryInput.queryRentFrom" value="${queryInput.queryRentFrom}" />
              <input type="hidden" id="queryInput.queryRentTo" name="queryInput.queryRentTo" value="${queryInput.queryRentTo}" />
              <input type="hidden" id="queryInput.queryState" name="queryInput.queryState" value="${queryInput.queryState}" />
              <input type="hidden" id="queryInput.queryPayTimeFrom" name="queryInput.queryPayTimeFrom" value="${queryInput.queryPayTimeFrom}" />
              <input type="hidden" id="queryInput.queryPayTimeTo" name="queryInput.queryPayTimeTo" value="${queryInput.queryPayTimeTo}" />
              <input type="hidden" id="queryInput.queryPayerName" name="queryInput.queryPayerName" value="${queryInput.queryPayerName}" />
              <input type="hidden" id="queryInput.queryVerifyTimeFrom" name="queryInput.queryVerifyTimeFrom" value="${queryInput.queryVerifyTimeFrom}" />
              <input type="hidden" id="queryInput.queryVerifyTimeTo" name="queryInput.queryVerifyTimeTo" value="${queryInput.queryVerifyTimeTo}" />
              <input type="hidden" id="queryInput.queryVerifierName" name="queryInput.queryVerifierName" value="${queryInput.queryVerifierName}" />
              <input type="hidden" id="queryInput.queryAll" name="queryInput.queryAll" value="${queryInput.queryAll}" />
              <!-- table data begin-->
              <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                  <tr>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='生成时间' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="生成时间">账单时间</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="生成时间">生成时间</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='酒店' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="酒店">酒店</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="酒店">酒店</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='酒店收入' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="酒店收入">酒店收入</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="酒店收入">酒店收入</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='分成收入' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="分成收入">分成收入</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="分成收入">分成收入</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='分成' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="分成">分成</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="分成">分成</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='状态' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="状态">状态</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="状态">状态</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='付款时间' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="付款时间">付款时间</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="付款时间">付款时间</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='付款人' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="付款人">付款人</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="付款人">付款人</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='确认时间' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="确认时间">确认时间</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="确认时间">确认时间</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='确认人' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="确认人">确认人</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="确认人">确认人</th>
                      </c:otherwise>
                    </c:choose>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${records}">
                    <tr>
                      <td><fmt:formatDate value="${item.generatedTime}" pattern="yyyy年MM月dd日" /></td>
                      <td>${item.hotelName}</td>
                      <td><fmt:formatNumber value="${item.income}" type="currency" currencySymbol="￥" maxFractionDigits="2" /></td>
                      <td><fmt:formatNumber value="${item.basicCharge}" type="currency" currencySymbol="￥" maxFractionDigits="2" /></td>
                      <td><fmt:formatNumber value="${item.rent}" type="currency" currencySymbol="￥" maxFractionDigits="2" /></td>
                      <td>${item.state}</td>
                      <td><fmt:formatDate value="${item.payTime}" pattern="yyyy年MM月dd日" /></td>
                      <td>${item.payerName}</td>
                      <td><fmt:formatDate value="${item.verifyTime}" pattern="yyyy年MM月dd日" /></td>
                      <td>${item.verifierName}</td>
                      <td>
                        <div class="btn-group">
                          <c:if test="${item.payTime!=null && item.verifyTime==nulll}">
                          <button data-original-title="确认收款" data-rel="tooltip" title="" class="btn btn-xs btn-danger" data-action="verify" data-item="${item.id }" type="button">
                            <i class="ace-icon fa fa-edit bigger-120"></i>确认收款
                          </button>
                          </c:if>
                          <button data-original-title="查看" data-rel="tooltip" title="" class="btn btn-xs btn-primary" data-action="view" data-item="${item.id }" type="button">
                            <i class="ace-icon fa fa-search bigger-120"></i>查看
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
		$('.chosen-select').chosen({
			width : '100%'
		});
		$('.date-picker').datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true,
			todayHighlight : true,
			todayBtn : true,
			language : 'zh-CN',
			endDate : new Date()
		});
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
				$('#queryHotelName').val();
				$('#queryPayableFrom').val();
				$('#queryPayableTo').val();
				$('#queryIncomeFrom').val();
				$('#queryIncomeTo').val();
				$('#queryState').val();
				$('#queryGeneratedTimeFrom').val();
				$('#queryGeneratedTimeTo').val();
				$('#queryPayTimeFrom').val();
				$('#queryPayTimeTo').val();
				$('#queryPayerName').val();
				$('#queryVerifyTimeFrom').val();
				$('#queryVerifyTimeTo').val();
				$('#queryVerifierName').val();
				$('#queryAll').prop('checked', false);
			},
			afterSave : function() {
				return true;
			},
			baseUrl : '<c:url value="${baseUrl}" />',
		});
	});
</script>