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
              <input type="hidden" id="queryInput.queryCheckInTimeFrom" name="queryInput.queryCheckInTimeFrom" value="${queryInput.queryCheckInTimeFrom}" />
              <input type="hidden" id="queryInput.queryCheckInTimeTo" name="queryInput.queryCheckInTimeTo" value="${queryInput.queryCheckInTimeTo}" />
              <input type="hidden" id="queryInput.queryCheckOutTimeFrom" name="queryInput.queryCheckOutTimeFrom" value="${queryInput.queryCheckOutTimeFrom}" />
              <input type="hidden" id="queryInput.queryCheckOutTimeTo" name="queryInput.queryCheckOutTimeTo" value="${queryInput.queryCheckOutTimeTo}" />
              <input type="hidden" id="queryInput.queryRoomNo" name="queryInput.queryRoomNo" value="${queryInput.queryRoomNo}" />
              <!-- table data begin-->
              <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                  <tr>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='房间' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="房间">房间</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="房间">房间</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='入住时间' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="入住时间">入住时间</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="入住时间">入住时间</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='退房时间' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="退房时间">退房时间</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="退房时间">退房时间</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='使用次数' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="使用次数">使用次数</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="使用次数">使用次数</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='应付款' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="应付款">应付款</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="应付款">应付款</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='入住登记' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="入住登记">入住登记</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="入住登记">入住登记</th>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${queryInput.queryOrderBy =='退房登记' }">
                        <th class="center sorting_${queryInput.queryOrder }" data-active="true" data-column="退房登记">退房登记</th>
                      </c:when>
                      <c:otherwise>
                        <th class="center sorting" data-column="退房登记">退房登记</th>
                      </c:otherwise>
                    </c:choose>                    
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${records}">
                    <tr>
                      <td>${item.roomNo }</td>
                      <td><fmt:formatDate value="${item.checkInTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                      <td><fmt:formatDate value="${item.checkOutTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>                      
                      <td>${item.useTimes}</td>
                      <td>${item.charge}</td>
                      <td>${item.checkInReceptionistName}</td>
                      <td>${item.checkOutReceptionistName}</td>
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
