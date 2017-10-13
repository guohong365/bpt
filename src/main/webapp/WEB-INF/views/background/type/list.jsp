<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<title>${modelTitle }</title>
<!-- ajax layout which only needs content area -->
<div class="row" id="content_container">
  <div class="col-xs-12"><!-- PAGE CONTENT BEGINS -->
    <div class="row"><!-- search condition begin -->
      <div class="col-xs-12">
        <form:form class="form-horizontal" role="form" modelAttribute="queryInput" action="#">   
        <div class="row">       
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryProduct" cssClass="control-label col-sm-4">产品名称：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:input path="queryProduct" cssClass="form-control" placeholder="输入产品部分或全部名称..."/>
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryName" cssClass="control-label col-sm-4">型号名称：</form:label>
              <div class="col-xs-12 col-sm-8">
                <form:input path="queryName" cssClass="form-control" placeholder="输入型号部分或全部名称..." />
              </div>
            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-lg-4">
            <div class="form-group">
              <form:label path="queryAll" cssClass="control-label col-sm-offset-4">
              <form:checkbox path="queryAll" cssClass="checkbox-inline"></form:checkbox>&nbsp;包括注销型号</form:label>
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
    <div class="row"><!-- result table begin -->
      <div class="col-xs-12" >
        <div id="listResult">
        <form id="FORM_TABLE_FUNCTION" role="form" action="#" method="post">          	
          <div class="dataTables_wrapper form-inline no-footer">
            <div class="row">
              <!-- functon button begin -->
              <div class="col-xs-12">
                <button class="btn btn-sm btn-success" data-action="new" type="button">
                  <i class="ace-icon fa fa-pencil"></i>
                  新增
                </button>
              </div>
            </div>
            <!-- function button end -->
            <!-- table data begin-->
            <input type="hidden" id="action" name="action" value="${action}" />
            <input type="hidden" id="selectedId" name="selectedId" value="" />
            <input type="hidden" id="queryInput.queryProduce" name="queryInput.queryProduct"  value="${queryInput.queryProduct }" />
            <input type="hidden" id="queryInput.queryName" name="queryInput.queryName"  value="${queryInput.queryName }" />
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
                      <c:when test="${queryInput.queryOrderBy =='产品名称' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="产品名称">产品名称</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="产品名称">产品名称</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='型号' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="型号">型号</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="型号">型号</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='显示顺序' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="显示顺序">显示顺序</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="显示顺序">显示顺序</th>
                      </c:otherwise>
                    </c:choose>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${records}">
                    <c:set var="delClass" value=""></c:set>
                    <c:if test="${!item.valid}">
                      <c:set var="delClass" value="deleted-text red"></c:set>
                    </c:if>
                    <tr class="${delClass }">
                      <td>${item.product}</td>
                      <td>${item.name}</td>
                      <td>${item.showOrder}</td>
                      <td>
                        <div class="hidden-sm hidden-xs btn-group">
                          <button data-original-title="编辑" data-rel="tooltip" title="" class="btn btn-xs btn-warning tooltip-warning" data-action="modify" data-item="${item.id }" type="button">
                            <i class="ace-icon fa fa-edit bigger-120"></i>
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
            </div><!-- function button end -->          
          </div>
        </form>
        
        </div>
        <div id="dialogPanel"></div>        
      </div>
    </div><!-- result table end -->

    <!-- PAGE CONTENT ENDS -->
  </div>
  <!-- /.col -->
</div>
<!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
	var scripts = [ null, null ]
	ace.load_ajax_scripts(scripts, function() {
		
		$('.chosen').chosen({width:'100%'});
		
		$('#content_container').bindPage({
			bindPagation : false,
			reset : function() {
				$('#queryInput [name="queryAll"]').attr("checked", false);
			},
			afterSave : function (){
				return true;
			},		
			baseUrl: '<c:url value="${baseUrl}" />',
		});
	});
</script>
