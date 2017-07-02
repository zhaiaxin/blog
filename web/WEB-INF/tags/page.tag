<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="curIndex" type="java.lang.Long" required="true"%>
<%@ attribute name="pageSize" type="java.lang.Long" required="true"%>
<%@ attribute name="pagerRange" type="java.lang.Long" required="true"%>
<%@ attribute name="totalPage" type="java.lang.Long" required="true"%>
<%@ attribute name="formId" type="java.lang.String" required="true"%>
<%
    long begin = Math.max(1, curIndex - pagerRange/2);
    long end = Math.min(begin + (pagerRange-1),totalPage);

    request.setAttribute("p_begin", begin);
    request.setAttribute("p_end", end);
%>

<script type="text/javascript">
    function gotoPage(pageIndex){
        var queryForm = document.getElementById("queryForm");
        var action = queryForm.action;
        var pageSize = document.getElementById("p_pageSizeSelect").value;
        action += "?pageIndex=" + pageIndex + "&pageSize=" + pageSize;

        queryForm.action =action;
        queryForm.submit();
    }

    function gotoPageByBtn(){
        var pageIndex = document.getElementById("p_pageIndex").value;
        var pageIndexInt = parseInt(pageIndex);
        var totalPage = ${totalPage};

        if(pageIndexInt>0 && pageIndexInt<totalPage){
            gotoPage(pageIndex);
        }
        else{
            alert("输入页数超出范围!");
        }
    }
</script>
<table class="pager">
    <tr>
        <% if (curIndex!=1){%>
        <td><a href="javascript:gotoPage(1)">首页</a></td>
        <td><a href="javascript:gotoPage(<%=curIndex-1%>)">上一页</a></td>
        <%}else{%>
        <td class="disabled"><a href="#">首页</a></td>
        <td class="disabled"><a href="#">上一页</a></td>
        <%}%>

        <c:forEach var="i" begin="${p_begin}" end="${p_end}">
            <c:choose>
                <c:when test="${i == curIndex}">
                    <td class="active"><a href="#">${i}</a></td>
                </c:when>
                <c:otherwise>
                    <td><a href="javascript:gotoPage(${i})">${i}</a></td>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <% if (curIndex==totalPage){%>
        <td><a href="#">下一页</a></td>
        <td><a href="#">末页</a></td>
        <%}else{%>
        <td class="disabled"><a
                href="javascript:gotoPage(<%=curIndex+1%>)">下一页</a></td>
        <td class="disabled"><a
                href="javascript:gotoPage(<%=totalPage%>)">末页</a></td>
        <%}%>
        <td><a>共${totalPage}页</a></td>
        <td class="input_li">跳转到:<input type="text" id="p_pageIndex"
                                        size="2" value="<c:out value="${pageIndex}"/>" />页 <input
                type="button" id="gotoBtn" onclick="gotoPageByBtn()" value="GO" /></td>
        <td class="input_li">每页: <select id="p_pageSizeSelect"
                                         onchange="gotoPage(<%=curIndex%>)">
            <option value="3" <c:if test="${pageSize==3}">selected</c:if>>3条</option>
            <option value="5" <c:if test="${pageSize==5}">selected</c:if>>5条</option>
            <option value="7" <c:if test="${pageSize==7}">selected</c:if>>7条</option>
        </select>
        </td>
    </tr>
</table>
