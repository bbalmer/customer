<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="pageTitle" fragment="true" %>
<%@attribute name="mainMenu" fragment="true" %>
<%@attribute name="pageHeader" fragment="true" %>
<%@attribute name="pageBody" fragment="true" %>
<%@attribute name="cssIncludes" fragment="true" %>
<%@attribute name="jsIncludes" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><jsp:invoke fragment="pageTitle"/></title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/site.css" rel="stylesheet">

    <jsp:invoke fragment="cssIncludes"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
            <!-- Top Page Header -->
			<jsp:invoke fragment="pageHeader"/>
			
			<!-- Left Main Menu -->
			<jsp:invoke fragment="mainMenu"/>
			
            
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
  			<jsp:invoke fragment="pageBody"/>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<script type="text/javascript">
		var CONTEXT_PATH = '${pageContext.request.contextPath}'; <%-- For use in downstream js files --%>
	</script>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/raphael/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bower_components/morrisjs/morris.min.js"></script>


    <!-- Custom Theme JavaScript -->
    
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/jquery-ui/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/jquery-ui/dataTables.bootstrap.js"></script>

    <jsp:invoke fragment="jsIncludes"/>
</body>

</html>
