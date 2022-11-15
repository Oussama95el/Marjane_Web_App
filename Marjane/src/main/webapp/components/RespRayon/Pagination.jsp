<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 14/11/2022
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>pagination</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<h1>


</h1>
<nav aria-label="Page navigation example">
    <ul class="inline-flex items-center -space-x-px">
        <li>
            <a href="/resp-ray/all-promotions/<c:out value="${currentPage-1}"/>" class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                <span class="sr-only">Previous</span>
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
            </a>
        </li>
    <c:if test="${totalOfPages > 1}">
        <c:forEach var="i" begin="1" end="${totalOfPages}">
            <li>
                <a href="/resp-ray/all-promotions/<c:out value="${i}"/>" class="flex items-center h-10 px-5 align-middle <c:if test="${currentPage != i}"><c:out value="text-indigo-600" /> </c:if> transition-colors duration-150 bg-white focus:shadow-outline hover:bg-indigo-100 <c:if test="${currentPage == i}"><c:out value="text-white bg-blue-800 hover:bg-blue-800" /> </c:if>" >
                    <c:out value="${ i }" />
                </a>
            </li>
        </c:forEach>
    </c:if>
        <li>
            <a href="/resp-ray/all-promotions/<c:out value="${currentPage+1}"/>" class="block py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                <span class="sr-only">Next</span>
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
            </a>
        </li>
    </ul>
</nav>


</body>
</html>
