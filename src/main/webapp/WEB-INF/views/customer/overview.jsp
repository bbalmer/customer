
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
                    <h1 class="page-header">Customer Contact Log</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
            	<div class="col-md-4">
            		<h3 style="margin:0">${customer.firstName}&nbsp;${customer.lastName}</h3>
            		${customer.address}<br/>
            		<c:if test="${customer.address2}">
            			${customer.address2}<br/>
            		</c:if>
            		${customer.city}&nbsp;${customer.state}&nbsp;${customer.zip}
            	</div>
            	<div class="col-md-4">
            		${customer.email}<br/>
            		${customer.homePhone} <c:if test="${customer.homePhone ne null}"> (home)</c:if><br/>
            		${customer.cellPhone} <c:if test="${customer.cellPhone ne null}"> (cell)</c:if><br/>
            		<c:if test="${customer.referredBy ne null}">
            			Referred By ${customer.referredBy}
            		</c:if>
            	</div>
            	
				<div class="col-md-4">
<!-- 					<div class="panel panel-default"> -->
<!-- 						<div class="panel-heading"> -->
<!--                             <i class="fa fa-bullseye fa-fw"></i> Action Panel -->
<!--                         </div> -->
<!--                         <div class="panel-body"> -->
                            <div class="list-group">
                                <a class="list-group-item" href="${pageContext.request.contextPath}/log/add?id=${customer.id}">
                                    <i class="fa fa-comment fa-fw"></i> Add Call Log
                                </a>
                                <a class="list-group-item" href="${pageContext.request.contextPath}/notification/add/${customer.id}">
                                    <i class="fa fa-lightbulb-o fa-fw"></i> Add Reminder
                                </a>
                                <a class="list-group-item" href="${pageContext.request.contextPath}/customer/edit/${customer.id}">
                                    <i class="fa fa-edit fa-fw"></i> Edit Customer
                                </a>
                                <a class="list-group-item delete-customer" href="#" data-href="${pageContext.request.contextPath}/customer/delete/${customer.id}">
                                    <i class="fa fa-remove fa-fw"></i> Delete Customer
                                </a>
                            </div>
<!--                         </div> -->
                       
<!-- 					</div> -->
				</div>
            	
            	
            	
           	</div>
           	<div class="row">
           		<div class="col-md-12">
           			&nbsp;
           		</div>
           	</div>
            <div class="row">
                <div class="col-md-6">
                    <!-- /.panel -->
                    <div class="panel panel-default">
                       <div class="panel-heading">
                            <i class="fa fa-phone fa-fw"></i> Call Log
                        </div>
                        <div class="panel-body">
 
			                                <table class="table table-striped">
												<thead>
													<tr>
														<th>Date</th>
														<th>Type</th>
														<th>Notes</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${logs}" var="conversation" varStatus="status">
														<tr class='clickable-row' data-href='${pageContext.request.contextPath}/log/edit?id=${conversation.id}' style="cursor: pointer;">
															<td width="15%"><fmt:formatDate pattern="MM/dd/yyyy" value="${conversation.contactDate}"/></td>
															<td width="1%">${conversation.type}</td>
															<td>${conversation.notes}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-lightbulb-o  fa-fw"></i> Reminders
						</div>
				   		<div class="panel-body">
				   		
			                       		<table class="table table-striped">
                                            <thead>
                                                <tr>
                                                	<th>&nbsp;</th>
                                                    <th>Due Date</th>
                                                    <th>Notes</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${reminders}" var="notification" varStatus="status">
                                            		<tr id="${notification.id}" class="${notification.status} clickable-row" data-href='${pageContext.request.contextPath}/notification/edit/${notification.id}' style="cursor: pointer;">
														<td width="1%">
	                                            			<a href="${pageContext.request.contextPath}/notification/ack/${notification.id}">
							                                    <i class="fa fa-square-o fa-fw"></i>
							                                </a>
                                            			</td>
                                            			<td width="15%"><fmt:formatDate pattern="MM/dd/yyyy" value="${notification.dueDt}"/></td>
                                            			<td>${notification.notes}</td>
                                            		</tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
				   		
				        </div>
				                       
					</div>
				</div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>

                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->

    </jsp:attribute>
    <jsp:attribute name="jsIncludes">	
    	<script type="text/javascript">

    	jQuery(document).ready(function($) {
    	    $(".clickable-row").click(function() {
    	        window.document.location = $(this).data("href");
    	    });
    	    
    	    $(".delete-customer").click(function() {
    	    	if(confirm("Are you sure you want to delete this record?")) {
    	    		
    	    		var delUrl = $(this).data("href");
    	 
    	    		$.get( delUrl, function(data){
    	    			window.location= CONTEXT_PATH+"/customer/list";
    	    			
    	    		});
    	    	}
    	    });
    	});
	
	</script>
    </jsp:attribute>
</t:common-layout>

</body>

</html>

