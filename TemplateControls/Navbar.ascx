<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Navbar.ascx.cs" Inherits="WebUserControl" %>

<div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container" style="width: 1000px">
                <a class="brand" href="Default.aspx">Warehouse Management</a>
                <ul class="nav pull-right" id="main-menu-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="glyphicon glyphicon-user"></span>
                            Hello User
                            <b class="caret"></b>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">Edit Profile</a>
                                </li>
                                <li>
                                    <a href="#">Logout</a>
                                </li>
                            </ul>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>