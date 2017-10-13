<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" >
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form">
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
                          <div class="col-xs-12">
                            <div class="form-group">                              
                              <c:choose>
                                <c:when test="${action == 'new' }">
                                  <form:label path="loginId" cssClass="control-label col-xs-12 col-sm-3"><span class="red">*</span>用户登录名：</form:label>
                                  <div class="col-xs-12 col-sm-9">
                                    <form:input path="loginId" cssClass="form-control" placeholder="请输入用户登录名" />
                                  </div>
                                </c:when>
                                <c:otherwise>
                                  <form:label path="loginId" cssClass="control-label col-xs-12 col-sm-3">用户登录名：</form:label>
                                  <div class="col-xs-12 col-sm-9">
                                    <form:hidden path="loginId" /> 
                                    <p class="form-control-static blue">${detailInput.loginId }</p>
                                  </div>
                                </c:otherwise>  
                              </c:choose>
                            </div>
                          </div>
                          <div class="col-xs-12">
                            <div class="form-group">
                              <form:label path="name" cssClass="control-label col-xs-12 col-sm-3"><span class="red">*</span>用户名称 ：</form:label>
                              <div class="col-xs-12 col-sm-9">
                                <form:input path="name" placeholder="请输入用户名称" cssClass="form-control" />
                              </div>
                            </div>
                          </div>
                        
                          <div class="col-xs-12">
                            <div class="form-group">
                              <form:label path="org" cssClass="control-label col-xs-12 col-sm-3"><span class="red">*</span>所属机构：</form:label>
                              <div class="col-xs-12 col-sm-9">
                                <form:select path="org" cssClass="form-control chosen-select">
                                  <form:option value="">请选择所属机构</form:option>
                                  <form:options items="${_ORGS}" itemLabel="value" itemValue="code" />
                                </form:select>
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12">
                            <div class="form-group">
                              <form:label path="password" cssClass="control-label col-xs-12 col-sm-3">
                                <c:if test="${action =='new' }">
                                  <span class="red">*</span>
                                </c:if>
                                                                                                                登录密码：
                              </form:label>
                              <div class="col-xs-12 col-sm-9">
                                <form:password path="password" cssClass="form-control" placeholder="请输入登录密码" />
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12">
                            <div class="form-group">
                              <label for="pwdAgain" class="control-label col-xs-12 col-sm-3">
                                <c:if test="${action =='new' }">
                                  <span class="red">*</span>
                                </c:if>
                                                                                                                密码确认：
                              </label>
                              <div class="col-xs-12 col-sm-9">
                                <input id="pwdAgain" name="pwdAgain" type="password" class="form-control" placeholder="请重复输入登录密码">
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12">
                            <div class="form-group">
                              <form:label path="tele" cssClass="control-label col-xs-12 col-sm-3">电话：</form:label>
                              <div class="col-xs-12 col-sm-9">
                                <form:input path="tele" cssClass="form-control" placeholder="请输入用户电话" />
                              </div>
                            </div>
                          </div>
                          <div class="col-xs-12">

                          <div class="form-group">
                            <form:label path="email" cssClass="control-label col-xs-12 col-sm-3">电子邮件：</form:label>
                            <div class="col-xs-12 col-sm-9">
                              <form:input path="email" cssClass="form-control" placeholder="请输入用户电子邮件" />
                            </div>
                          </div>
                        </div>
                        <div class="col-xs-12">

                          <div class="form-group">
                            <form:label path="description" cssClass="control-label col-xs-12 col-sm-3">用户描述：</form:label>
                            <div class="col-xs-12 col-sm-9">
                              <form:textarea path="description" cssClass="form-control" placeholder="请输入用户描述" />
                            </div>
                          </div>
                        </div>
                        <div class="col-xs-12">

                          <div class="form-group">
                            <form:label path="adminFlag" cssClass="control-label col-xs-12 col-sm-3">是系统管理员：</form:label>
                            <form:checkbox path="adminFlag" cssClass="middle" />
                          </div>
                        </div>
                      </div>
                    </div>
                    <c:if test="${action != 'new' }">
                      <div class="hr hr-4"></div>
                      <div class="row">
                        <div class="col-xs-12 col-sm-6">
                          <label class="control-label col-xs-12 col-sm-6">创建人：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static">${detailInput.createrName}</p>
                          </div>
                        </div>  
                        <div class="col-xs-12 col-sm-6">
                          <label class="control-label col-xs-12 col-sm-6">创建时间：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static"><fmt:formatDate value="${detailInput.createTime}" pattern="yyyy年MM月dd日 " /></p>
                          </div>  
                        </div>
                      </div>
                    </c:if>
                    <c:if test="${detailInput.cancelater!=null}">
                      <div class="row">
                        <div class="col-xs-12 col-sm-6">
                          <label class="control-label col-xs-12 col-sm-6">注销人：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static">${detailInput.cancelaterName}</p>
                          </div>
                        </div>    
                        <div class="col-xs-12 col-sm-6">
                          <label class="control-label col-xs-12 col-sm-6">注销时间：</label>
                          <div class="col-xs-12 col-sm-6">
                            <p class="form-control-static"><fmt:formatDate value="${detailInput.cancelTime}" pattern="yyyy年MM月dd日 " /></p>
                          </div>  
                        </div>
                      </div>
                    </c:if>
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
                          <td class="middle center">
                            <input id="selectAll" type="checkbox" />
                          </td>
                          <td class="center">角色</td>
                          <td class="center">角色说明</td>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="role" items="${detailInput.roles}" varStatus="vs">
                          <tr>
                            <td class="middle center">
                              <form:hidden path="roles[${vs.index}].id" />
                              <form:checkbox path="roles[${vs.index}].available" data-select="has" />
                            </td>
                            <td class="">${role.name}</td>
                            <td>${role.description}</td>
                          </tr>
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
          <button id="btnSave" class="btn btn-sm btn-primary" type="submit">
            <i class="ace-icon fa fa-check"></i> 保存
          </button>
          <button id="btnCancel" class="btn btn-sm" data-dismiss="modal">
            <i class="ace-icon fa fa-times"></i> 取消
          </button>
        </div>
      </form:form>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.chosen-select').chosen({width:"100%"});
		
		$.validator.setDefaults({ignore : ":hidden:not(#org)"});
		
		$('#detailInput').validate({
			errorElement : 'div',
			errorClass : 'help-block',
			focusInvalid : false,
			rules : {
				id : {
					required : true,
					pattern : "[a-zA-Z]+[a-zA-Z0-9_]*",
					rangelength : [ 2, 32 ]
				  },
				name : {
					required : true
					},
				email : {
					email : true
					},
				password : {
					required : function() {
						return $("#action").val() === "new";
						},
						rangelength : [ 6, 32 ]
					},
				pwdAgain : {
					required : function() {
						return $("#action").val() === "new";
						},
						equalTo : '#password'
					},
				org : {
					required : true
					}
				},
				messages : {
					id : {
						required : "用户登录名不能为空！",
						rangelength : "用户登录名长度介于{0}-{1}个字符",
						pattern : "用户登录名必须以字母开头，合法字符为a-z,0-9,_。不区分大小写。"
						},
					name : {
						required : "用户登录名不能为空！"
						},
					email : {
						email : "请输入正确的email地址！"
						},
					password : {
						required : "密码不能为空！",
						rangelength : "密码长度必须在{0}-{1}个字符之间！"
						},
					pwdAgain : {
						required : "确认密码不能为空！",
						equalTo : "两次密码输入不一致！"
						},
					org : {
						required : "请选择用户所属单位！"
						}
					},
				highlight : function(e) {
					$(e).closest('.form-group').removeClass('has-success').addClass('has-error');
					},
				success : function(e) {
					$(e).closest('.form-group').removeClass('has-error').addClass('has-success');
					$(e).remove();
					},
				errorPlacement : function(error,	element) {
					error.insertAfter(element);
					},
				onsubmit : false
		});
		
		$('#detail-dialog').bindKeyMoveForm('#detailInput :input');
		
		$('#detailInput').on('click', '#selectAll', function(){
			if($(this).prop('checked')){
				$('[data-select]:checkbox').prop('checked', true);
			} else {
				$('[data-select]:checkbox').prop('checked', false);
			}
		})
		
	});
</script>