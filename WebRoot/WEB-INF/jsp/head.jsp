<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--导航条 -->
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">

	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath}/admin/admin"><span
						class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台管理</a></li>
			</ul>
			<form class="navbar-form navbar-left" role="search"></form>
			<ul class="nav navbar-nav navbar-right">
				<li class="active">
					<p class="navbar-text">
						您好，${sessionScope.teacher.name}
						${sessionScope.student.name}${sessionScope.admin.name}
						${sessionScope.leader.name}
					</p>
				</li>

				<li><a
					href="${pageContext.request.contextPath}/admin/resetPwdUI">修改密码</a></li>
				<li class="active"><a
					href="${pageContext.request.contextPath}/logout"><span
						class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;退出登陆</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<!--导航条 -->
<div  id="global-notification">
    <div class="alert alert-warning alert-dismissible" role="alert"  >
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <span id="global-notification-text"></span>
    </div>
</div>

