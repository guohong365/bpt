<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form id="FORM_TABLE_FUNCTION" role="form" action="#" method="post">
  <div class="dataTables_wrapper form-inline no-footer">
    <div class="row">
      <!-- functon button begin -->
      <div class="col-xs-12"></div>
    </div>
    <!-- function button end -->
    <!-- table data begin-->
    <input type="hidden" id="action" name="action" value="${action}" />
    <input type="hidden" id="selectedId" name="selectedId" value="" />
    <input type="hidden" id="queryInput.queryMac" name="queryInput.queryMac" value="${queryInput.queryMac }" />
    <input type="hidden" id="queryInput.queryStatus" name="queryInput.queryName" value="${queryInput.queryStatus }" />
    <input type="hidden" id="queryInput.queryFrom" name="queryInput.queryFrom" value="${queryInput.queryFrom }" />
    <input type="hidden" id="queryInput.queryTo" name="queryInput.queryTo" value="${queryInput.queryTo }" />
    <input type="hidden" id="queryInput.queryOrderBy" name="queryInput.queryOrderBy" value="${queryInput.queryOrderBy }" />
    <input type="hidden" id="queryInput.queryOrder" name="queryInput.queryOrder" value="${queryInput.queryOrder}" />
            <input type="hidden" id="pageCtrl.pageSize" name="pageCtrl.pageSize" value="${pageCtrl.pageSize}" />
            <input type="hidden" id="pageCtrl.total" name="pageCtrl.total" value="${pageCtrl.total }" />
            <input type="hidden" id="pageCtrl.offset" name="pageCtrl.offset" value="${pageCtrl.offset }" />
    <table class="table table-striped table-bordered table-hover dataTable no-footer">
      <thead>
        <tr>
          <th class="center sorting${queryInput.queryOrderBy =='MAC' ? '_'.concat(queryInput.queryOrder) : '' }" data-active="true" data-column="MAC">MAC</th>
          <th class="center sorting${queryInput.queryOrderBy =='状态' ? '_'.concat(queryInput.queryOrder) : '' }" data-active="true" data-column="状态">状态</th>
          <th class="center sorting${queryInput.queryOrderBy =='接收时间' ? '_'.concat(queryInput.queryOrder) : '' }" data-active="true" data-column="接收时间">接收时间</th>
          <th class="center sorting${queryInput.queryOrderBy =='数据' ? '_'.concat(queryInput.queryOrder) : '' }" data-active="true" data-column="数据">数据</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${records}">
          <tr>
            <td>${item.mac}</td>
            <td>${item.status}</td>
            <td>
              <fmt:formatDate value="${item.recvTime}" pattern="yyyy-MM-dd HH:mm:ss" />
            </td>
            <td>${item.data}</td>
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