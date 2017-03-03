<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@page import="org.apache.shiro.SecurityUtils" %>
<%@page import="org.apache.shiro.subject.Subject" %>
<%@page import="org.apache.shiro.session.Session" %>
<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home">SB Admin v2.0</a>
            </div>
            <!-- /.navbar-header -->
			
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    	<shiro:user>
                			<shiro:principal/>  
						</shiro:user>
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <a href="passwordModif"><i class="fa fa-gear fa-fw"></i> 密码修改</a>
                        </li>
                        <li>
                            <a href="logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

			<!-- 左边菜单栏 -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="home">
                            	<i class="fa fa-dashboard fa-fw"></i> 仪表盘
                            </a>
                        </li>
                        <li>
                            <a href="#">
                            	<i class="fa fa-bar-chart-o fa-fw"></i> 分析图表
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="exerciseChart">用户分析</a>
                                </li>
                                <li>
                                    <a href="morris.html">题目分析</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-edit fa-fw"></i> 信息管理
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="category">&nbsp;&nbsp;类别管理</a>
                                </li>
                                <li>
                                    <a href="blankfill">&nbsp;&nbsp;题目管理</a>
                                </li>
                                <li>
                                    <a href="action">&nbsp;&nbsp;事件（用户动态）管理</a>
                                </li>
                                <li>
                                    <a href="users">&nbsp;&nbsp;用户管理</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">
                            	<i class="fa fa-table fa-fw"></i> 记录查看
                            	<span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="dynamic">&nbsp;&nbsp;用户动态查询</a>
                                </li>
                                <li>
                                    <a href="operation">&nbsp;&nbsp;管理员操作记录</a>
                                </li>

                            </ul>
                        </li>

                        <li>
                            <a href="#">
                                <i class="fa fa-wrench fa-fw"></i> 系统设置
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="passwordModif">&nbsp;&nbsp;密码修改</a>
                                </li>
                                <li>
                                    <a href="paramConfig">&nbsp;&nbsp;参数配置</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /左边菜单栏 -->
            <!-- /.navbar-static-side -->
        </nav>
