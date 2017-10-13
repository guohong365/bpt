(function($){
	var BatchResultDlgBox=function(parent, result, callback, param){		

		this._callback=callback
		this._param=param;
		this._parent=parent;
		this.msgBox=$('<div>');
		parent.append(this.msgBox);		
		
		var modal_content=$('<div>').addClass('modal-content');
		var modal_dialog=$('<div>').addClass('modal-dialog').append(modal_content);
		
		var modal_header=$('<div>').addClass('modal-header no-padding').append(
				$('<div>').addClass('table-header').append(
						$('<button>').addClass('close').attr('type', 'button').attr('data-dismiss', 'modal').attr('aria-hidden', 'true').append(
								$('<span>').addClass('white').append('&times;')
								)
						).text('处理结果')
				);
		var modal_body=$('<div>').addClass('modal-body');
		var modal_footer=$('<div>').addClass('modal-footer').append(
				$('<button>').addClass('btn btn-sm').attr('data-dismiss', 'modal').append(
						$('<i>').addClass('ace-icon fa fa-times')
						).text('关闭')
				);
		
		var msgForm=$('<form>').addClass('form-horizontal').append(modal_header).append(modal_body).append(modal_footer);
		modal_content.append(msgForm);
				
		var msgInput=$('<div>').addClass('col-xs-12')
		.append($('<div>').addClass('form-group')
			.append($('<label>').addClass('control-label col-xs-12 col-sm-3').text('处理结果：'))
			.append($('<div>').addClass('col-xs-12 col-sm-9').append($('<input>').addClass('form-control').attr('readonly','readonly').val(result.msg)))				
		);		
		var row=$('<div>').addClass('row').append(msgInput);
		modal_body.append(row);
		
		if(result.details && result.details.length>0){
			var items='';
			for(var i=0; i< result.details.length; i++){
			   items += result.details[i].item;
			   if(i<result.details.length-1){
				   items +=',';
			   }
			}
			var text=$('<div>').addClass('col-xs-12')
			.append($('<div>').addClass('form-group')
				.append($('<label>').addClass('form-control col-xs-12').text('错误序列号：')	)
				.append($('<div>').addClass('col-xs-12').append($('<textarea>').addClass('form-control').attr('rows', '5').attr('readonly', 'readonly').val(items)))
			);
			row.append(text);
		}		
		this.msgBox.attr('role','dialog').attr('tableindex','-1').attr('data-backdrop','static').addClass('modal').append(modal_dialog);	
		
		this._parent.on('hidden.bs.modal', $.proxy(this.onClose, this));
		
	};
	
	BatchResultDlgBox.prototype={
		constructor	: BatchResultDlgBox,
		onClose : function(){
			if(this._callback && typeof this._callback =='function'){
				this._callback(this._param);
			}
		},
		show : function(){
			this.msgBox.modal('show');			
		},
		hide : function(){
			this.msgBox.modal('hide');
		}
	};
	
	$.fn.ResultBox=function(result, callback){
		console.log('create new bpg result dlg.....');
		if(this.length==1){
		  return new BatchResultDlgBox(this, result, callback);
		}
		return this;
	};

	console.log('bpg result dlg loaded.....');
	
}(window.jQuery));