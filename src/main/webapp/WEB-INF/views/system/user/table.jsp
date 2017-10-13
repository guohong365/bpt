<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form id="FORM_TABLE_FUNCTION" role="form" action="#" method="post">
  <div class="dataTables_wrapper form-inline no-footer">
    <div class="row">
      <!-- functon button begin -->
      <div class="col-xs-12">
        <button class="btn btn-sm btn-success" data-action="new" type="button">
          <i class="ace-icon fa fa-pencil"></i>新增
        </button>
      </div>
    </div>
    <!-- function button end -->
    <!-- table data begin-->
    <input type="hidden" id="action" name="action" value="${action}" />
    <input type="hidden" id="selectedId" name="selectedId" value="" />
    <input type="hidden" id="queryInput.queryName" name="queryInput.queryName" value="${queryInput.queryName }" />
    <input type="hidden" id="queryInput.queryLoginId" name="queryInput.queryLoginId" value="${queryInput.queryLoginId }">
    <input type="hidden" id="queryInput.queryOrgName" name="queryInput.queryOrgName" value="${queryInput.queryOrgName }" />
    <input type="hidden" id="queryInput.queryValid" name="queryInput.queryValid" value="${queryInput.queryValid }" />
    <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}">
    <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy}">
            <input type="hidden" id="pageCtrl.pageSize" name="pageCtrl.pageSize" value="${pageCtrl.pageSize}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.offset" name="pageCtrl.offset" value="${pageCtrl.offset }" />
    <table class="table table-striped table-bordered table-hover dataTable no-footer">
      <thead>
        <tr>
          <c:choose>
            <c:when test="${queryInput.queryOrderBy == '用户ID' }">
              <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="用户ID">用户ID</th>
            </c:when>
            <c:otherwise>
              <th class="sorting" data-column="用户ID">用户ID</th>
            </c:otherwise>
          </c:choose>
          <c:choose>
            <c:when test="${queryInput.queryOrderBy == '用户姓名' }">
              <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="用户姓名">用户姓名</th>
            </c:when>
            <c:otherwise>
              <th class="sorting" data-column="用户姓名">用户姓名</th>
            </c:otherwise>
          </c:choose>

          <c:choose>
            <c:when test="${queryInput.queryOrderBy == '所属机构' }">
              <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="所属机构">所属机构</th>
            </c:when>
            <c:otherwise>
              <th class="sorting" data-column="所属机构">所属机构</th>
            </c:otherwise>
          </c:choose>
          <c:choose>
            <c:when test="${queryInput.queryOrderBy == '用户类型' }">
              <th class="sorting_${queryInput.queryOrder }" data-active="true" data-column="用户类型">用户类型</th>
            </c:when>
            <c:otherwise>
              <th class="sorting" data-column="用户类型">用户类型</th>
            </c:otherwise>
          </c:choose>
          <th class="hidden-480">电话</th>
          <th class="hidden-480">EMAIL</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${records}">
          <c:set var="invalidClass" value=""></c:set>
          <c:if test="${!item.valid}">
            <c:set var="invalidClass" value="deleted-text grey darker"></c:set>
          </c:if>
          <tr class="${invalidClass}">
            <td>${item.loginId}</td>
            <td>${item.name}</td>
            <td>${item.orgName }</td>
            <td>${item.orgType }</td>
            <td>${item.tele}</td>
            <td>${item.email }</td>
            <td>
              <div class="btn-group">
                <button data-original-title="查看" data-rel="tooltip" title="" class="btn btn-xs btn-info tooltip-info" data-action='view' data-item="${item.id }" type="button">
                  <i class="ace-icon fa fa-search bigger-120"></i>查看
                </button>
                <button data-original-title="编辑" data-rel="tooltip" title="" class="btn btn-xs btn-warning tooltip-warning" data-action="modify" data-item="${item.id }" type="button">
                  <i class="ace-icon fa fa-edit bigger-120"></i>修改
                </button>
                <c:if test="${item.loginId !='admin'}">
                  <c:choose>
                    <c:when test="${!item.valid}">
                      <button data-original-title="激活" data-rel="tooltip" title="" class="btn btn-xs btn-success tooltip-success" data-action="reactive" data-item="${item.id }" type="button">
                        <i class="ace-icon fa fa-check bigger-120"></i>激活
                      </button>
                    </c:when>
                    <c:otherwise>
                      <button data-original-title="注销 " data-rel="tooltip" title="" class="btn btn-xs btn-danger tooltip-error" data-action="cancel" data-item="${item.id }" type="button">
                        <i class="ace-icon fa fa-ban bigger-120"></i>注销
                      </button>
                    </c:otherwise>
                  </c:choose>
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


<!-- page specific plugin scripts -->
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-rel="tooltip"]').tooltip();
	});
</script>
