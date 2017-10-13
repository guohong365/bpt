<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <input type="hidden" id="action" name="action" value="${action }" />
        <form:hidden path="id" />
        <form:hidden path="uuid" />
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
                  <h4 class="widget-title">账单信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="generatedTime" cssClass="col-xs-12 col-sm-4 control-label">生成时间：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <div class="input-group">
                              <form:input path="generatedTime" cssClass="form-control date-picker" />
                              <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="hotelName" cssClass="control-label col-xs-12 col-sm-4">酒店：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="hotelName" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="income" cssClass="control-label col-xs-12 col-sm-4">酒店收入：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="income" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="payable" cssClass="control-label col-xs-12 col-sm-4">分成收入：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="payable" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="rent" cssClass="control-label col-xs-12 col-sm-4">分成：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="rent" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="state" cssClass="control-label col-xs-12 col-sm-4">状态：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="state" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="payTime" cssClass="col-xs-12 col-sm-4 control-label">付款时间：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <div class="input-group">
                              <form:input path="payTime" cssClass="form-control date-picker" />
                              <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="payerName" cssClass="control-label col-xs-12 col-sm-4">付款人：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="payerName" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="verifyTime" cssClass="col-xs-12 col-sm-4 control-label">确认时间：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <div class="input-group">
                              <form:input path="verifyTime" cssClass="form-control date-picker" />
                              <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="form-group">
                          <form:label path="verifierName" cssClass="control-label col-xs-12 col-sm-4">确认人：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="verifierName" cssClass="form-control" />
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
	$(document).ready(
			function() {
				$('.date-picker').datepicker({
					format : 'yyyy-mm-dd',
					autoclose : true,
					todayHighlight : true,
					todayBtn : true,
					language : 'zh-CN',
					endDate : new Date()
				});
				$('.input-daterange').datepicker({
					format : 'yyyy-mm-dd',
					autoclose : true,
					todayHighlight : true,
					todayBtn : true,
					language : 'zh-CN'
				});
				$('#detailInput')
						.validate(
								{
									errorElement : 'div',
									errorClass : 'help-block align-right',
									focusInvalid : false,
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
									rules : {},
									messages : {},
								});
				$('#detail-dialog').bindKeyMoveForm('#detailInput :input');
			});
</script>