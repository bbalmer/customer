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
                    <h1 class="page-header">Reminder Listing</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <table class="table table-striped">
                                     <thead>
                                         <tr>
                                         	<th>&nbsp;</th>
                                             <th>Due Date</th>
                                             <th>Customer</th>
                                             <th>Notes</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                     	<c:forEach items="${reminders}" var="notification" varStatus="status">
	                                    	<tr class='${notification.status} clickable-row' data-href='${pageContext.request.contextPath}/notification/edit/${notification.id}'>
                                     			<td width="1%">
                                     				<c:choose>
                                     					<c:when test="${notification.ack eq false}">
	                                            			<a href="${pageContext.request.contextPath}/notification/ack/${notification.id}">
							                                    <i class="fa fa-square-o fa-fw"></i>
							                                </a>
                                     					</c:when>
                                     					<c:otherwise>
	                                            			<a href="${pageContext.request.contextPath}/notification/ack/${notification.id}">
							                                    <i class="fa fa-check-square-o fa-fw"></i>
							                                </a>
                                     					</c:otherwise>
                                     				</c:choose>
                                     			
                                     			<td width="10%"><fmt:formatDate pattern="MM/dd/yyyy" value="${notification.dueDt}"/></td>
                                     			<td width="20%">${notification.customer.fullName}</td>
                                     			<td>${notification.notes}</td>
                                     		</tr>
                                     	</c:forEach>
                                     </tbody>
								</table>
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
    	});
	
	</script>
    </jsp:attribute>
</t:common-layout>

</body>

</html>