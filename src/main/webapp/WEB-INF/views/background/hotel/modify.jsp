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
        <form:hidden path="billingDateParam1" />
        <form:hidden path="billingDateParam2" />
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
                  <h4 class="widget-title">${entiryName}</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="name" cssClass="control-label col-xs-12 col-sm-2">名称：</form:label>
                          <div class="col-xs-12 col-sm-10">
                            <form:input path="name" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="address" cssClass="control-label col-xs-12 col-sm-2">地址：</form:label>
                          <div class="col-xs-12 col-sm-10">
                            <form:input path="address" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="tele" cssClass="control-label col-xs-12 col-sm-4">电话：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="tele" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="linkman" cssClass="control-label col-xs-12 col-sm-4">联系人：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="linkman" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="description" cssClass="control-label col-xs-12 col-sm-2">备注：</form:label>
                          <div class="col-xs-12 col-sm-10">
                            <form:textarea path="description" cssClass="form-control" rows="3" />
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="hr hr-2"></div>
                    <div class="row">
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="totalDevice" cssClass="control-label col-xs-12 col-sm-4">设备总数：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="totalDevice" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="publicUsage" cssClass="control-label col-xs-12 col-sm-4">公用数：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="publicUsage" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="chargeStandard" cssClass="control-label col-xs-12 col-sm-4">收费标准：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="chargeStandard" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="charge" cssClass="control-label col-xs-12 col-sm-4">酒店收费：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="charge" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <form:label path="ratio" cssClass="control-label col-xs-12 col-sm-4">分成比例：</form:label>
                          <div class="col-xs-12 col-sm-8">
                            <form:input path="ratio" cssClass="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <form:label path="billingCycle" cssClass="control-label col-xs-12 col-sm-2">结算周期：</form:label>
                          <div class="col-xs-12 col-sm-10">
                            <form:select path="billingCycle" cssClass="form-control chosen-select">
                              <form:option value="">请选择结算周期...</form:option>
                              <form:options items="${_BILLING_CYCLE_TYPES}" itemLabel="value" itemValue="code" />
                            </form:select>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label hidden-xs col-sm-2">&nbsp;</label>
                          <div id="param11" class="col-xs-12 col-sm-4">
                            <select id="weekDay" name="weekDay" class="form-control chosen-select" data-placeholder="选择星期...">
                              <option value=""></option>
                              <c:forEach items="${_WEEK_DAYS}" var="item">
                                <option value="${item.code}">${item.value}</option>
                              </c:forEach>
                            </select>
                          </div>
                          <div id="param12" class="col-xs-12 col-sm-4">
                            <select id="quarterMonth" name="quarterMonth" class="from-control chosen-select" data-placeholder="选择每季度第几个月...">
                              <option value=""></option>
                              <c:forEach items="${_QUARTER_MONTHS}" var="item">
                                <option value="${item.code}">${item.value }</option>
                              </c:forEach>
                            </select>
                          </div>
                          <div id="param13" class="col-xs-12 col-sm-4">
                            <select id="month" name="month" class="form-control chosen-select" data-placeholder="选择月份...">
                              <option value=""></option>
                              <c:forEach items="${_MONTHS}" var="item">
                                <option value="${item.code }">${item.value }
                              </c:forEach>
                            </select>
                          </div>
                          <div id="param2" class="col-xs-12 col-sm-4">
                            <select id="monthDay" name="monthDay" class="form-control chosen-select" data-placeholder="选择月度内日期...">
                              <option value=""></option>
                              <c:forEach items="${_MONTH_DAYS}" var="item">
                                <option value="${item.code }">${item.value }</option>
                              </c:forEach>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <c:if test="${action=='modify'}">
                      <div class="hr hr-2"></div>
                      <div class="row">
                        <div class="col-xs-12 col-sm-6">
                          <div class="form-group">
                            <label class="control-label col-xs-12 col-sm-4">创建人：</label>
                            <div class="col-xs-12 col-sm-8">
                              <p class="form-control-static blue">${detailInput.createrName}</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-xs-12 col-sm-6">
                          <div class="form-group">
                            <label class="control-label col-xs-12 col-sm-4">创建时间：</label>
                            <div class="col-xs-12 col-sm-8">
                              <p class="form-control-static blue"><fmt:formatDate value="${detailInput.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:if>
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
		$('.chosen-select').chosen({width : '100%'});
		
		$('.input-daterange').datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true,
			todayHighlight : true,
			todayBtn : true,
			language : 'zh-CN'
		});
		
		var hiddenAllSelect=function(){
			$('#param11').addClass('hidden');
			$('#param12').addClass('hidden');
			$('#param13').addClass('hidden');
			$('#param2'  ).addClass('hidden');
			$('#weekDay').val("");
			$('#weekDay').trigger('chosen:updated');
			$('#monthDay').val('');
			$('#monthDay').trigger('chosen:updated');
			$('#quarterMonth').val('');
			$('#quarterMonth').trigger('chosen:updated');
			$('#month').val('');
			$('#month').trigger('chosen:updated');          
		};
		
		var initSelect=function(){
			$('#billingCycle').val('${detailInput.billingCycle}');
			hiddenAllSelect();
		      
		  switch($('#billingCycle').val()){
		  case '周':
			  $('#param11').removeClass('hidden');
			  $('#weekDay').val('${detailInput.billingDateParam1}');
			  $('#weekDay').trigger('chosen:updated');
			  break;
			case '月':
				$('#param2').removeClass('hidden');
				$('#monthDay').val('${detailInput.billingDateParam2}');
				$('#monthDay').trigger('chosen:updated');
				break;
		  case '季':
			  $('#param12').removeClass('hidden');
			  $('#param2').removeClass('hidden');
			  $('#quarterMonth').val('${detailInput.billingDateParam1}');
			  $('#quarterMonth').trigger('chosen:updated');
			  $('#monthDay').val('${detailInput.billingDateParam2}');
			  $('#monthDay').trigger('chosen:updated');
			  break;
		  case '年':
			  $('#param13').removeClass('hidden');
			  $('#param2').removeClass('hidden');
			  $('#month').val('${detailInput.billingDateParam1}');
			  $('#month').trigger('chosen:updated');
			  $('#monthDay').val('${detailInput.billingDateParam2}');
			  $('#monthDay').trigger('chosen:updated');
			  break;
		  }     
		};
		    
		$('#billingCycle').on('change', function(){
		  hiddenAllSelect();
		  console.log("-----" + $('#billingCycle').val());
		  switch($('#billingCycle').val()){
		  case '周':
			  $('#param11').removeClass('hidden');
			  break;
		  case '月':
			  $('#param2').removeClass('hidden');
			  break;
		  case '季':
			  $('#param12').removeClass('hidden');
			  $('#param2').removeClass('hidden');
			  break;
		  case '年':
			  $('#param13').removeClass('hidden');
			  $('#param2').removeClass('hidden');
		    break;
		  } 
		});
		        
		$.validator.setDefaults({ignore : ":hidden:not(.chosen-select)"});
				
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
				name : {required: true},
				totalDevice : {
					required : true, 
					digits : true
					},
				publicUsage : {
					required : true,
					digits : true
					},
				chargeStandard : {
					required : true, 
					number:true	
					},
				charge : {
					required : true, 
					number : true
					},
				ratio : {
					required : true, 
					number : true
				  },
				billingCycle : {required : true},
				weekDay : {
					required : function(){return $('#billingCycle').val()=='周';}
				  },
				quarterMonth : {
					required : function(){return $('#billingCycle').val()=='季';}
				  },
				month: {
					required : function(){return $('#billingCycle').val()=='年';}
				  },
				monthDay : {
					required : function(){return $('#billingCycle').val()=='月' || $('#billingCycle').val()=='季' || $('#billingCycle').val()=='年';}
				  }
			},
			messages : {
				name : {required : '[酒店名称]不能为空！'},
				totalDevice : {	
					required : '[设备总数]不能为空！', 
					digits : '请输入整数！'
					},
				publicUsage : {	
					required : '[公用数]不能为空！'	, 
					digits : '请输入整数！'
					},
				chargeStandard : {
					required : '[收费标准]不能为空！', 
					number :	'请输入数字！'
					},
				charge : {
					required : '[酒店收费]不能为空！', 
					number : '请输入数字！'
					},
				ratio : {
					required : '[分成比例]不能为空！'	, 
					number :  '请输入数字！'
					},
				billingCycle : {required : '[结算周期]不能为空！'},
				weekDay : {required : '请选择星期！'},
				quarterMonth:{required : '请选择第几月！'},
				month : {required : '请选择月份！'},
				monthDay : {required : '请选择日期！'}
			}
		});

		$('#detail-dialog').bindKeyMoveForm('#detailInput :input');
			
		initSelect();
	});
</script>
