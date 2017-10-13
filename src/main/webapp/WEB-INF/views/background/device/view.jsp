<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <input type="hidden" id="action" name="action" value="${action }" />
        <form:hidden path="id" />
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
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">设备名称：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.name}</p>
                          </div>
                        </div>
                      </div> 
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">设备型号：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.typeName}</p>
                          </div>
                        </div>
                      </div>                                         
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">设备编号：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.serialNo}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">状态：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.statusDetail}</p>
                          </div>
                        </div>
                      </div>                      
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">有效：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">
                              <c:if test="${detailInput.valid}">有效</c:if>
                              <c:if test="!${detailInput.valid}">报废</c:if>
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">  
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">酒店：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.hotelName}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">房间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.roomNo}</p>
                          </div>
                        </div>
                      </div>
                      <c:if test="${detailInput.publicUsage}">                      
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4"></label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">公用</p>
                          </div>
                        </div>
                      </div>
                      </c:if>
                    </div>
                    <div class="hr hr-2"></div>
                    <div class="row">  
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">录入人：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.inputerName}</p>
                          </div>
                        </div>
                      </div>                      
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">录入时间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">
                              <fmt:formatDate value="${detailInput.inputTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">修改人：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.modifierName}</p>
                          </div>
                        </div>
                      </div>                      
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">修改时间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatDate value="${detailInput.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
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
	$(document).ready(function() {
		<c:if test="${action eq 'view'}" >
		$('#btnCancel').text('关闭');
		$('#btnSave').addClass('hide');
		</c:if>
	});
</script>