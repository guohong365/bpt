<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <form:hidden path="id" />
        <input type="hidden" id="action" name="action" value="${action }" />
        <div class="modal-header no-padding">
          <div class="table-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
              <span class="white">&times;</span>
            </button>
            ${actionName}
          </div>
        </div>
        <div class="modal-body">
          <div class="row">
            <!-- role detail edit fields -->
            <div class="col-xs-12">
              <div class="widget-box">
                <div class="widget-header blue">
                  <h4 class="widget-title">角色信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">角色名称 ：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.name }</p>
                          </div>
                        </div>  
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">角色描述：</label>
                          <div class="col-xs-12 col-sm-8">                        
                            <p class="form-control-static blue">${detailInput.description }</p>
                          </div>
                        </div>    
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <c:set var="valid" value="已注销"></c:set>
                          <c:if test="${detailInput.valid }">
                            <c:set var="valid" value="有效"></c:set>
                          </c:if>
                          <p class="form-control-static col-xs-12 col-sm-8 col-sm-offset-4">${valid }</p>
                        </div>
                      </div>
                    </div>  
                  </div>
                </div>
              </div>
            </div><!-- role detail edit fields end -->
          </div>  
          <div class="row">
            <!-- functions selection list -->
            <div class="col-xs-12">
              <div class="widget-box">
                <div class="widget-header">
                  <h4 class="widget-title blue">角色权限</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr>
                          <td class="center">功能</td>
                          <td class="center">功能说明</td>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="func" items="${detailInput.functions}" varStatus="vs">
                          <c:if test="${func.available }">
                          <tr>
                            <td class="">${func.name}</td>
                            <td>${func.description}</td>
                          </tr>
                          </c:if>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- function selection list-->
        </div>
        <div class="modal-footer">
          <button id="btnCancel" class="btn btn-sm" data-dismiss="modal">
            <i class="ace-icon fa fa-times"></i> 取消
          </button>
          <button id="btnSave" class="btn btn-sm btn-primary" type="submit">
            <i class="ace-icon fa fa-check"></i> 保存
          </button>
        </div>
      </form:form>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		<c:if test="${action eq 'view'}" >
		  $('#btnCancel').text('关闭');
		  $('#btnSave').addClass('hide');
		</c:if>
	});
</script>