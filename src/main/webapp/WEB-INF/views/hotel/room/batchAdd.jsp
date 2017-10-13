<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="batchInput" class="form-horizontal" role="form" action="#" method="post">
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
                  <h4 class="widget-title">房间信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4"><span class="red" >*</span>楼层：</label>
                          <div class="col-xs-12 col-sm-8">
                            <input id="storey" name="storey" class="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4"><span class="red">*</span> 房间号规则：</label>
                          <div class="col-xs-12 col-sm-8">
                            <input id="pattern" name="pattern" class="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4"><span class="red">*</span>起始编号：</label>
                          <div class="col-xs-12 col-sm-8">
                            <input id="begin" name="begin" class="form-control" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4"><span class="red">*</span>结束编号：</label>
                          <div class="col-xs-12 col-sm-8">
                            <input id="end" name="end" cssClass="form-control" type="text" />
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="checkbox-inline col-sm-offset-4">
                            <input id="ignoreDuplicated" name="ignoreDuplicated" type="checkbox" />忽略重复编号
                          </label>
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
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#batchInput').validate({
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
				pattern : { required : true},
				begin : {required : true, digits:true, min : 1},
				end: {required :true, digits:true, min : 1}
		    },
		  messages : {
			  storey : { required : '[楼层]不能为空！', digits : '请输入数字！'},
			  pattern : { required : '[房间编号规则]不能为空！'},
			  begin : {required : '[起始编号]不能为空！', digits : '请输入数字！', min : '请输入大于1的整数'},
			  end:{required : '[结束编号]不能为空！', digits : '请输入数字！', min : '请输入大于1的整数'}
		    }		    
		});
		
		$('#batchInput').on('submit', function(event){
			event.preventDefault();
			if(!$('#batchInput').valid()){
				return false;
			}
			$.ajax({
				type : 'post',
				url : '<c:url value="/hotel/room/batchAdd" />',
				data : $('#batchInput').serialize(),
				dataType : 'json'
			}).fail(function(){
		          
	    }).done(function(data){
	    	$('#dialogPanel').ResultBox(data, function(){
          $('#detail-dialog').modal('hide');
          $('#content_container').data('pageBinder').onRefresh();      
        }).show();
	    });
	    //$('#detail-dialog').modal('hide');
		});
		
		$('#detail-dialog').bindKeyMoveForm('#batchInput :input');
	});
</script>