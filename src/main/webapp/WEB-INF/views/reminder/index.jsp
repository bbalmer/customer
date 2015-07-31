<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:common-layout>
	<jsp:attribute name="pageTitle">Bright Spirit Customer Log</jsp:attribute>
    <jsp:attribute name="pageHeader" >
      <%@ include file="../layout/base-header.jsp" %>
    </jsp:attribute>
    <jsp:attribute name="mainMenu">
      <%@ include file="../layout/main-menu.jsp" %>
    </jsp:attribute>
    <jsp:attribute name="pageBody">

	 		<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">${type} Reminder</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            &nbsp;
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <form role="form" action="${pageContext.request.contextPath}/notification/save" method="post">
                                	<input type="hidden" id="id" name="id" value="${notification.id}"/>
                                	<input type="hidden" id="customerId" name="customerId" value="${notification.customer.id}"/>
                                	<div class="col-lg-12">
                                        <div class="form-group">
                                            <label>Customer</label>
                                            <div class="form-control-static">${notification.customer.fullName}</div>
                                        </div>
                                        <div class="form-group">
                                            <label>Due Date</label>
                                            <input type="text" class="form-control" id="dueDt" name="dueDt" placeholder="Due Date" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${notification.dueDt}"/>">
                                        </div>
                                        <div class="form-group">
                                            <label>Notes</label>
                                            <textarea id="notes" name="notes" class="form-control" rows="10" cols="8">${notification.notes}</textarea>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>    
                                        <button type="button" id="delete" data-id="${notification.id}" class="btn btn-danger">Delete Reminder</button>
                                    
                                   		</div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->

    </jsp:attribute>
    <jsp:attribute name="jsIncludes">	
    	<script type="text/javascript">

    	jQuery(document).ready(function($) {
    	    $( "#dueDt" ).datepicker();
    	    
    	    
    	    $("#delete").click(function() {
    	    	if(confirm("Are you sure you want to delete this call reminder?")) {
    	    		var url = CONTEXT_PATH+"/notification/delete/"+$(this).data("id");
    	    		var customerId = $(this).data("customer");
    	    		$.get(url, function(data) {
    	    			window.location = CONTEXT_PATH+"/customer/"+customerId;
    	    		});
    	    	}
    	    });
    	    
    	});
	
	</script>
    </jsp:attribute>
</t:common-layout>

</body>

</html>