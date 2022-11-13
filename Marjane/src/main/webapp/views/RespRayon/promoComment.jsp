<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 13/11/2022
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="h-screen w-full flex overflow-hidden select-none">
  <jsp:include page="../../components/RespRayon/SideNav.jsp" flush="true"/>
  <main class="my-1 pt-2 pb-2 px-10 flex-1 bg-gray-200 dark:bg-black rounded-l-lg
            transition duration-500 ease-in-out overflow-y-auto">

    <div class="flex items- center justify-evenly bg-white text-center">
        <div class="block flex flex-col gap-5">
        <h1 class="text-3xl font-bold text-gray-900 dark:text-white">Promotion Comment</h1>
        <p class="text-gray-600 text-base dark:text-gray-400">Please explain why you are rejecting this promotion</p>
<%--            error message to display if massage != "" --%>
        <c:if test="${!empty message}">
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                <strong class="font-bold">Error!</strong>
                <span class="block sm:inline">${message}</span>
            </div>
        </c:if>

        </div>
        <div class="border-sm w-1/2 rounded px-4 py-6">
          <h1 class="text-xl font-bold text-blue-900 dark:text-white mb-3">
              <c:out value="${promotion.getPCategory().cName}"/>
          </h1>
          <div class="flex items-center justify-between mb-3">
                <div class="text-base font-medium text-gray-800">Promotion Rate</div>
                <div class="text-base font-bold text-blue-900 dark:text-white">
                    <c:out value="${promotion.getPRate()}"/> %
                </div>
          </div>
            <div class="flex items-center justify-between mb-3">
                    <div class="text-base font-medium text-gray-800">Promotion Fidelite Points</div>
                    <div class="text-base font-bold text-blue-900 dark:text-white">
                        <c:out value="${promotion.getPPointFidelite()}"/>
                    </div>
            </div>
            <div class="flex items-center justify-between mb-3">
                    <div class="text-base font-medium text-gray-800">Promotion Start Date</div>
                    <div class="text-base font-bold text-blue-900 dark:text-white">
                        <c:out value="${promotion.getPStartDate()}"/>
                    </div>
            </div>
            <div class="flex items-center justify-between mb-3">
                    <div class="text-base font-medium text-gray-800">Promotion End Date</div>
                    <div class="text-base font-bold text-blue-900 dark:text-white ">
                        <c:out value="${promotion.getPExpireDate()}"/>
                    </div>
            </div>
            <div class="flex items-center justify-between mb-3">
                    <div class="text-base font-medium text-gray-800">Promotion Status</div>
                    <div class="text-base font-bold text-red-500 dark:text-white">
                        <c:out value="${promotion.getPStatus()}"/>
                    </div>
            </div>
        <form method="post" action="/resp-ray/update-promotion">
            <div class="relative">
                <input type="hidden" name="id" value="${promotion.getId()}">
                <label for="comment" class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">
                </label>
                <textarea name="comment" id="comment" cols="30" rows="10" placeholder="Your comment goes here"
                            class="peer h-24 w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 bg-white text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-800 dark:text-gray-100 dark:placeholder-gray-500 dark:focus:ring-blue-500 dark:focus:border-blue-500"></textarea>
                <button type="submit" class="absolute right-0 bottom-0 mb-4 mr-6">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-blue-600 dark:text-blue-500" fill="none"
                         viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path>
                    </svg>
                </button>
            </div>
        </form>
      </div>
    </div>

  </main>
</div>
</body>
</html>
