<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <form:hidden path="id" />
        <form:hidden path="uuid"/>
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
                  <h4 class="widget-title">型号信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="product" cssClass="control-label col-xs-12 col-sm-4">
                            <span class="red">*</span>产品名称 ：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="product" placeholder="产品名称" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="name" cssClass="control-label col-xs-12 col-sm-4">
                            <span class="red">*</span>型号 ：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="name" placeholder="型号名称" cssClass="form-control" />
                          </div>
                        </div>
                      </div>                        
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="showOrder" cssClass="control-label col-xs-12 col-sm-4">显示顺序：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="showOrder" cssClass="form-control" placeholder="显示顺序" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="valid" cssClass="control-label col-xs-12 col-sm-8 col-sm-offset-4">
                            <form:checkbox path="valid" cssClass="checkbox-inline" />&nbsp;&nbsp;有效</form:label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- role detail edit fields end -->
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
		$('#detailInput').validate({
			errorElement : 'div',
			errorClass : 'help-block align-right',
			focusInvalid : false,
			rules : {
				name : {required : true},
				},
			messages : {
				name : {required : "型号名称不能为空！"},
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

	});
</script>