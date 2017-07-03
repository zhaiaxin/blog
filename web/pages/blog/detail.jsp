<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="indi.zhaiaixn.blog.util.WebContents" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>详情页</title>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Archivo+Narrow:400,700" rel="stylesheet" type="text/css">
    <link href="../../resources/css/style.css" rel="stylesheet" type="text/css" media="screen" />
    <style>
        table {
            display: block;
            width: 100%;
            overflow: auto;
            word-break: normal;
            word-break: keep-all;
        }
         table th {
            font-weight: bold;
        }

        table th,
        .markdown-body table td {
            padding: 6px 13px;
            border: 1px solid #ddd;
        }

        table tr {
            background-color: #fff;
            border-top: 1px solid #ccc;
        }

        table tr:nth-child(2n) {
            background-color: #f8f8f8;
        }
        table thead tr, table thead tr {
            background-color: #F8F8F8;
        }
        .post{
            background-color: #fff;
        }
    </style>
</head>
<body>
<div id="menu-wrapper">
    <div id="menu">
        <ul>
            <li class="current_page_item"><a href="<%=WebContents.listBlogPaging%>">Blog</a></li>
            <c:if test="${sessionScope.user != null}"><li><a href="<%=WebContents.toAddOrUpdate%>">add</a></li></c:if>
            <li><a href="#">About</a></li>
            <li><a href="https://github.com/zhaiaxin">GitHub</a></li>
        </ul>
    </div>
    <!-- end #menu -->
</div>
<%--<div id="banner-wrapper">--%>
    <%--<div id="banner"><a href="#"><img src="../../resources/images/img01.jpg" width="1200" height="300" alt="" /></a></div>--%>
<%--</div>--%>
<div id="header-wrapper">
    <div id="header">
        <div id="logo">
            <h1>${blog.title}</h1>
        </div>
    </div>
</div>
<div id="wrapper">
    <!-- end #header -->
    <div id="page">
        <div id="page-bgtop">
            <div id="page-bgbtm">


                <!-- end #sidebar -->
                    <div id="content">
                        <div class="post">
                            <div style="clear: both;">&nbsp;</div>
                            <div class="entry">
                                        ${blog.html_content}
                            </div>
                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>

                <!-- end #content -->


                <div style="clear: both;">&nbsp;</div>
            </div>
        </div>
    </div>
    <!-- end #page -->
</div>
<div id="footer">
    <p>&copy; 2013 Sitename.com. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
</div>
<!-- end #footer -->
</body>
</html>
