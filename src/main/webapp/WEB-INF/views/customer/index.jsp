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
                    <h1 class="page-header">
                    	<c:choose>
                    		<c:when test="${customer.id ge 1}">Edit</c:when>
                    		<c:otherwise>Add</c:otherwise>
                    	</c:choose> Contact
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <form role="form" action="${pageContext.request.contextPath}/customer/add" method="post">
                                <input type="hidden" name="id" value="${customer.id}">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>First Name</label>
                                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" value="${customer.firstName}">
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" value="${customer.lastName}">
                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" class="form-control" id="address" name="address" placeholder="Address" value="${customer.address}">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="address2" name="address2" placeholder="Address 2" value="${customer.address2}">
                                        </div>
                                        <div class="form-group">
                                            <label>City</label>
                                            <input type="text" class="form-control" id="city" name="city" placeholder="City" value="${customer.city}">
                                        </div>
                                        <div class="form-group">
                                            <label>State Name</label>
                                            <select class="form-control" id="state" name="state" >
	                                            <option value="AL">Alabama</option>
												<option value="AK">Alaska</option>
												<option value="AZ">Arizona</option>
												<option value="AR">Arkansas</option>
												<option value="CA">California</option>
												<option value="CO">Colorado</option>
												<option value="CT">Connecticut</option>
												<option value="DE">Delaware</option>
												<option value="DC">District Of Columbia</option>
												<option value="FL">Florida</option>
												<option value="GA">Georgia</option>
												<option value="HI">Hawaii</option>
												<option value="ID">Idaho</option>
												<option value="IL" selected="selected">Illinois</option>
												<option value="IN">Indiana</option>
												<option value="IA">Iowa</option>
												<option value="KS">Kansas</option>
												<option value="KY">Kentucky</option>
												<option value="LA">Louisiana</option>
												<option value="ME">Maine</option>
												<option value="MD">Maryland</option>
												<option value="MA">Massachusetts</option>
												<option value="MI">Michigan</option>
												<option value="MN">Minnesota</option>
												<option value="MS">Mississippi</option>
												<option value="MO">Missouri</option>
												<option value="MT">Montana</option>
												<option value="NE">Nebraska</option>
												<option value="NV">Nevada</option>
												<option value="NH">New Hampshire</option>
												<option value="NJ">New Jersey</option>
												<option value="NM">New Mexico</option>
												<option value="NY">New York</option>
												<option value="NC">North Carolina</option>
												<option value="ND">North Dakota</option>
												<option value="OH">Ohio</option>
												<option value="OK">Oklahoma</option>
												<option value="OR">Oregon</option>
												<option value="PA">Pennsylvania</option>
												<option value="RI">Rhode Island</option>
												<option value="SC">South Carolina</option>
												<option value="SD">South Dakota</option>
												<option value="TN">Tennessee</option>
												<option value="TX">Texas</option>
												<option value="UT">Utah</option>
												<option value="VT">Vermont</option>
												<option value="VA">Virginia</option>
												<option value="WA">Washington</option>
												<option value="WV">West Virginia</option>
												<option value="WI">Wisconsin</option>
												<option value="WY">Wyoming</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Zip Code</label>
                                            <input type="text" class="form-control" id="zip" name="zip" placeholder="Zip Code" value="${customer.zip}">
                                        </div>
                                 	</div>
                                	<div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" value="${customer.email}">
                                        </div>
                                        <div class="form-group">
                                            <label>Home Phone</label>
                                            <input type="tel" class="form-control" id="homePhone" name="homePhone" placeholder="Home Phone" value="${customer.homePhone}">
                                        </div>
                                        <div class="form-group">
                                            <label>Cell Phone</label>
                                            <input type="tel" class="form-control" id="cellPhone" name="cellPhone" placeholder="Cell Phone" value="${customer.cellPhone}">
                                        </div>
                                        <div class="form-group">
                                        	<label>Referred By</label>
                                        	<input type="text" class="form-control" id="referredBy" name="referredBy" placeholder="Referred By" value="${customer.referredBy}">
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
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
            </div>
            <!-- /.row -->
        </div>

    </jsp:attribute>
    <jsp:attribute name="jsIncludes">	
    	<script type="text/javascript">

    	jQuery(document).ready(function($) {
    	    $(".clickable-row").click(function() {
    	        window.document.location = $(this).data("href");
    	    });
    	    
    	    $( "#referredBy" ).autocomplete({
    	        source: CONTEXT_PATH+"/customer/search",
    	        minLength: 2,
    	        select: function( event, ui ) {
    	        	$("#referredBy").val(ui.item);
    	        }
    	      });
    	});
	
	</script>
    </jsp:attribute>
</t:common-layout>

</body>

</html>
	    



