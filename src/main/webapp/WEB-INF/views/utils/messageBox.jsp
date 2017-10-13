<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="detail-dialog" class="modal" tabindex="-1" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header no-padding">
        <div class="table-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
            <span class="white">&times;</span>
          </button>
          ${dlgTitle}
        </div>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            ${dlgMessage}
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button id="btnCancel" class="btn btn-sm" data-dismiss="modal">
          <i class="ace-icon fa fa-times"></i>关闭
        </button>
      </div>
    </div>
  </div>
</div>
