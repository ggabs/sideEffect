<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ include file="/view/config/config.jsp" %>
 <%@ include file="/view/config/styleSheetsAndScripts.jsp" %>
 <link rel="stylesheet" type="text/css" href="view/style/css/properties/item.css">
   	<%
	String searchColumn = request.getParameter("searchColumn");
  	if(searchColumn == null){
  		searchColumn = "";
  	}
  	
 	member.Member objMember ;
	long privilegeId = -1;
 	if(session.getAttribute("user") != null){
		objMember = (member.Member) session.getAttribute("user");
		privilegeId = objMember.getPrivilegeId();
	} %>
 	<div>
 	<%@include file="/view/jsp/common/simplePageTitle1.jsp" %>
 	
 	<form method="get" name="medicalDeviceListForm1" action="properties.do">
 			<input type="hidden" value="${param.action }" name="action"/>
 			<input type="hidden" value="${param.pg }" name="pg" />
 			<input type="hidden" value="${param.menu }" name="menu"/>
 		
 		<div class="searchBar1">
 			<select name="searchColumn">
 				<!-- <option value="setFdaSourcePtKor">FDA Source PT(Korean)</option> -->
 				<option value="setFdaSourcePtKor" <%if(searchColumn.equals("setFdaSourcePtKor")){ %>selected="selected"<%} %>>MFDS Source PT(Korean)</option>
 				<option value="setName" <%if(searchColumn.equals("setName")){ %>selected="selected"<%} %>>FDA Source PT(English)</option>
 				<!-- <option value="setFdaCode">FDA Code</option> -->
 				<option value="setFdaCode" <%if(searchColumn.equals("setFdaCode")){ %>selected="selected"<%} %>>MFDS Code</option>
 			</select>
 			<input type="text" name="searchKeyword" value="${param.searchKeyword }">
 			
 			<c:choose>
		 		<c:when test="${!empty medicalDeviceLevel }">
		 			<c:forEach var="medicalDeviceLevel"  items="${medicalDeviceLevel}">
		 				<c:choose>
			 				<%-- <c:when test="${medicalDeviceLevel.id eq 1}"> --%>
			 				<c:when test="${medicalDeviceLevel.id eq 0}">
	 							<input name="medicalDeviceLevel" type="radio" value="${medicalDeviceLevel.id }" checked="checked">${medicalDeviceLevel.propertyValue }
	 						</c:when>
				 			<c:otherwise>
	 							<input name="medicalDeviceLevel" type="radio" value="${medicalDeviceLevel.id }">${medicalDeviceLevel.propertyValue }
	 						</c:otherwise>
 						</c:choose>
			 		</c:forEach>
		 		</c:when>
		 	<c:otherwise>
		 		No level data
		 	</c:otherwise>
 			</c:choose>
 			
 			<img src="view/style/images/bt_search.jpg" class="hover1" alt="검색" id="getSearchButton1">
 		</div><br>
 	
 	<div class="levelBtn1">
 	<%if(privilegeId>1){ %>
 	<c:choose>
 		<c:when test="${!empty medicalDeviceLevel }">
 			<c:forEach var="medicalDeviceLevel"  items="${medicalDeviceLevel}" begin="1" end="6">
	 			<img src="view/style/images/btn_lev${medicalDeviceLevel.id}.jpg" id="submit1" class="listover" alt="level${medicalDeviceLevel.id}등록" onclick="create(${medicalDeviceLevel.id});"/>
	 		</c:forEach>
 		</c:when>
 		<c:otherwise>
 			No level data
 		</c:otherwise>
 	</c:choose>
 	<%} %>
 	</div>
 	
 	<table class=" bbsListType">
 		<thead>
 			<tr style="height:36px; padding: 0;">
 				<th width="1" style="background:url('view/style/images/bar_left.jpg') no-repeat;"></th>
 				<th width="72" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">구분</th>
 				<th width="1" style="vertical-align: middle; padding:0;"><img src="view/style/images/bar_division.jpg"  border="0"/></th>
 				<!-- <th width="92" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">FDA코드</th> -->
 				<th width="92" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">MFDS 코드</th>
 				<th width="1" style="vertical-align: middle; padding:0;"><img src="view/style/images/bar_division.jpg"  border="0"/></th>
 				<!-- <th width="160" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">FDA Source PT(Korean)</th> -->
 				<th width="160" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">MFDS Source PT(Korean)</th>
 				<th width="1" style="vertical-align: middle; padding:0;"><img src="view/style/images/bar_division.jpg"  border="0"/></th>
 				<th width="160" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">FDA Source PT(English)</th>
 				<th width="1" style="vertical-align: middle; padding:0;"><img src="view/style/images/bar_division.jpg"  border="0"/></th>
 				<th width="92" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">사용여부</th>
 				<th width="1" style="vertical-align: middle; padding:0;"><img src="view/style/images/bar_division.jpg"  border="0"/></th>
 				<th width="100" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">수정일자</th>
 				<th width="10" style="background:url('view/style/images/bar_right.jpg') no-repeat;"></th>
 			</tr>
 		</thead>
 		<c:set var="localCount" value="${top }"/>
 		<c:choose>
		 	<c:when test="${!empty requestScope.list }">
		 		<c:forEach var="item" items="${requestScope.list }">
				 	<tr class="listover" onclick="read(${item.id});" >
				 		<td colspan="2">
				 			<c:choose>
				 				<c:when test="${!empty item.depthLevel }">
				 					Level ${item.depthLevel } 
				 				</c:when>
 								<c:otherwise>
				 					-
				 				</c:otherwise>
				 			</c:choose>
				 		</td>
				 		
				 		<td class="subject" colspan="2">${item.fdaCode }</td>
				 		<td colspan="2">${item.fdaSourcePtKor }</td>
				 		<td colspan="2">${item.name }</td>
				 		<td colspan="2">${item.useStatus.propertyValue }</td>
				 	
				 		<td colspan="2">	
				 			<c:choose>
								<c:when test="${!empty item.medicalDeviceMalfunctionHistory }">
									<c:forEach var="medicalDeviceMalfunctionHistory" items="${item.medicalDeviceMalfunctionHistory }" varStatus="i" >
										<c:choose>
										<c:when test="${i.last == true}">
										<fmt:formatDate pattern="yyyy-MM-dd" value="${medicalDeviceMalfunctionHistory.lastModified }"/>
										</c:when> 
										</c:choose>
									 </c:forEach> 
								</c:when>
							</c:choose>
						</td>
				 		
				 	</tr>
				 </c:forEach>
		 	</c:when>
		 	<c:otherwise>
		 		<tr>
		 			<td>no data</td>
				</tr>
			</c:otherwise>
		 </c:choose>
 	</table>
 	<div>
 		${count }
 	</div>
 	<div class="paging">
 		${requestScope.pageString }
 	</div>
 	</form>
 	</div>

 
 <script type="text/javascript" >
 	function read(id){
 		try{
 			//alert(id);
 			location.href = "properties.do?action=readMedicalDevice&menu=3&articleId="+id;
 		}catch(Exception){
 			alert(Exception.message);
 		}
 	}
 	
 	function create(level){
 		location.href="properties.do?action=createMedicalDevicePage&menu=3&level="+level;
 	}
 	
 	$(document).ready(function(){
 		initmedicalDeviceList1Jsp();
 	});
 	
	function initmedicalDeviceList1Jsp(){
 		
 		$("#getSearchButton1").bind("click", function(){
 			medicalDeviceListForm1Submit();
 		});
 		
 	}
	
	function medicalDeviceListForm1Submit(){
 		
 		$("form[name=medicalDeviceListForm1]").submit();
 		
 	}

 </script>
 
 