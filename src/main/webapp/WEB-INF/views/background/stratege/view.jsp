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
                        <label class="control-label col-xs-12 col-sm-4">收费标准 ：</label>
                        <div class="col-xs-12 col-sm-8">
                          <fmt:parseNumber var="standard" value="${detailInput.chargeStandard}" />                          
                          <p class="form-control-static"><fmt:formatNumber value="${standard}" type="currency" currencySymbol="￥" /></p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4">分成比例：</label>
                        <div class="col-xs-12 col-sm-8">
                          <fmt:parseNumber var="ratio" value="${detailInput.ratio}" />
                          <p class="form-control-static" ><fmt:formatNumber value="${ratio}" type="percent" minFractionDigits="2" /></p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4">酒店价格：</label>
                        <div class="col-xs-12 col-sm-8">
                          <fmt:parseNumber value="${detailInput.charge}" var="charge" />
                          <p class="form-control-static" ><fmt:formatNumber value="${charge}" type="currency" currencySymbol="￥" /></p>
                        </div>
                      </div>
                    </div>
                    <div class="col-xs-12">
                      <div class="form-group">
                        <label class="control-label col-xs-12 col-sm-4">结算周期：</label>
                        <div class="col-xs-12 col-sm-8">
                          <p class="form-control-static">${detailInput.billingCycleString}</p>
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
                  <button id="btnModify" class="btn btn-sm btn-primary right" type="submit">
                    <i class="ace-icon fa fa-pencil"></i> 编辑
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
	$('#detailInput').on("submit", function(event){
		  $("#btnModify").prop("disable", true);
		  event.preventDefault();
			$.ajax({
			 url : "mgr/stratege/detail",
			 type : "get",
			 data : "action=modify&selectedId=${detailInput.id}",
			 dateType : "html"
			})
			.fail(function(){
				alert("进入编辑模式错误！");
			})
			.done(function(data){
				$('.page-content-area').html(data);
			});		
	});
});
</script>