<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <form:form modelAttribute="detailInput" cssClass="form-horizontal" role="form" action="#" method="post">
        <input type="hidden" id="action" name="action" value="${action }" />
        <form:hidden path="id" />
        <form:hidden path="uuid" />
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
                  <h4 class="widget-title">账单信息</h4>
                </div>
                <div class="widget-body">
                  <div class="widget-main">
                    <div class="row">
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">生成时间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatDate value="${detailInput.generatedTime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></p>
                          </div>
                        </div>
                      </div>
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
                          <label class="control-label col-xs-12 col-sm-4">酒店收入：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatNumber type="currency" pattern="￥0.00" value="${detailInput.income}" /> </p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">分成收入：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatNumber type="currency" pattern="￥0.00" value="${detailInput.basicCharge}" /></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">应付分成：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatNumber type="currency" pattern="￥0.00"  value="${detailInput.rent}" /></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">状态：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.state}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">付款时间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatDate value="${detailInput.payTime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">付款人：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.payerName}</p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">确认时间：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue"><fmt:formatDate value="${detailInput.verifyTime}" pattern="yyyy年MM月dd日 HH:mm:ss" /></p>
                          </div>
                        </div>
                      </div>
                      <div class="col-xs-12 col-sm-6">
                        <div class="form-group">
                          <label class="control-label col-xs-12 col-sm-4">确认人：</label>
                          <div class="col-xs-12 col-sm-8">
                            <p class="form-control-static blue">${detailInput.verifierName}</p>
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
            <i class="ace-icon fa fa-times"></i> 关闭
          </button>
        </div>
      </form:form>
    </div>
  </div>
</div>
