<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/view/config/config.jsp" %>
<%@ include file="/view/config/styleSheetsAndScripts.jsp" %>


 <%
 	int pg = Function.nullChk(request.getParameter("pg"),0);
 	String sv = Function.nullChk(request.getParameter("sv"),"");
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="view/style/css/properties/common.css" >
<link rel="stylesheet" type="text/css" href="view/style/css/properties/item.css" >
<title>Insert title here</title>

<script type="text/javascript">

//function submit(articleId, name){
	//alert(articleId, name);
	     //    alert(opener.document.safetyCreateForm1);
//	opener.document.safetyCreateForm1.meb_item_manuf_id.value = articleId;
//	opener.document.safetyCreateForm1.meb_item_manuf_name.value = name;
//	window.close();
//}


function search(index){
		var frm = document.manufImportEntpNameListForm1;
		//alert(frm.entpName[index].value);
		if(index != -1){
			frm.sv.value = frm.entpName[index].value;
		}else{
			//frm.sv.value = frm.entpName.value;
		}
		frm.submit();
		
	}
	
	function EnterDown(){
		if(event.keyCode == 13) {
			search();
		}
	}
	

	/* function winClose(id, entp_name){
		//alert("ddd");
		opener.document.safetyCreateForm1.meb_item_manuf_id.value = id;
		opener.document.safetyCreateForm1.meb_item_manuf_name.value = entp_name;
		window.close();
 	} */
	
</script>

</head>
<body>
<form name="manufImportEntpNameListForm1" method="post" action="meb_item.do">
<div style="margin: 30px 0 0 5px;">
	<div style="margin-bottom: 30px;"><%@include file="/view/jsp/common/simplePageTitle1.jsp" %></div>
	<div style="margin-bottom: 10px;"><font color="red">업소명</font> > 품목명 > 형명</div>

	<div>
		
			<input type="hidden" name="action" value="entp_name_search" />
			업소명 : <input type="text" name="sv" value="<%=sv %>" onkeypress="EnterDown()" />
			<img src="view/style/images/bt_search.jpg" class="hover1" alt="검색" onclick="search(-1)"> 
    	
	</div><br>

	<table class="bordered bbsListType" style="width: 500px; ">

 		<thead>
 			<tr style="height:36px; padding: 0;">
 				<th width="1" style="background:url('view/style/images/bar_left.jpg') no-repeat;"></th>
 				<th width="70" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">
 					No
 				</th>
 				<th width="1" style="vertical-align: middle; padding:0;"><img src="view/style/images/bar_division.jpg"  border="0"/></th>
 				<th width="120" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">
 					업허가번호
 				</th>
				<th width="1" style="vertical-align: middle; padding:0;"><img src="view/style/images/bar_division.jpg"  border="0"/></th>
 				<th width="287" style="background:url('view/style/images/bar_bg.jpg') repeat-x;">
 					업소명
 				</th>
 				<th width="10" style="background:url('view/style/images/bar_right.jpg') no-repeat;"></th>	
 				
 			</tr>
 		</thead>
 		
 		<c:choose>
		 	<c:when test="${!empty requestScope.list }">
		 		<c:forEach var="company" items="${requestScope.list }" varStatus="i">	

			 		<tr class="listover" onMouseOver="this.style.backgroundColor='#F6F6F6'" onMouseOut="this.style.backgroundColor='#FFFFFF'" onclick="search(${i.index})">
		 				<td colspan="2">${top - i.index }</td>

		 				<!-- 
		 				<td>${meb_item.meddev_item_seq }</td>
		 				 -->

		 				<td colspan="2">${company.meddev_entp_no}</td>  
		 				<td colspan="2">${fn:replace(company.entp_name, '"', "") }</td>
						<input type="hidden" name="entpName" value=${fn:replace(company.entp_name, '"', "")}>
				
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




 		 <div class="paging" style="min-width: 0">
 			${requestScope.pageString }
 	     </div>
 	</div>	
 		
	
	
	
	
</form>
</body>
</html>