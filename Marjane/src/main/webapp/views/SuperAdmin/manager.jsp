<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 13/11/2022
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="h-screen w-full flex overflow-hidden select-none">
    <jsp:include page="../../components/SuperAdmin/SideNav.jsp" flush="true"/>
    <main class="my-1 pt-2 pb-2 px-10 flex-1 bg-gray-200 dark:bg-black rounded-l-lg
            transition duration-500 ease-in-out overflow-y-auto">
        <nav class="flex items-center justify-evenly bg-white text-center">
            <div class="w-full">
                <a href="#" class="px-5 py-2.5 w-full relative group overflow-hidden font-medium bg-blue-600 text-blue inline-block">
                    <span class="absolute top-0 left-0 flex w-full h-0 mb-0 transition-all duration-200 ease-out transform translate-y-0 bg-blue-600 group-hover:h-full opacity-90"></span>
                    <span class="relative group-hover:text-blue">Managers List</span>
                </a>
            </div>
            <div class="w-full">
                <a href="/super-admin/manager-creat" class="px-5 py-2.5 w-full relative group overflow-hidden font-medium bg-white text-blue-800 inline-block" id="createPromo">
                    <span class="absolute top-0 left-0 flex w-full h-0 mb-0 transition-all duration-200 ease-out transform translate-y-0 bg-blue-600 group-hover:h-full opacity-90"></span>
                    <span class="relative group-hover:text-blue">Create Manager</span>
                </a>
            </div>
        </nav>
        <jsp:include page="../../components/SuperAdmin/ManagerTable.jsp" flush="true"/>
    </main>
</div>
</body>
</html>
