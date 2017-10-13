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
            <div class="col-xs-12">
              <div class="widget-box">
                <div class="widget-header blue">
                  <h4 class="widget-title">设备信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="type" cssClass="control-label col-xs-12 col-sm-4">
                            <span class="red">*</span>型号 ：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:select path="type" cssClass="form-control chosen-select">
                              <form:option value="">请选择设备型号...</form:option>
                              <form:options items="${_TYPES}" itemLabel="value" itemValue="code" />
                            </form:select>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="serialNo" cssClass="control-label col-xs-12 col-sm-4">设备编号：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="serialNo" cssClass="form-control" placeholder="设备唯一识别号" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
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
		$.validator.setDefaults({ignore : ":hidden:not(#type)"});
		$('#detailInput').validate({
			errorElement : 'div',
			errorClass : 'help-block align-right',
			focusInvalid : false,
			rules : {
				type : {required : true	},
				serialNo : {required : true	},
				},
			messages : {
				type : {required : "必须选择型号！"},
				serialNo : {	required : "设备识别号不能为空！"		},
				},
			highlight : function(e) {
				$(e).closest('.form-group').removeClass('has-success').addClass('has-error');
				},
			success : function(error, element) {
				$(error).closest('.form-group').removeClass('has-error').addClass('has-success');
				$(error).remove();
				},
			unhighlight : function(e) {
				$(e).closest('.form-group').removeClass('has-error');
				},
			errorPlacement : function(error, element) {
				$(element).closest('.form-group').append(error);
				},
			onsubmit : false
		});

		$('#detail-dialog').bindKeyMoveForm('#detailInput :input');
		$('#type').chosen({width : "100%"	});
	});
</script>