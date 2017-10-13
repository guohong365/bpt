<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" >
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#">
        <input type="hidden" id="action" name="action" value=${action } />
        <form:hidden path="id"/>
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
                  <h4 class="widget-title">用户信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group col-xs-12">
                          <div class="col-xs-12 col-sm-3">用户登录名：</div>
                          <div class="col-xs-12 col-sm-9 blue">${detailInput.loginId}</div>
                        </div>
                        <div class="form-group col-xs-12">
                          <div class="col-xs-12 col-sm-3">用户名称 ：</div>
                          <div class="col-xs-12 col-sm-9 blue">${detailInput.name }</div>
                        </div>
                        <div class="form-group col-xs-12">
                          <div class="col-xs-12 col-sm-3">所属机构：</div>
                          <div class="col-xs-12 col-sm-9 blue">${detailInput.orgName }</div>
                        </div>
                        <div class="form-group col-xs-12">
                          <div class="col-xs-12 col-sm-3">电话：</div>
                          <div class="col-xs-12 col-sm-9 blue">${detailInput.tele}</div>
                        </div>
                        <div class="form-group col-xs-12">
                          <div class="col-xs-12 col-sm-3">电子邮件：</div>
                          <div class="col-xs-12 col-sm-9 blue">${detailInput.email }</div>
                        </div>
                        <div class="form-group col-xs-12">
                          <div class="col-xs-12 col-sm-3">用户描述：</div>
                          <div class="col-xs-12 col-sm-9 blue">${detailInput.description}</div>
                        </div>
                        <c:if test="detailInput.adminFlag">
                          <div class="form-group col-xs-12">
                            <div class="col-xs-12 blue">系统管理员</div>
                          </div>
                        </c:if>
                      </div>
                    </div>
                    <div class="hr hr-2"></div>
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="col-xs-12">
                          <div class="col-xs-12 col-sm-6">创建人：${detailInput.createrName}</div>
                          <div class="col-xs-12 col-sm-6">
                            创建时间：
                            <fmt:formatDate value="${detailInput.createTime}" pattern="yyyy年MM月dd日" />
                          </div>
                        </div>
                        <c:if test="${detailInput.cancelater!=null}">
                          <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-6">注销人：${detailInput.cancelaterName}</div>
                            <div class="col-xs-12 col-sm-6">
                              注销时间：
                              <fmt:formatDate value="${detailInput.cancelTime}" pattern="yyyy年MM月dd日" />
                            </div>
                          </div>
                        </c:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- role detail edit fields end -->
          <div class="row">
            <!-- functions selection list -->
            <div class="col-xs-12">
              <div class="widget-box">
                <div class="widget-header">
                  <h4 class="widget-title blue">用户角色</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr>
                          <td class="center">角色</td>
                          <td class="center">角色说明</td>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="role" items="${detailInput.roles}" varStatus="vs">
                        <c:if test="${role.available}">
                          <tr>
                            <td class="">${role.name}</td>
                            <td>${role.description}</td>
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
    <c:if test="${action eq 'view' }">
     $('#btnCancel').text('关闭');
     $('#btnSave').addClass('hide'); 
    </c:if>
	});
</script>