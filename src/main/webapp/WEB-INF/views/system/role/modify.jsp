<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <form:hidden path="id" />
        <form:hidden path="uuid"/>
        <form:hidden path="internal"/>
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
                          <form:label path="name" cssClass="control-label col-xs-12 col-sm-4">
                            <span class="red">*</span>角色名称 ：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="name" placeholder="角色名称" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="description" cssClass="control-label col-xs-12 col-sm-4">角色描述：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:textarea path="description" cssClass="form-control" placeholder="角色描述" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- role detail edit fields end -->
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
                          <td class="middle center">
                            <input type="checkbox" id="selectAll" name="selectAll" />
                          </td>
                          <td class="center">功能</td>
                          <td class="center">功能说明</td>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="func" items="${detailInput.functions}" varStatus="vs">
                          <tr>
                            <td class="middle center">
                              <form:hidden path="functions[${vs.index}].id" />
                              <form:checkbox path="functions[${vs.index}].available" data-select="has" />
                            </td>
                            <td class="">${func.name}</td>
                            <td>${func.description}</td>
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
	$(document).ready(
			function() {

				$('#detailInput').on('click change', '#selectAll', function() {
					if ($('#selectAll').prop('checked')) {
						$('[data-select]').prop('checked', true);
					} else {
						$('[data-select]').prop('checked', false);
					}
				});

				$('#detailInput')
						.validate(
								{
									errorElement : 'div',
									errorClass : 'help-block align-right',
									focusInvalid : false,
									rules : {
										name : {
											required : true
										},
									},
									messages : {
										name : {
											required : "角色名不能为空！"
										},
									},
									highlight : function(e) {
										$(e).closest('.form-group')
												.removeClass('has-success')
												.addClass('has-error');
									},
									success : function(error, element) {
										$(error).closest('.form-group')
												.removeClass('has-error')
												.addClass('has-success');
										$(error).remove();
									},
									unhighlight : function(e) {
										$(e).closest('.form-group')
												.removeClass('has-error');
									},
									errorPlacement : function(error, element) {
										$(element).closest('.form-group')
												.append(error);
									},
									onsubmit : false
								});

				$('#detail-dialog').bindKeyMoveForm('#detailInput :input');

			});
</script>