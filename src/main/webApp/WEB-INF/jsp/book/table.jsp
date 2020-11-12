<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书列表</title>
	<link rel="stylesheet" type="text/css"
		  href="../../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css"
		  href="../../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/demo/demo.css">
	<script type="text/javascript" src="../../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	// 定义事件方法
	function onSearch() {
		// 指定请求路径
		var opts = $("#dg").datagrid("options");
		opts.url = "./list3";
		// 获取查询参数
		var name = $("#name").val();
		var price = $("#price").val();
		// 组织参数
		var params = {};
		if (name != null && name.trim() != '') {
			params.name = name;
		}
		if (price != null && price.trim() != '') {
			params.price = price;
		}
		// 重新载入表格数据
		$("#dg").datagrid('load', params);
	}
</script>
</head>
<body>
	<div style="margin: 20px 0;"></div>
	<div class="easyui-layout" style="width: 100%; height: 350px;">
		<div data-options="region:'north'" style="height: 50px">
			<form id="searchForm" method="post">
				<table>
					<tr>
						<td>书籍名称：</td>
						<td><input id="name" name="name"
							class="easyui-textbox" data-options="prompt:'输入书籍名称...'"
							style="width: 100%; height: 32px"></td>
						<td>价格</td>
						<td><input id="price" name="price" class="easyui-textbox"
							data-options="prompt:'输入价格...'" style="width: 100%; height: 32px">
						</td>
						<td><a href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-search'" style="width: 80px"
							onclick="onSearch()">查询</a></td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',title:'书籍列表',iconCls:'icon-ok'">
			<table id="dg" class="easyui-datagrid"
data-options="border:false,singleSelect:true,
fit:true,fitColumns:true">
				<thead>
					<tr>
						<th data-options="field:'id'" width="80">编号</th>
						<th data-options="field:'name'" width="100">名称</th>
						<th data-options="field:'price'" width="80">价格</th>
						<th data-options="field:'cover'" width="80">封面</th>
					</tr>
				</thead>
				<tbody>
					<!--使用forEach渲染数据模型-->
					<c:forEach items="${bookList}" var="book">
						<tr>
							<td>${book.id}</td>
							<td>${book.name}</td>
							<td>${book.price}</td>
							<td>
								<c:if test="${book.cover!=null}">
									<img src="${book.cover}" alt="OKK" width="200px" height="100px">
								</c:if>
								<c:if test="${book.cover==null}">
									<form action="/file/upload" method="post" enctype="multipart/form-data" >
										<input type="hidden" name="id" value="${book.id}">
										<input type="file" class="form-control" name="file" id="file">
										<input type="submit" value="添加头像"/>
									</form>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>