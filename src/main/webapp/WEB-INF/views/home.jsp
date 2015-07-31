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
      <%@ include file="./layout/base-header.jsp" %>
    </jsp:attribute>
    <jsp:attribute name="mainMenu">
      <%@ include file="./layout/main-menu.jsp" %>
    </jsp:attribute>
    <jsp:attribute name="pageBody">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-users fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${customerCount}</div>
                                    <div>Customers</div>
                                </div>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/customer/list">
                            <div class="panel-footer">
                                <span class="pull-left">View All Customers</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-lightbulb-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${reminderCount}</div>
                                    <div>Upcoming Reminders</div>
                                </div>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/notification/list">
                            <div class="panel-footer">
                                <span class="pull-left">View All Reminders</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comment-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">-</div>
                                    <div>Call Logs</div>
                                </div>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/logs">
                            <div class="panel-footer">
                                <span class="pull-left">View All Logs</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-lightbulb-o fa-fw"></i> Reminders
   
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                	
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                	<th>&nbsp;</th>
                                                    <th>Due Date</th>
                                                    <th>Customer</th>
                                                    <th>Notes</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${notifications}" var="notification" varStatus="status">
                                            		<tr id="${notification.id}" class="${notification.status} clickable-row" data-href='${pageContext.request.contextPath}/notification/edit/${notification.id}' style="cursor: pointer;">
														<td width="1%">
	                                            			<a href="${pageContext.request.contextPath}/notification/ack/${notification.id}">
							                                    <i class="fa fa-square-o fa-fw"></i>
							                                </a>
                                            			</td>
                                            			<td width="1%"><fmt:formatDate pattern="MM/dd/yyyy" value="${notification.dueDt}"/></td>
                                            			<td width="21%"><a href="${pageContext.request.contextPath}/customer/${notification.customer.id}">${notification.customer.fullName}</a></td>
                                            			<td>${notification.notes}</td>
                                            		</tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-8 (nested) -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
				 <div class="col-lg-6">
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
	    

	    $('#customer-list').dataTable();
	});
	
	</script>
    </jsp:attribute>
</t:common-layout>