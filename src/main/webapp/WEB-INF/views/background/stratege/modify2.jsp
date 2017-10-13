<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>${modelTitle }</title>
<div class="row" id="content_container">
  <div class="hidden-xs hidden-sm col-lg-2"></div>
  <div class="col-xs-12 col-lg-8">
    <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
      <form:hidden path="id" />
      <form:hidden path="uuid" />
      <input type="hidden" id="action" name="action" value="${action }" />
      <div class="row">
        <div class="col-xs-12">
          <div class="widget-box">
            <div class="widget-header blue">
              <h4 class="widget-title">收费政策信息</h4>
            </div>
            <div class="widget-body">
              <div class="widget-main">
                <div class="row">
                  <div class="col-xs-12">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <form:label path="chargeStandard" cssClass="control-label col-xs-12 col-sm-4">
                          <span class="red">*</span>收费标准 ：</form:label>
                        <div class="col-xs-12 col-sm-8">
                          <form:input path="chargeStandard" cssClass="form-control" placeholder="输入非负数字..." />
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">
                      <div class="form-group">
                        <form:label path="ratio" cssClass="control-label col-xs-12 col-sm-4">分成比例：</form:label>
                        <div class="col-xs-12 col-sm-8">
                          <form:input path="ratio" cssClass="form-control" placeholder="输入数字..." />
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">
                      <div class="form-group">
                        <form:label path="charge" cssClass="control-label col-xs-12 col-sm-4">酒店价格：</form:label>
                        <div class="col-xs-12 col-sm-8">
                          <form:input path="charge" cssClass="form-control" placeholder="输入非负数字..." />
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">
                      <div class="form-group">
                        <form:label path="billingCycle" cssClass="control-label col-xs-4">结算周期：</form:label>
                        <div class="col-xs-8"></div>
                        <div class="col-xs-12 col-sm-4">
                          <form:select path="billingCycle" cssClass="form-control chosen-select">
                            <form:option value="周">每周</form:option>
                            <form:option value="月">每月</form:option>
                            <form:option value="季">每季度</form:option>
                            <form:option value="年">每年</form:option>
                          </form:select>
                        </div>
                        <div id="param1-1" class="col-xs-12 col-sm-4">
                          <select name="weekDay" class="form-control chosen-select">
                            <c:forEach items="${_weekDays}" var="item">
                              <option value="${item.code}">${item.value}</option>
                            </c:forEach>
                          </select>
                        </div>
                        <div id="param1-2" class="col-xs-12 col-sm-4">
                          <select name="quarterMonth" class="from-control chosen-select">
                            <c:forEach items="${_quarterMonths }">
                              <option value="${item.code}">${item.value }</option>
                            </c:forEach>
                          </select>
                        </div>
                        <div id="param1-3" class="col-xs-12 col-sm-4">
                          <select name="month" class="form-control chosen-select">
                            <c:forEach items="${_months}" var="item">
                              <option value="${item.code }">${item.value }
                            </c:forEach>
                          </select>
                        </div>
                        <div id="param2" class="col-xs-12 col-sm-4">
                          <select name="monthDay" class="form-control chosen-select">
                            <c:forEach items="${_monthDays}" var="item">
                              <option value="${item.code }">${item.value }</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>              
                <div class="modal-footer">
                  <button id="btnSave" class="btn btn-sm btn-primary" type="submit">
                    <i class="ace-icon fa fa-check"></i>保存
                  </button>
                  <button id="btnCancel" class="btn btn-sm" type="button">
                    <i class="ace-icon fa fa-times"></i>放弃修改
                  </button>
                </div>
              </div>
            </div> 
          </div> 
        </div>        
      </div>
    </form:form>
  </div>
  <div class="hidden-xs hidden-sm col-lg-2"></div>
</div>
<script type="text/javascript">
var scripts = [ null, null ]
ace.load_ajax_scripts(scripts, function() {
	$('#billingCycle onption').on('change', function(){
		  alert($(this).val());
			switch($(this).val()){
			case '周':
				if($(this).prop('selected')){
					$('#param1-1').removeClass('hidden');
				} else {
					$('#param1-1').addClass('hidden');
				}
				break;
			case '月':
				if($(this).prop('selected')){
			    $('#param2').removeClass('hidden');
			  } else {
			    $('#param2').addClass('hidden');
			  }
			  break;
			case '季':
				if($(this).prop('selected')){
					$('#param1-2').removeClass('hidden');
			    $('#param2').removeClass('hidden');
				} else {  
			    $('#param1-2').addClass('hidden');
			    $('#param2').addClass('hidden');
				}  
				break;
			case '年':
				if($(this).prop('selected')){
					$('#param1-3').removeClass('hidden');
			    $('#param2').removeClass('hidden');
				} else {  
			    $('#param1-3').addClass('hidden');
			    $('#param2').addClass('hidden');
				}  
				break;
			}	
		});
		
		//$('#billingCycle option [value="${detailInput.billingCycle}"').prop("selected", true);
				
		$.validator.setDefaults({ignore : ":hidden:not(.chosen-select)"});
		$('#detailInput').validate({
			errorElement : 'div',
			errorClass : 'help-block align-right',
			focusInvalid : false,
			rules:{
						chargeStandard:{required:true,number:true,min:0},
						ratio:{required:true,number:true},
						charge:{required:true,number:true,min:0},
						billingCycle:{required:true},
						weekDay:{required:function(){return $('#billingCycle').val()=='周';}},
						quarterMonth:{required:function(){return $('#billingCycle').val()=='季';} },
						month:{required:function(){return $('#billingCycle').val()=='年';}},
						monthDay:{required:function(){return $('#billingCycle').val()=='月' || $('#billingCycle').val()=='年';}	}						
					  },
		messages:{
						chargeStandard:{required:"收费标准不能为空！",	number:"请填写非负数字，整数或小数！",min:"请填写非负数字，整数或小数！"},
						ratio:{required:"分成比例不能为空！",number:"请填写数字，整数或小数！"},
						charge: {required : "酒店价格不能为空！",	number:"请填写非负数字，整数或小数！",min:"请填写非负数字，整数或小数！"},
					  billingCycle:{required:"请选择结算周期！"},
						weekDay:{required:"请选择星期几结算！"},
						quarterMonth:{required:"请选择第几季度结算！"  },  
						month:{required:"请选择一年中第几个月结算！"	},
						monthDay:{required:"请选择一月中第几日结算给！"}						
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
					}
		//submitHandle: function(){
	});
		
	$("#btnCancel").on("click", function(event){
		$("#btnSave").prop("disable", true);
		$("#btnCancel").prop("disable", true);
		$.ajax({
			url : "mrg/stratege/detail",
			type : "get",
			data : "action=view",
			dataType : "html"
		})
		.fail(function(){})
		.done(function(){
			$('.page-content-area').html(data);
		})
		.complete(function(){});
	});	
		
	$('#detail-dialog').bindKeyMoveForm('#detailInput :input');
	$('.chosen-select').chosen({
			width : "100%"
	});
});
</script>