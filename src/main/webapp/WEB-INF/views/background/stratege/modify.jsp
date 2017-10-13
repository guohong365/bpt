<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>${modelTitle }</title>
<div class="row" id="content_container">
  <div class="hidden-xs hidden-sm col-lg-2"></div>
  <div class="col-xs-12 col-lg-8">
    <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
      <form:hidden path="id" />
      <form:hidden path="uuid" />
      <form:hidden path="creater"/>
      <form:hidden path="createTime"/>
      <form:hidden path="billingDateParam1"/>
      <form:hidden path="billingDateParam2"/>
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
                        <form:label path="billingCycle" cssClass="control-label col-xs-12 col-sm-4">结算周期：</form:label>
                        <div class="col-xs-12 col-sm-4">
                          <form:select path="billingCycle" cssClass="form-control chosen-select" data-placeholder="选择结算周期...">
                            <form:option value=""></form:option>
                            <form:option value="周">每周</form:option>
                            <form:option value="月">每月</form:option>
                            <form:option value="季">每季度</form:option>
                            <form:option value="年">每年</form:option>
                          </form:select>
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label class="control-label hidden-xs col-sm-4">&nbsp;</label>
                        <div id="param11" class="col-xs-12 col-sm-4">
                          <select id="weekDay" name="weekDay" class="form-control chosen-select" data-placeholder="选择星期...">
                            <option value=""></option>
                            <c:forEach items="${_weekDays}" var="item">
                              <option value="${item.code}">${item.value}</option>
                            </c:forEach>
                          </select>
                        </div>
                        <div id="param12" class="col-xs-12 col-sm-4">
                          <select id="quarterMonth" name="quarterMonth" class="from-control chosen-select" data-placeholder="选择每季度第几个月...">
                            <option value=""></option>
                            <c:forEach items="${_quarterMonths}" var="item">
                              <option value="${item.code}">${item.value }</option>
                            </c:forEach>
                          </select>
                        </div>
                        <div id="param13" class="col-xs-12 col-sm-4">
                          <select id="month" name="month" class="form-control chosen-select" data-placeholder="选择月份...">
                            <option value=""></option>
                            <c:forEach items="${_months}" var="item">
                              <option value="${item.code }">${item.value }
                            </c:forEach>
                          </select>
                        </div>
                        <div id="param2" class="col-xs-12 col-sm-4">
                          <select id="monthDay" name="monthDay" class="form-control chosen-select" data-placeholder="选择月度内日期...">
                            <option value=""></option>
                            <c:forEach items="${_monthDays}" var="item">
                              <option value="${item.code }">${item.value }</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>  
                    </div>
                  </div>
                </div>
                <div class="hr hr-2"></div>
                <div class="row">
                  <div class="col-xs-12">
                    <div class="col-xs-12 col-sm-6">
                      <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4">创建人：</label>
                        <div class="col-xs-12 col-sm-8">
                          <p class="form-control-static">${detailInput.createrName}</p>
                        </div>
                      </div>
                    </div>
                    <div class=col-xs-6>  
                      <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4">创建时间：</label>
                        <div class="col-xs-12 col-sm-8">
                          <p class="form-control-static"><fmt:formatDate value="${detailInput.createTime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>              
                <div class="modal-footer">
                  <button id="btnSave" class="btn btn-sm btn-primary" type="button">
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
	
	$('.chosen-select').on('change', function(){
		console.log('select['+$(this).attr('name') +'] value=' + $(this).val());
	});
	
	var retrieveParam=function(){
		switch($('#billingCycle').val()){
	  case '周':
		  $('#billingDateParam1').val($('#weekDay').val());
		  break;
		case '月':
			$('#billingDateParam2').val($('#monthDay').val());
			break;
	  case '季':
		  $('#billingDateParam1').val($('#quarterMonth').val());
		  $('#billingDateParam2').val($('#monthDay').val());
		  break;
	  case '年':
      $('#billingDateParam1').val($('#month').val());
	    $('#billingDateParam2').val($('#monthDay').val());
      break;
		}
	};
				
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
						charge:{required : "酒店价格不能为空！",	number:"请填写非负数字，整数或小数！",min:"请填写非负数字，整数或小数！"},
					  billingCycle:{required:"请选择结算周期！"},
						weekDay:{required:"请选择星期几结算！"},
						quarterMonth:{required:"请选择第几季度结算！"  },  
						month:{required:"请选择一年中第几个月结算！"	},
						monthDay:{required:"请选择一月中第几日结算给！"}						
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
					}
	});
		
	var loadDefaultPage=function(){
		console.log('load view page...');
	  $.ajax({
		  url : "mgr/stratege/detail",
		  type : "get",
		  data : "action=view",
		  dataType : "html"
		  })
		  .fail(function(){			  
		  })
		  .done(function(data){
			  $('.page-content-area').html(data);			  
			})
	};	
		
	$('#btnSave').on('click', function(event){
		event.preventDefault();
		$("#btnSave").prop("disable", true);
	  $("#btnCancel").prop("disable", true);
	  retrieveParam();
	  var data=$('#detailInput').serialize();
	  console.log('data=' +data);
	  $.ajax({
		  async: false,
		  url : 'mgr/stratege/detail',
		  type : 'post',
		  data : data
	  })
	  .fail(function(){alert('保存失败！');})
	  .done(function(){alert('保存成功！');});
	  loadDefaultPage();
	});	
		
	$("#btnCancel").on("click", function(event){
		$("#btnSave").prop("disable", true);
		$("#btnCancel").prop("disable", true);
		loadDefaultPage();		
	});	
		
	$('#detailInput').bindKeyMoveForm('#detailInput :input');
	$('.chosen-select').chosen({width : "100%",	disable_search: true});
	
	initSelect();
	
});
</script>