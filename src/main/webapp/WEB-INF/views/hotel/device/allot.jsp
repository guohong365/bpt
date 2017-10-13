<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <form:hidden path="id" />
        <form:hidden path="hotel"/>
        <form:hidden path="room"/>        
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
                  <h4 class="widget-title">选择房间</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12">   
                        <div class="dataTables_wrapper form-inline no-footer">
                          <div class="row">
                            <div class="col-xs-12 col-sm-4">                   
                              <label>楼层 ：</label>
                              <input id="searchStorey" class="input-small" />
                            </div>
                            <div class="col-xs-12 col-sm-4">
                              <label>房间：</label>
                              <input id="searchRoom" class="input-small"/>
                            </div>
                            <div class="col-xs-12 col-sm-4">
                              <div class="btn-group">
                                <button class="btn btn-sm btn-success" id="btnResetSearch" type="button">
                                  <i class="act-icon fa fa-refresh"></i>重置
                                </button>                              
                                <button class="btn btn-sm btn-primary" id="btnSearchRoom" type="button">
                                  <i class="ace-icon fa fa-search"></i>搜索                                
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-xs-12">
                              <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                <thead>
                                  <tr>
                                    <th>楼层</th>
                                    <th>房间号</th>
                                    <th></th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${_rooms}" var="room">
                                  <tr data-storey="${room.storey}" data-room="${room.roomNo}">
                                    <td>${room.storey}</td>
                                    <td>${room.roomNo}</td>
                                    <td>
                                      <div class="btn-group">
                                        <button class="btn btn-sm btn-success" data-room-id="${room.id}" type="button">
                                          <i class="ace-icon fa fa-arrow-left bigger-120"></i>分配
                                        </button>
                                      </div>
                                    </td>
                                  </tr>
                                  </c:forEach>                                  
                                </tbody>
                              </table>
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
        </div>
        <div class="modal-footer">
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
		$('#btnResetSearch').on('click', function(){
			$('#searchStorey').val('');
			$('#searchRoom').val('');
		});
		$('#btnSearchRoom').on('click', function(){
			console.log('search clicked....');
			var filter='[data-storey';
			if($('#searchStorey').val()!=''){
				filter += '="'	+ $('#searchStorey').val() +'"';
			}
			filter += '][data-room';
			if($('#searchRoom').val()!=''){
				filter +='="' + $('#searchRoom').val() + '"'; 
			}
			filter +=']';
			console.log('filter='+filter);
			$('[data-storey][data-room]').addClass('hidden');
			$(filter).removeClass('hidden');
		});
		
		$('[data-room-id]').on('click', function(event){			
			event.preventDefault();
			$('[name="room"]').val($(this).attr('data-room-id'));
			$('#detailInput').trigger('submit');
			$('#detail-dialog').modal('close');
		});
	});
</script>