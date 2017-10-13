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
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-2">名称：</label>
                          <div class="col-xs-12 col-sm-10">
                            <p class="form-control-static blue">${detailInput.name}</p>
                          </div>
                        </div>
                      </div>

                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-2">地址：</label>
                          <div class="col-xs-12 col-sm-10">
                            <p class="form-control-static blue">${detailInput.address}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">电话：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.tele}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">联系人：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.linkman}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-2">备注：</label>
                          <div class="col-xs-12 col-sm-10">
                            <p class="form-control-static blue">${detailInput.description}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="hr hr-2"></div>
                    <div class="row">  
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">设备总数：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.totalDevice}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">公用数：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.publicUsage}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">  
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">收费标准：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.chargeStandard}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">酒店收费：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.charge}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">分成比例：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.ratio}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">                        
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-2">结算周期：</label>
                          <div class="col-xs-12 col-sm-10">
                            <p class="form-control-static blue">${detailInput.billingCycleString}</p>
                          </div>
                        </div>
                      </div>
                    </div>
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
                      <c:if test="${detailInput.valid}">
                      <div class="col-xs-12">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-2">有效：</label>
                          <div class="col-xs-12 col-sm-10">
                            <p class="form-control-static blue">有效</p>
                          </div>
                        </div>
                      </div>                    
                      </c:if>  
                      <c:if test="${!detailInput.valid }">
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">注销人：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatDate value="${detailInput.cancelaterName}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">注销时间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.cancelTime}</p>
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