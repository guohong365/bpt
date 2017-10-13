<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>演示数据生成</title>
<div class="row" id="content_container">
  <div class="hidden-xs hidden-sm col-lg-2"></div>
  <div class="col-xs-12 col-lg-8">
    <form id="detailInput" class="form-horizontal" role="form" action="#" method="post">
      <input type="hidden" id="action" name="action" value="" />
      <div class="row">
        <div class="col-xs-12">
          <div class="form-group">
            <label for="hotel" class="control-label col-xs-12 col-sm-4">酒店 ：</label>
            <div class="col-xs-12 col-sm-8">
              <select id="hotel" name="hotel" class="form-control chosen-select" data-placeholder="选择酒店..." >
                <c:forEach items="${_hotels}" var="hotel">
                  <option value="${hotel.id}">${hotel.name}</option>
                </c:forEach>
              </select>
            </div>
          </div>
        </div>  
        <div class="col-xs-12">
          <div class="form-group">
            <label  for="count" class="control-label col-xs-12 col-sm-4">次数：</label>
            <div class="col-xs-12 col-sm-8">
              <input id="count" name="count" class="form-control" placeholder="输入使用次数..." />
            </div>
          </div>
        </div>
       </div>
       <div class="row">
         <div class="col-xs-2"></div>
         <div class="col-xs-8">
           <div class="btn-group">
             <button class="btn btn-success" type="button" data-action="GEN_STATUS">生成设备状态</button>
             <button class="btn btn-success" type="button" data-action="GEN_USAGES">生成使用数据</button>
             <button class="btn btn-success" type="button" data-action="GEN_BILLS">生成账单</button>             
           </div>
         </div>
         <div class="col-xs-2"></div>
       </div>    
    </form>
  </div>
</div>
<script type="text/javascript">
var scripts = [ null, null ]
ace.load_ajax_scripts(scripts, function() {
	
	$('.chosen-select').on('change', function(){
		console.log('select['+$(this).attr('name') +'] value=' + $(this).val());
	});
	
	
	$('[data-action]').on('click', function(event){
		event.preventDefault();
		$(this).prop('disabled', true);
		var data='action='+$(this).attr('data-action') + '&hotel=' + $('#hotel').val() + '&count=' + $('#count').val();
		
	  $.ajax({
		  url : 'demo/demo',
		  type : 'post',
		  data : data,
		  dataType:'json'
	  })
	  .fail(function(){alert('操作失败！');})
	  .done(function(){alert('操作成功！');});
	  $(this).prop('disabled', false);
	});	
		
	$('.chosen-select').chosen({width : "100%",	disable_search: true});
	
});
</script>