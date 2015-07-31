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
                    <h1 class="page-header">Call Log Listing</h1>
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
                                         	<th>Date</th>
											<th>Type</th>
											<th>Notes</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                     	<c:forEach items="${logs}" var="log" varStatus="status">
                                     		<tr class='clickable-row' data-href='${pageContext.request.contextPath}/log/edit?id=${log.id}'>
												<td width="15%"><fmt:formatDate pattern="MM/dd/yyyy" value="${log.contactDate}"/></td>
												<td width="1%">${log.type}</td>
												<td>${log.notes}</td>
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