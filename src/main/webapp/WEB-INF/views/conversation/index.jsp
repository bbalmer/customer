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
                    <h1 class="page-header">Call Log</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Conversation with <h3>${customer.fullName}</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <form role="form" action="${pageContext.request.contextPath}/log/save" method="post">
                                <input type='hidden' name="id"  value="${log.id}"/>
                                <input type='hidden' name='customerId' value="${customer.id}"/>
                            
                                        <div class="form-group">
                                            <label>Type of contact</label>
                                            <select class="form-control" id="type" name="type">
                                            	<option value="email">Email</option>
                                            	<option value="phone">Phone</option>
                                            	<option value="in person">In Person</option>
                                            	<option value="in home event">In Home Event</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Contact Date</label>
                                            <input type="text" class="form-control" id="contactDate" name="contactDate" placeholder="Contact Date" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${log.contactDate}"/>" >
                                        </div>
                                        <div class="form-group">
                                            <label>Notes</label>
                                            <textarea rows="10" cols="80" class="form-control" id="notes" name="notes">${log.notes}</textarea>
                                        </div>
                                 	
                                        <button type="submit" class="btn btn-default">Save Log</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                        <button type="button" id="delete" data-id="${log.id}" data-customer="${customer.id}" class="btn btn-danger">Delete Log</button>
                                    </form>
                       
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
  

    </jsp:attribute>
    <jsp:attribute name="jsIncludes">	
    	<script type="text/javascript">

    	jQuery(document).ready(function($) {
    	    $( "#contactDate" ).datepicker();
    	    
    	    $("#delete").click(function() {
    	    	if(confirm("Are you sure you want to delete this call log?")) {
    	    		var url = CONTEXT_PATH+"/log/delete/"+$(this).data("id");
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
