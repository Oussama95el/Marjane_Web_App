<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 03/11/2022
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Resp-Rayon</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<div class="h-screen w-full flex overflow-hidden select-none">
    <jsp:include page="../../components/Manager/SideNav.jsp" flush="true"/>
    <main class="my-1 pt-2 pb-2 px-10 flex-1 bg-gray-200 dark:bg-black rounded-l-lg
            transition duration-500 ease-in-out overflow-y-auto">
        <nav class="flex items-center justify-evenly bg-white text-center">
            <div class="w-full">
                <a href="../../views/Manager/respRayon.jsp" class="px-5 py-2.5 w-full relative group overflow-hidden font-medium bg-white text-blue inline-block">
                    <span class="absolute top-0 left-0 flex w-full h-0 mb-0 transition-all duration-200 ease-out transform translate-y-0 bg-blue-600 group-hover:h-full opacity-90"></span>
                    <span class="relative group-hover:text-blue">Responsable Rayon List</span>
                </a>
            </div>
            <div class="w-full">
                <a href="#" class="px-5 py-2.5 w-full relative group overflow-hidden font-medium bg-blue-600 text-blue-800 inline-block" id="createPromo">
                    <span class="absolute top-0 left-0 flex w-full h-0 mb-0 transition-all duration-200 ease-out transform translate-y-0 bg-blue-600 group-hover:h-full opacity-90"></span>
                    <span class="relative group-hover:text-blue">Create Responsable Rayon</span>
                </a>
            </div>
        </nav>

        <div class="w-full py-4 px-8 rounded bg-white">
            <form method="post" action="/RespRayon/create">
                <h2 class="text-grey font-bold text-lg mb-3">Promotion Form</h2>
                <input type="hidden" autocomplete="false"/>
                <div class="relative z-0 mb-6 w-full group">
                    <input autocomplete="off" type="text" name="name" id="full_name"
                           class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                           placeholder=" " required="">
                    <label for="full_name"
                           class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Full
                        name <B>*</B></label>
                </div>
                <div class="relative z-0 mb-6 w-full group">
                    <input autocomplete="off" type="email" name="email" id="email"
                           class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                           placeholder=" " required="">
                    <label for="email"
                           class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email
                        address <B>*</B></label>
                </div>
                <div class="relative z-0 mb-6 w-full group">
                    <input autocomplete="off" type="password" name="password" id="password"
                           class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                           placeholder=" " required="">
                    <label for="password"
                           class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password
                        <B>*</B></label>
                </div>
                <div class="relative z-0 mb-6 w-full group">
                    <%--                category Select and loop through attribute categories using <c:foreach> --%>
                    <select name="category" id="category"
                            class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer">
                        <option disabled selected>Select Category</option>
                        <c:forEach items="${categories}" var="category">
                            <option class="text-sm text-gray-500 font-medium" value="${category.getcId()}"><c:out
                                    value="${category.getcName()}"/></option>
                        </c:forEach>
                    </select>
                    <label for="category"
                           class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Category
                        <B>*</B></label>
                </div>
                <button type="submit"
                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    Submit
                </button>
            </form>
        </div>
    </main>
</div>

</body>
</html>





