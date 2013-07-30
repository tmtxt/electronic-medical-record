<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SideBar.ascx.cs" Inherits="Template_SideBar" %>


<div class="well" style="padding: 8px 0;">
    <ul class="nav nav-list" id="sidebar-nav">
        <li class="nav-header">Warehouse Management</li>
        <li><a href="#">View warehouses</a></li>
        <li><a href="/UserAccess/Default.aspx">Edit ware house</a></li>
        <li class="nav-header">Another list header</li>
        <li><a href="#">Profile</a></li>
        <li><a href="#">Settings</a></li>

        <%-- this section is for admin only --%>
        <%
        if(System.Threading.Thread.CurrentPrincipal.IsInRole("admin"))
        {
        %>  
        <li class="nav-header">Users Management</li>
        <li><a href="/AdminAccess/ViewAllUsers.aspx">View all users</a></li>
        <li><a href="#">Add new user</a></li>
        <%
        }
        %>
        <%-- this section is for admin only --%>
    </ul>
</div>

<%-- code for highlighting the current link in sidebar --%>
<script type="text/javascript">
    // highlight current item in nav bar

    // get the list of li tags
    var sidebar_nav = document.getElementById("sidebar-nav");
    var li_list = sidebar_nav.getElementsByTagName("li");

    // lopp through all li tags
    for (var i = 0; i < li_list.length; i++) {
        // check if it contains a child node
        if (li_list[i].getElementsByTagName("a").length > 0) {
            if (li_list[i].getElementsByTagName("a")[0].getAttribute("href") == window.location.pathname) {
                li_list[i].setAttribute("class", "active");
            }
        }
    }
</script>
