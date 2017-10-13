<%@page import="com.uc.web.utils.SystemConfig"%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>欢迎使用</title>

<!-- ajax layout which only needs content area -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<div class="alert alert-block alert-success">
			<i class="icon-ok green"></i> 
			<h1>欢迎使用 <strong class="green">
			<%=SystemConfig.getInstance().getConfigString("system.name", "") %><%=(SystemConfig.getInstance().getConfigString("SystemType","").equals("test")?"-测试版":"")%> (<%=SystemConfig.getInstance().getConfigString("system.version", "") %>)
			</strong>。</h1>
		</div>
    <div class="row">
      <div class="col-xs-12">
        <c:forEach items="${notices}" var="item">
          <c:set var="level" value="widget-color-blue" />          
          <c:choose>
            <c:when test="${item.importantLevel == 2 }">
              <c:set var="level" value="widget-color-orange" />
            </c:when>
            <c:when test="${item.importantLevel == 3 }">
              <c:set var="level" value="widget-color-red" />
            </c:when>
          </c:choose>
          <div class="widget-box ${level}">
            <div class="widget-header">
              <h5 class="widget-title"><strong>（${item.levelName}通知）</strong>${item.title}</h5>
              <div class="widget-toolbar">
                <a data-action="collapse" href="#">
                  <i class="ace-icon fa fa-chevron-up"></i>
                </a>
                <a data-action="close" href="#">
                  <i class="ace-icon fa fa-times"></i>
                </a>
              </div>
            </div>
             <div class="widget-body">
                <div class="row">
                  <div class="col-xs-12">
                    <h2 class="text-center">${item.title}</h2>
                  </div>
                  <div class="col-xs-4 col-xs-offset-8" >
                    <p class="text-left">
                                                                                发布人：${item.authorName}&nbsp;&nbsp;
                                                                                发布时间：<fmt:formatDate value="${item.publishTime}" pattern="yyyy年MM月dd日"/>&nbsp;&nbsp;&nbsp;
                       <c:if test="${item.expireTime!=null}">
                                                                                失效时间:<fmt:formatDate value="${item.expireTime}" pattern="yyyy年MM月dd日"/>
                       </c:if>
                                                                              
                    </p>
                  </div>
                </div>
                <div class="row">
                <div class="col-xs-10 col-xs-offset-1">
                ${item.mainText}
                </div>
                </div>
             </div>
          </div>      
          <div class="space-16"></div>   
        </c:forEach>
      </div>
    </div >
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
	var scripts = [null, null]
	ace.load_ajax_scripts(scripts, function() {
	  //inline scripts related to this page
	});
</script>
