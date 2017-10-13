<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <input type="hidden" id="action" name="action" value="${action }" />
        <form:hidden path="id" />
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
                  <h4 class="widget-title">房间信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="storey" cssClass="control-label col-xs-12 col-sm-4">楼层：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="storey" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="roomNo" cssClass="control-label col-xs-12 col-sm-4">房间号：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="roomNo" cssClass="form-control" />
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
		$('#detailInput').validate({
			errorElement : 'div',
			errorClass : 'help-block align-right',
			focusInvalid : false,
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
		  rules : {
			  storey : { required : true, digits: true},
				roomNo : { required : true}
		    },
		  messages : {
			  storey : { required : '[楼层]不能为空！', digits : '请输入数字！'},
			  roomNo : { required : '[房间号]不能为空！'}
		    },
		});
		
		$('#detail-dialog').bindKeyMoveForm('#detailInput :input');
	});
</script>