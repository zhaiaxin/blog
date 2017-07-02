<%@ page import="indi.zhaiaixn.blog.util.WebContents" %>
<%@ page import="indi.zhaiaixn.blog.entity.Blog" %>
<%@ page import="indi.zhaiaixn.blog.dao.BlogDao" %>
<%@ page import="indi.zhaiaixn.blog.dao.impl.BlogDaoImpl" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Joiner-Axin
  Date: 2017/7/1
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写博客</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/editormd/examples/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/editormd/css/editormd.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" />
    <style>
        .title{
            display: inline-block;
            width: 80%;
            vertical-align: middle;
            border: none;
            text-align: left;
            padding: 15px 0 15px 90px;
            height: 100px;
            overflow: hidden;
            white-space: nowrap;
            font-size: 46px;
            margin-right: 4.5%;
        }
        .sub{
            display: inline-block;
            width: 10%;
            height: 50px;
            font-size: 24px;
            color: #ffffff;
            background-color: #be1a21;
            text-align: center;
            line-height: 50px;
            border: none;
        }
        .header{
            background-color: #fff;
        }
        .introduction{
            width: 100%;
            min-height: 200px;
        }
        .edit_intro h1{
            font-size: 24px;
            margin: 20px 10px;
            color: #000 !important;
        }
        .category{
            margin-top: 20px;
            width: 95%;
            padding: 3px 2.5%;
        }
    </style>
</head>
<body>
<div id="layout">
<form action="<%=WebContents.newOrUpdateBlog%>" method="post">
    <input type="hidden" name="id" value="${blog.id}">
    <%--<input type="hidden" name="abstracts" value="0">--%>
    <%--<input type="hidden" name="category" value="0">--%>
    <header>
        <h1 class="header">
            <input type="text" name="title" value="${blog.title}" placeholder="请填入标题" class="title">
            <input type="submit" value="发表博客" class="sub">
        </h1>
    </header>

    <div id="test-editormd">

        <textarea class="editormd-markdown-textarea" name="content" >${blog.content}</textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <textarea class="editormd-html-textarea" name="html_content"></textarea>
    </div>
    <div class="pop_edit edit_intro">

        <div class="context">
            <%--<form action="<%=WebContents.newOrUpdateBlog%>" id="form" method="post">--%>

                <h1>摘要</h1>
                <textarea placeholder="简单总结" name="abstracts" class="introduction" required="required">${blog.abstracts}</textarea>
                分类：
                <input type="text" name="category" class="category" required="required" >


                <div class="success">
                    <input type="submit" value="确认提交">
                </div>
            <%--</form>--%>

        </div>
    </div>
</form>


</div>
<script src="<%=request.getContextPath()%>/resources/editormd/examples/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/editormd/editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function() {
        testEditor = editormd("test-editormd", {
            width   : "90%",
            height  : 640,
            syncScrolling : "single",
            path    : "<%=request.getContextPath()%>/resources/editormd/lib/",
            saveHTMLToTextarea : true
        });


    });
</script>
<script type="text/javascript">
    $(document).ready(function() {

        // 点击显示填写信息
        var show = $(".sub");
        show.click(function() {
            $(".wrap").show();
            $(".pop_edit").show();
        });
        // 点击隐藏填写信息
        var hide = $(".fa-times");
        hide.click(function() {
            $(".wrap").hide();
            $(".pop_edit").hide();
        });
        $(".ok").click(function() {
            var user_name = $(".userName").val();
            var sex = $(".sex_radio:checked").val();
            var phone_number = $(".phone_number").val();
            var industry = $(".industry").val();
            var occupation = $(".occupation").val();
            var introduction = $(".introduction").val();
            $.ajax({
                url: '', //需要填写地址！
                type: 'GET',
                dataType: 'html',
                data: {
                    userName: user_name,
                    phoneNumber: phone_number,
                    industry: industry,
                    occupation: occupation,
                    sex: sex,
                    introduction: introduction
                },
                success: function () {
                    console.log("成功了！")
                }
            })
        });
    });
</script>
</body>
</html>
