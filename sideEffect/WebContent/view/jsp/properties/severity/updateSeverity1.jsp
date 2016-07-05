<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ include file="/view/config/config.jsp" %>
 <%@ include file="/view/config/styleSheetsAndScripts.jsp" %>
 <script type="text/javascript" src="${pageContext.request.contextPath }/view/js/jquery-ui-1.10.3/js/jquery-ui-1.10.3.min.js"></script>
 <link rel="stylesheet" type="text/css" href="view/js/jquery-ui-1.10.3/css/ui-lightness/jquery-ui-1.10.3.custom.min.css"/>
 <link rel="stylesheet" type="text/css" href="view/style/css/properties/item.css">
 	<%
 	member.Member objMember ;
	long privilegeId = -1;
 	if(session.getAttribute("user") != null){
		objMember = (member.Member) session.getAttribute("user");
		privilegeId = objMember.getPrivilegeId();
	} %>
 	<div style="width: 100%; height: 99%;">
 	<%@include file="/view/jsp/common/simplePageTitle1.jsp" %>
 	<form name="severityCreateForm1" method="POST" action="properties.do">
 		<input type="hidden" name="action" value="updateSeverity"/>
 		<input type="hidden" name="articleId" value="${article.id }"/>
 		<input type="hidden" value=<%=privilegeId %> name="privilegeId" />
	 	<table class="bordered fitToParent view_table" >
	 		<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="80%" />
			</colgroup>
			<thead>
				<tr>
					<th colspan="3">공통 코드 관리 - 위해심각도 코드</th>
				</tr>
			</thead>
			<tbody>
				<tr class="itemProperty">
					<th class="tdHead" colspan="2">Level</th>
					<td class="tdBody" >${article.depthLevel }</td>	
				</tr>
				<c:if test="${article.depthLevel eq 2 }">
					<tr class="itemProperty">
					<th class="tdHead" colspan="2">상위코드</th>
					<td class="tdBody">${parent.propertyValue }</td>
				</tr>
				</c:if>
				<tr class="itemProperty">
					<th class="tdHead" colspan="2">점수</th>
					<td class="tdBody" ><input type="text" name="value" value="${article.value }" /></td>	
				</tr>
				<tr class="itemProperty">
					<th class="tdHead" colspan="2">분류</th>
					<td class="tdBody" ><input type="text" name="propertyValue" value="${article.propertyValue }" /></td>	
				</tr>
				<tr class="itemProperty createTextarea">
					<th class="tdHead" colspan="2">위해심각도(Severity) 설명</th>
					<td class="tdBody" ><textarea name="severityName">${article.severityName }</textarea>
					</td>	
				</tr>
				<tr class="itemProperty">
					<th class="tdHead" colspan="2">적용시작일</th>
					<td class="tdBody" >
						<input type="text" id="startDate" name="startDate" 
						value="<fmt:formatDate pattern="yyyy-MM-dd" value="${article.startDate }"/>" />
					</td>	
				</tr>
				<tr class="itemProperty">
					<th class="tdHead" rowspan="4">이력 현황</th>
					<%-- <th class="tdHead" >적용일자</th>
					<td class="tdBody" ><input type="text" id="lastModified" name="lastModified" value="${article.lastModified }"/></td --%>
					<th class="tdHead" >작성일자</th>
					<td class="tdBody" ><input type="text" id="activeFrom" name="activeFrom" /></td>
				</tr>
				<tr class="itemProperty">
					<th class="tdHead" >구분</th>
					<td class="tdBody">
						<select name="historyType" >
							<c:choose>
								<c:when test="${!empty requestScope.historyType  }">
									<c:forEach var="hType" items="${historyType }">
										<c:choose>
											<c:when test="${hType.propertyValue eq '개정'}">
												<option selected="selected" value="${hType.id }">${hType.propertyValue }</option>
											</c:when>
											<c:otherwise>
												<option value="${hType.id }">${hType.propertyValue }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="-1">no data</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>	
				</tr>
				<tr class="itemProperty">
					<th class="tdHead" >담당자</th>
					<td class="tdBody">
						<input type="hidden" name="historyManager" value="${sessionScope.user.accountName}" />${sessionScope.user.accountName}
					</td>
				</tr>
				<tr class="itemProperty createTextarea">
					<th class="tdHead" >사유</th>
					<td class="tdBody"><textarea name="historyDescription"></textarea></td>
				</tr>
				<tr class="itemProperty">
					<th class="tdHead" colspan="2">현재 이력</th>
					<td class="tdBody">
						<table>
						<colgroup>
						<col width="15%" />
						<col width="15%" />
						<col width="10%" />
						<col width="10%" />
						<col width="40%" />
						<col width="10%" />
						</colgroup>
						<tr class="itemProprty">
							<!-- <th>변경일자</th> -->
							<th>작성일자</th>
							<th>구분</th>
							<th>담당자</th>
							<th colspan="2">사유</th>
						</tr>
						<c:choose>
							<c:when test="${!empty article.severityHistory }">
								<c:forEach var="severityHistory" items="${article.severityHistory }">
						<tr class="itemProperty">
							<%-- <td><fmt:formatDate pattern="yyyy-MM-dd" value="${severityHistory.lastModified }"/></td> --%>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${severityHistory.activeFrom }"/></td>
							<td class="tdBody">
							<c:choose>
								<c:when test="${!empty requestScope.historyType }">
									<c:forEach var="hType" items="${historyType }">
										<c:choose>
											<c:when test="${severityHistory.historyType eq hType.id }">
												${hType.propertyValue }
											</c:when>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
							</td>
							<td><c:choose>
								<c:when test="${!empty article.severityHistory }">
										${severityHistory.manager }
								</c:when>
							</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${!empty severityHistory.historyDescription }">
									<textarea disabled="disabled" name="historyDescription"/>${severityHistory.historyDescription }</textarea>
									</c:when>
								</c:choose>
							</td>
							<td id="history${severityHistory.id }"><img src="view/style/images/btn_tab03.jpg" class="hover1" alt="이력삭제" onclick="deleteHistory('${severityHistory.id}','<%=privilegeId %>');"/></td>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
					</td>
				</tr>
				<tr class="itemProperty">
					<th class="tdHead" colspan="2">사용여부</th>
					<td class="tdBody">
						<select name="isInUse" >
							<c:choose>
								<c:when test="${!empty requestScope.isInUse  }">
									<c:forEach var="useStat" items="${isInUse }">
										<c:choose>
											<c:when test="${useStat.id eq article.isInUse }">
												<option selected="selected" value="${useStat.id }">${useStat.propertyValue }</option>
											</c:when>
											<c:otherwise>
												<option value="${useStat.id }">${useStat.propertyValue }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="-1">no data</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
				</tr>
			</tbody>
 	</table>
	 	
	 	</form>
	 	
	 	<div class="btnType3">
	 		<img src="view/style/images/btn_ok.jpg" id="submit1" alt="확인" class="buttonised" onclick="createSeverity();"/>
	 		<img src="view/style/images/bt_cancel.jpg" id="cancel1" alt="취소" class="buttonised" onclick="cancel();"/>
	 	</div>
	 	
 	</div>
 	
 	<script>
 	 
 		function createSeverity(){
 			$("form[name=severityCreateForm1]").submit();			
 		}
 		
 		function cancel(){
 			history.back();
 		}
 		
 		$(document).ready(function(){
 			
 			initPage();
 			
 		});
 		
 		function initPage(){
 			$("#startDate").datepicker({dateFormat: 'yy-mm-dd'});
 			$("#activeFrom").datepicker();
 			$("#activeFrom").datepicker("option", "dateFormat", "yy-mm-dd");
 		}
 		
 		function deleteHistory(articleId,privilegeId){
 			if(privilegeId>1){
 			var method = "get";
 			var url = "properties.do?action=deleteSeverityHistory&articleId="+articleId+"&privilegeId="+privilegeId;
 			var xhr = new XMLHttpRequest();
 			xhr.open(method,url, true);
 			xhr.send();
 			
 			xhr.onreadystatechange = function(){
 				
 				if(xhr.readyState==4 && xhr.status==200){
 					//alert(xhr.responseText );
 					if( xhr.responseText =="1" ||  xhr.responseText ==1){
 						alert("삭제성공");
 						
 						$("#history"+articleId).remove();
 					}else alert("권한이 없습니다.");
 				}
 				
 			};
 			}
 		}
 	</script>
 