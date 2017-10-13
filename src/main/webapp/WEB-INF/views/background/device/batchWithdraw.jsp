<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      
      <form id="batch_proccess" class="form-horizontal" role="form" action="#" method="post" enctype="multipart/form-data">        
        <input type="hidden" id="action" name="action" value="${action}" />
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
                  <h4 class="widget-title">批量信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label for="type" class="control-label col-xs-12 col-sm-4"><span class="red">*</span>酒店 ：</label>
                          <div class="col-xs-12 col-sm-8">
                            <select id="param" name="param" class="form-control chosen-select">
                              <option value="">请选择酒店...</option>
                              <c:forEach items="${_HOTELS}" var="item">
                                <option value="${item.code}">${item.value}</option>
                              </c:forEach>
                            </select>
                          </div>
                        </div>
                      </div>                      
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label for="batchFile" class="control-label col-xs-12 col-sm-4"><span class="red">*</span>批量文件：</label>
                          <div class="col-xs-12 col-sm-8">                            
                            <input id="batchFile" name="batchFile" type="file" />
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
  
	$(document).ready(			
			function() {
				$.validator.setDefaults({ ignore: ":hidden:not(#param)" });
				$('#batch_proccess').validate({
					errorElement : 'div',
					errorClass : 'help-block align-right',
					focusInvalid : false,
					rules : {
						param : { required : true},
						batchFile : {required : true},
					  },
					messages : {
						param : {required:"必须选择型号！"},
						batchFile : {required : "请选择上传设备批量处理文件！"	},										
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
				
				$('#batch_proccess').on('submit', function(event){
					event.preventDefault();
					var loading_icon = 'fa-spinner fa-2x orange';
					var loading_text = '<h1 class="red">上传中,请稍候...</h1>';
					var contentArea = $('.page-content-area');
					contentArea.css('opacity', 0.25);
					var loader = $('<div style="position: fixed; z-index: 2000;" class="ajax-loading-overlay"><i class="ajax-loading-icon fa fa-spin '+loading_icon+'"></i> '+loading_text+'</div>').insertBefore(contentArea);
					var offset = contentArea.offset();
					loader.css({top: offset.top, left: offset.left});
					
		      var formData=new FormData(document.getElementById("batch_proccess"));
		      $.ajax({
		        async: false,
		        url: "<c:url value='/mgr/device/batchFile' />",
		        type: "post",
		        data: formData,
		        processData:false,
		        contentType:false,
		        }).complete(function(){
		        	contentArea.css('opacity', 1);
		        	contentArea.prevAll('.ajax-loading-overlay').remove();
		        }).fail(function(){
		        	alert("error")
		        }).done(function(data){
		          console.log('process ok....');
		          $('#dialogPanel').ResultBox(data, function(){
		            $('#detail-dialog').modal('hide');
		            $('#content_container').data('pageBinder').onRefresh();      
		          }).show();
		        });
		    });
				
				$('#detail-dialog').bindKeyMoveForm('#batch_proccess :input');
				$('#param').chosen({width:"100%"});
				
		    $('#batchFile').ace_file_input({
		          no_file:'选择批量处理文件上传 ...',
		          btn_choose:'浏览...',
		          btn_change:'浏览...',
		          droppable:false,
		          onchange:null,
		          thumbnail:false //| true | large
		          //whitelist:'gif|png|jpg|jpeg'
		          //blacklist:'exe|php'
		          //onchange:''
		          //
		        });
				
			});
</script>