/**
 * 
 */
(function($) {
	var ListPageOperatorBinder = function(options, element) {
		this._o = {
			bindSorter : true,   
			bindAction : true,
			bindPagation : true,
			bindExport : true,
			bindColumnSelect : true,
			bindDetailInput :true,
			
			baseUrl : '',
			detailUrl : '',
			refreshUrl : '',
			listUrl : '',
			exportUrl : '',
			selectColumnUrl :'',			
			
			beforeSave : function(){
				return true;
			},
			afterSave : function() {
				$('[id="pageCtrl.total"').val('-1');	
				return true;
			},
			reset : function() {
				// $('#queryInput').reset(); 
			},
			getDetailData : null
		};
		console.info('set up options....');
		this.setOption(options);
		
		$('[data-rel="tooltip"]').tooltip();
		var binder=this;
		$(element).on('click', '#btnReset', $.proxy(this.onClickReset, binder));
		console.info('search from reset button is binded...... ');
		$(element).on('click', '#btnSearch', $.proxy(this.onClickSearch,binder));
		console.info('search form search button is binded......');
		if(this._o.bindAction){
			$(element).on('click', '[data-action]', $.proxy(this.onClickAction, binder));
			console.info('action buttons are binded ......');
		} else {
			console.warn('action buttons are not binded......');
		}
		if(this._o.bindSorter){
			$(element).on('click', '[data-column]', $.proxy(this.onClickSortingColumn,binder));
			console.info('sort columns are binded......');
		} else {
			console.warn('sort columns are not binded.....')
		}
		if(this._o.bindDetailInput){
			$(element).on('submit','#detailInput', $.proxy(this.onSubmitDetail, binder));
			console.info('detail input form is binded.......');
		} else {
			console.warn('detail input form is not binded......')
		}
		if(this._o.bindPagation){
			$(element).on('click', '[data-page]', $.proxy(this.onPagationClicked, binder));
			console.info('pagation buttons are binded.....');
		} else {
			console.warn('pagation buttons are not binded.......');
		}
		
		if(this._o.bindExport){
			$(element).on('click', '[data-export]', $.proxy(this.onClickExport, binder));
			console.info('export button is binded.....');
		} else {
			console.warn('exprot button is not binded.....');
		}
		if(this._o.bindColumnSelect){
			$(element).on('click', '[data-column-select]', $.proxy(this.onClickSelectColumn, binder));
			$(element).on('submit', '#columns-form', $.proxy(this.onSubmitColumnSelection, binder));
			console.info('column select button is binded......');			
		} else {
			console.warn('column select button is not binded.......');
		}
		
	};

	ListPageOperatorBinder.prototype = {
		constructor : ListPageOperatorBinder,
		
		setOption : function(options) {
			console.log('optoins type is :' + typeof options);
			if (typeof options === 'object') {
				if (typeof options.bindSorter === 'boolean') {
					console.info('options set sorter:' + options.bindSorter);
					this._o.bindSorter = options.bindSorter;
				}
				if (typeof options.bindAction === 'boolean') {
					console.info('options set bind to action: ' + options.bindAction);
					this._o.bindAction = options.bindAction;
				}
				if (typeof options.bindPagation === 'boolean') {
					console.debug('options set bind to pagatoin : ' + options.bindPagation);
					this._o.bindPagation = options.bindPagation;
				}
				if (typeof options.bindExport==='boolean'){
					console.debug('options set bind to export :' + options.bindExport);
					this._o.bindExport=ontions.bindExport;
				}
				if(typeof options.bindDetailInput === 'boolean'){
					console.debug('options set bind to detailInput:' + options.bindDetailInput);
					this._o.bindDetailInput=options.bindDetailInput;
				}
				if(typeof options.bindColumnSelect === 'boolean'){
					console.debug('options set bint to columnSelect' +  options.bindColumnSelect);
					this._o.bindColumnSelect=options.bindColumnSelect;
				}
				
				if(typeof options.baseUrl === 'string'){
					this._o.baseUrl = options.baseUrl;
					this._o.detailUrl = this._o.baseUrl + '/detail';
					this._o.listUrl = this._o.baseUrl + '/list';
					this._o.refreshUrl = this._o.baseUrl + '/table';
					this._o.exportUrl = this._o.baseUrl + '/export';
					this._o.selectColumnUrl = this._o.baseUrl + '/columns';					
				}
				
				if (typeof options.detailUrl === 'string') {
					console.info('options set detail url :' + options.detailUrl);
					this._o.detailUrl = options.detailUrl;
				}
				if (typeof options.refreshUrl === 'string') {
					console.info('optoins set refresh url : '+ options.refreshUrl);
					this._o.refreshUrl = options.refreshUrl;
				}
				if(typeof options.listUrl === 'string'){
					console.info('options set list url: ' + options.listUrl);
					this._o.listUrl=options.listUrl;
				}
				if(typeof options.exportUrl==='string'){
					console.info('options set export url:' + options.exportUrl);
					this._o.exportUrl = options.exportUrl;
				}
				if(typeof options.selectColumnUrl === 'string'){
					console.info('options set column selection url:' + options.selectColumnUrl);
					this._o.selectColumnUrl = options.selectColumnUrl;
				}
				
				if (typeof options.afterSave === 'function') {
					console.info('afterSave overrided....');
					this._o.afterSave = options.afterSave;
				}
				if (typeof options.beforeSave === 'function'){
					console.info('beforeSave overrided...');
					this._o.beforeSave= options.beforeSave;
				}
				if (typeof options.reset == 'function') {
					console.info('reset overried...')
					this._o.reset = options.reset;
				}
				this.dumpOptions(this._o);
				return;
			} else if (typeof options === 'function') {
				console.info('set options by callback....');
				optoins(this._o);
				this.dumpOptions(this._o);
				return;
			}
			alert('default optioins is not allowed!');
		},
		
		dumpOptions: function(o){
			console.info('options: ');
			console.info('  bindSorter=[' + o.bindSorter +']');			
			console.info('  bindAction=[' + o.bindAction + ']');
			console.info('  bindPagation=[' + o.bindPagation + ']');
			console.info('  bindExport=[' + o.bindExport +']');
			console.info('  bindColumnSelect=[' + o.bindColumnSelect + ']');
			console.info('  bindDetailInput=[' + o.bindDetailInput +']');
				
			console.info('  baseUrl=[' + o.baseUrl +']');
			console.info('  detailUrl=[' + o.detailUrl + ']');
			console.info('  refreshUrl=[' + o.refreshUrl +']');
			console.info('  listUrl=[' + o.listUrl + ']');
			console.info('  exportUrl=[' + o.exportUrl + ']');
			console.info('  selectColumnUrl=[' + o.selectColumnUrl + ']');
		},
		

		onClickSearch : function(event) {
			var loading_icon = 'fa-spinner fa-2x orange';
			var loading_text = '<h1 class="red">加载中,请稍候...</h1>';
			var contentArea = $('.page-content-area');
			//alert(contentArea.html());
			contentArea.css('opacity', 0.25)
			
			var loader = $('<div style="position: fixed; z-index: 2000;" class="ajax-loading-overlay"><i class="ajax-loading-icon fa fa-spin '+loading_icon+'"></i> '+loading_text+'</div>').insertBefore(contentArea);
			var offset = contentArea.offset();
			loader.css({top: offset.top, left: offset.left})
			
			console.log('on search....');
			event.preventDefault();
			console.log($('#queryInput'));
			console.log('search param :' + $('#queryInput').serialize());
			$.ajax({
				async: false,
				type : 'POST',
				url : this._o.listUrl,
				data : $('#queryInput').serialize(),
				dataType : 'html'
			})
			.complete(function(){
				contentArea.css('opacity', 1);
				contentArea.prevAll('.ajax-loading-overlay').remove();
			}).done(function(data) {
				console.log('search completed....');
				$('#listResult').html(data);
			}).fail(function() {
				console.log('seach fialed.');
			});
			return false;
		},
		onClickReset : function(event) {
			if (typeof this._o.reset === 'function') {
				this._o.reset();
			} else {
				// $('#queryInput').reset();
			}
			return false;
		},
		onRefresh : function() {
			$.ajax({
				async : false,
				type : 'POST',
				url : this._o.refreshUrl,
				data : $('#FORM_TABLE_FUNCTION').serialize(),
				dataType : 'html'
			}).done(function(data) {
				console.log('refresh table loaded...');
				$('#listResult').html(data);
			}).fail(function() {
				console.error('table loaded failed.');
			});
		},

		onClickAction : function( event ) {			
			var actionName = $(event.target).attr('data-action');
			console.log('action button clicked: ' + actionName);
			var action = $('#action');
			action.val(actionName);
			var selectedId = $('#selectedId');
			selectedId.val($(event.target).attr('data-item'));
			console.log('event.taget: ' + event.target);
			$.ajax({
				async: false,
				type : "GET",
				url : this._o.detailUrl,
				data : $('#FORM_TABLE_FUNCTION').serialize(),
				dataType : "html"
			}).done(function(data) {
				console.log('detail dialog loaded....');
				$('#dialogPanel').html(data);
				$('#detail-dialog').modal('show');
			}).fail(function(xhr, code, exp) {
				console.error('detail dialog loaded failed.');
				alert("error:" + code + " exp:" + exp);
			});
			return false;
		},
		onClickSortingColumn : function(event) {
			var columnName = $(event.target).attr('data-column');
			console.log('column [' + columnName + '] clicked for sorting');			
			if ($(event.target).attr('data-active')) {
				console.log('same column clicked, just toggle');
				this.toggleOrder($('[id="queryInput.queryOrder"]'));
			} else {
				$('[id="queryInput.queryOrder"]').val('asc');
				$('[id="queryInput.queryOrderBy"]').val(columnName);
			}
			console.log('order =' + $('[id="queryInput.queryOrder"]').val());
			console.log('orderby=' + $('[id="queryInput.queryOrderBy"]').val());			
			this.onRefresh();
		},
		toggleOrder : function(target) {
			console.log('---toggle order----');
			var order = target.val();
			console.log('-- old order=' + order);
			if (!order || order === 'desc') {
				target.val('asc');
			} else {
				target.val('desc');
			}
			console.log('current order=' + target.val());
		},
		
		onPagationClicked : function(event) {		
			var pageAction = $(event.target).attr('data-page');
			console.log('page to' + pageAction);
			switch (pageAction) {
			case "first":
				console.log("current page is " + $('input[id="pageCtrl.current"]').val());
				$('input[id="pageCtrl.current"]').val("0");				
				console.log("current page set to " + $('input[id="pageCtrl.current"]').val());
				break;
			case "prior":
				console.log("current page is " + $('input[id="pageCtrl.current"]').val());
				var cur = parseInt($('input[id="pageCtrl.current"]').val()) - 1;
				$('input[id="pageCtrl.current"]').val(cur);
				console.log("current page set to " + $('input[id="pageCtrl.current"]').val());
				break;
			case "next":
				console.log("current page is " + $('input[id="pageCtrl.current"]').val());
				var cur = parseInt($('input[id="pageCtrl.current"]').val()) + 1;
				$('input[id="pageCtrl.current"]').val(cur);
				console.log("current page set to " + $('input[id="pageCtrl.current"]').val());
				break;
			case "last":
				console.log("current page is " + $('input[id="pageCtrl.current"]').val());
				var cur = $('input[id="pageCtrl.pageCount"]').val();
				$('input[id="pageCtrl.current"]').val(parseInt(cur)-1);
				console.log("current page set to " + $('input[id="pageCtrl.current"]').val());
				break;
			default:
				console.log("current page is " + $('input[id="pageCtrl.current"]').val());
				$('input[id="pageCtrl.current"]').val("0");
				console.log("current page set to " + $('input[id="pageCtrl.current"]').val());
				break;
			}
			this.onRefresh();
			return false;
		},
		onSubmitDetail : function( event ) {
			event.preventDefault();
			$("#btnSave").attr("disabled", true);
			if (!$("#detailInput").valid()) {
				$("#btnSave").attr("disabled", false);
				return false;
			}
			if ( typeof this._o.beforeSave ==='function'){
				if(!this._o.beforeSave()){
					return false;
				}
			}
			console.log('this :' + this._o.detailUrl);
			
			var saveData='';
			if(this._o.getDetailData && typeof this._o.getDetailData==='function'){
				saveData=this._o.getDetailData();
			} else {
				saveData = $("#detailInput").serialize();
			}
			console.log('saveData:' + saveData);
			$.ajax({
				async : false,
				type : "POST",
				url : this._o.detailUrl,
				data : saveData,
				dataType : "text"
			}).done(function(data) {
				console.log('data saved...')
				alert(data);
			}).fail(function(xhr, data, exp) {
				console.error('data save filed.');
				alert(exp);
			});
			$("#detail-dialog").modal('hide');
			
			if (typeof this._o.afterSave === 'function') {
				if(this._o.afterSave()){
					this.onRefresh();
					console.log('table refreshed.');
				};
			}
			return false;
		},
		onClickSelectColumn : function(event){
			console.info('column select button clicked......');
			var mode=$(event.target).attr("data-column-select");
			console.info('mode=[' + mode +']');
			if(this._o.selectColumnUrl && mode ){
				event.preventDefault();
				$.ajax({
					type : 'GET',
					url : this._o.selectColumnUrl,
					data : 'mode=' + $(event.target).attr("data-column-select"),
					  dataType : 'html'
				}).done(function(data){
					$('#page-dialog').html(data);
					$('#column-dialog').modal();
				})
				.fail(function(xhr, code, exp){
					alert("failed!");
				});
				return false;
			}
			console.error('url or mode not be set.......');
			return true;
			
		},
		onSubmitColumnSelection : function(event){
			if(this._o.selectColumnUrl){
				event.preventDefault();
				$("#btnSaveColumns").attr("disabled", true);
				var dataStr="";
				$('#columns-form [data-column-name]').each(function(){
					if($(this).prop('checked')){
						dataStr +='1';
					} else {
						dataStr +='0';
					}
				});
				dataStr= "columns=" + dataStr;
				$.ajax({
					type : 'POST',
					url : this._o.selectColumnUrl,
					data : dataStr + '&mode=' + $('#columns-form #mode').val(),
					dataType : 'text'
				})
				.done(function(data){					
				})
				.fail(function(xhr, error, exp){
					alert("系统错误，设置失败！")
				});
				$('#column-dialog').modal('hide');
				this.onRefresh();
				return false;
			}
			console.error('column selection post url may not be set propertly.....');
			return true;
		},
		
		onClickExport : function(event){
			console.info('export button was clicked.....');
			if(this._o.exportUrl){
				event.preventDefault();
				console.info('to export from ['+ this._o.exportUrl +'].......');
				$('#FORM_TABLE_FUNCTION').attr('action', this._o.exportUrl);
				$('#FORM_TABLE_FUNCTION').attr('method', 'post');
				$('#FORM_TABLE_FUNCTION').submit();
				return false;
			} 
			console.error('export url may not be set propertly......');
		}
	};
	$.fn.bindPage = function(options) {
		this.each(function() {
			var el = $(this);
			if (el.data('pageBinder')) {
				el.data('pageBinder').remove();
			}			
			console.log('bind to page....');
			el.data('pageBinder', new ListPageOperatorBinder(options, el));
		});
	};
	console.error('page binder loaded!');
}(window.jQuery));

