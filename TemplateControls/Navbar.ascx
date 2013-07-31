<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Navbar.ascx.cs" Inherits="WebUserControl" %>

<div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container" style="width: 960px">
                <a class="brand" href="Default.aspx"><span class="glyphicon glyphicon-plus-sign"></span> Medical Electronic Record Management</a>
                <ul class="nav pull-right" id="main-menu-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="glyphicon glyphicon-user"></span>
                            Hello <%= System.Threading.Thread.CurrentPrincipal.Identity.Name %>
                            <b class="caret"></b>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">Edit Profile</a>
                                </li>
                                <li>
                                    <a href="/Logout.aspx">Logout</a>
                                </li>
                            </ul>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>