
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>
<%@ include file="../header.jspf"%>

<title>课程评教详情|${course.name}</title>
</head>
<style>
	.tab-pane{
		padding-top: 5px;
	}
</style>
<body>
	<div class="container-fluid">
        <div class="row">
		    <%@ include file="../head.jsp"%>
        </div>
		<div class="row " >
			<div class="col-sm-2">
				<%@ include file="../left.jsp"%>
			</div>
			<div class="col-sm-10 ">
				<table
					class="table table-hover table-striped " style="text-align: center">
					<tr class="info">
						<td>课程名</td>
						<td>教师</td>
						<td>学院</td>
						<td>学期</td>
						<td>课程号</td>
						<td>课序号</td>
						<td>合班</td>
					<tr>
						<td>${course.name }</td>
						<td>${course.teacher.name	 }</td>
						<td>${course.department }</td>
						<td>${course.season }</td>
						<td>${course.cid }</td>
						<td>${course.cno }</td>
						<td>${course.combine }</td>

						<!-- 
						<td>${batches.name }</td>
						<td><fm:formatDate value="${batches.beginDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><fm:formatDate value="${batches.endDate }"
								pattern="yyyy-MM-dd" /></td>
							 -->
					</tr>
				</table>
				<div role="tabpanel">

					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#student"
							aria-controls="student" role="tab" data-toggle="tab">学生评教信息</a></li>
						<li role="presentation"><a href="#teacher"
							aria-controls="profile" role="tab" data-toggle="tab">教师评教信息</a></li>
						<li role="presentation"><a href="#leader"
							aria-controls="messages" role="tab" data-toggle="tab">领导评教信息</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<!-- 学生评教信息表 -->
						<div role="tabpanel" class="tab-pane active" style="padding-top: 10px;" id="student">
							<jsp:include page="showCourseStu.jsp"/>

						</div>

						<!-- 教师评教信息表 -->
						<div role="tabpanel" class="tab-pane" id="teacher">
							<%@ include file="showCourseTea.jsp"%>
						</div>
						
						<!-- 教师评教信息表 -->
						<div role="tabpanel" class="tab-pane" id="leader">
							<%@ include file="showCourseLea.jsp"%>
						</div>
					</div>

				</div>

			</div>
		</div>

	</div>
	<!-- 	container -->
	<%@ include file="../buttom.jsp"%>
    <script
            src="${pageContext.request.contextPath}/js/datatables/js/jquery.dataTables.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/js/datatables/dataTables.bootstrap.js"></script>
</body>
</html>

