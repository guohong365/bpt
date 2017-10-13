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
          <i class="ace-icon fa fa-pencil"></i> 新增
        </button>
      </div>
    </div>
    <!-- function button end -->
    <!-- table data begin-->
    <input type="hidden" id="action" name="action" value="${action}" />
    <input type="hidden" id="selectedId" name="selectedId" value="" />
    <input type="hidden" id="queryInput.queryName" name="queryInput.queryName" value="${queryInput.queryName }" />
    <input type="hidden" id="queryInput.queryAll" name="queryInput.queryAll" value="${queryInput.queryAll }" />
    <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy }" />
    <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}" />
            <input type="hidden" id="pageCtrl.pageSize" name="pageCtrl.pageSize" value="${pageCtrl.pageSize}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.offset" name="pageCtrl.offset" value="${pageCtrl.offset }" />

    <table class="table table-striped table-bordered table-hover dataTable no-footer">
      <thead>
        <tr>
          <c:choose>
            <c:when test="${queryInput.queryOrderBy =='角色名称' }">
              <th class="sorting_${queryInput.queryOrder}" data-active="true" data-column="角色名称">角色名称</th>
            </c:when>
            <c:otherwise>
              <th class="sorting" data-column="角色名称">角色名称</th>
            </c:otherwise>
          </c:choose>
          <th>角色描述</th>
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
          <tr class="${delClass }">
            <td>${item.name}
              <c:if test="${item.internal}">
                <span class="red">(内部角色)</span>
              </c:if>
            </td>
            <td>${item.description}</td>
            <td>
              <div class="hidden-sm hidden-xs btn-group">
                <button data-original-title="查看" data-rel="tooltip" title="" class="btn btn-xs btn-info tooltip-info" data-action='view' data-item="${item.id }" type="button">
                  <i class="ace-icon fa fa-search bigger-120"></i>查看
                </button>
                <c:if test="${!item.internal }">
                  <button data-original-title="修改" data-rel="tooltip" title="" class="btn btn-xs btn-warning tooltip-warning" data-action="modify" data-item="${item.id }" type="button">
                    <i class="ace-icon fa fa-edit bigger-120"></i>修改
                  </button>
                  <c:choose>
                    <c:when test="${!item.valid }">
                      <button data-original-title="激活" data-rel="tooltip" title="" class="btn btn-xs btn-success tooltip-success" data-action="reactive" data-item="${item.id }" type="button">
                        <i class="ace-icon fa fa-check bigger-120"></i>激活
                      </button>
                    </c:when>
                    <c:otherwise>
                      <button data-original-title="注销" data-rel="tooltip" title="" class="btn btn-xs btn-danger tooltip-error" data-action="cancel" data-item="${item.id }" type="button">
                        <i class="ace-icon fa fa-ban bigger-120"></i>注销
                      </button>
                    </c:otherwise>
                  </c:choose>
                </c:if>
              </div>
              <div class="hidden-md hidden-lg">
                <div class="inline position-relative">
                  <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                    <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                  </button>

                  <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                    <li>
                      <a data-original-title="查看" href="#" class="tooltip-info" data-rel="tooltip" title="" data-action="view" data-item="${item.id }">
                        <span class="blue">
                          <i class="ace-icon fa fa-search-plus bigger-120"></i>
                        </span>
                      </a>
                    </li>
                    <c:if test="${!item.internal }">
                      <li>
                        <a data-original-title="编辑" href="#" class="tooltip-success" data-rel="tooltip" title="" data-action="modify" data-item="${item.id }">
                          <span class="green">
                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                          </span>
                        </a>
                      </li>
                      <c:choose>
                        <c:when test="${!item.valid}">
                          <li>
                            <a data-original-title="激活" href="#" class="tooltip-error" data-rel="tooltip" title="" data-action="reactive" data-item="${item.id }">
                              <span class="green">
                                <i class="ace-icon fa fa-check bigger-120"></i>
                              </span>
                            </a>
                          </li>
                        </c:when>
                        <c:otherwise>
                          <li>
                            <a data-original-title="注销" href="#" class="tooltip-error" data-rel="tooltip" title="" data-action="cancel" data-item="${item.id }">
                              <span class="red">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                              </span>
                            </a>
                          </li>
                        </c:otherwise>
                      </c:choose>
                    </c:if>
                  </ul>
                </div>
              </div>

            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <!-- table data end -->
  </div>
</form>


<!-- page specific plugin scripts -->
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-rel="tooltip"]').tooltip();
	});
</script>
