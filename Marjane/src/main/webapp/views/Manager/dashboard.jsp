<%@ page import="java.util.List" %>
<%@ page import="com.simplon.marjane.entity.PromotionEntity" %>
<%@ page import="java.util.Comparator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 01/11/2022
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List< PromotionEntity > promotions = (List< PromotionEntity >) request.getAttribute("promotions");%>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="h-screen w-full flex overflow-hidden select-none">
    <jsp:include page="../../components/Manager/SideNav.jsp" flush="true"/>
    <main class="my-1 pt-2 pb-2 px-10 flex-1 bg-gray-200 dark:bg-black rounded-l-lg
		transition duration-500 ease-in-out overflow-y-auto">

        <!-- component -->
        <!-- This is an example component -->
        <div>
                    <main>
                        <div class="pt-6 px-4">
                            <div class="w-full grid grid-cols-1 xl:grid-cols-1 2xl:grid-cols-1">
                                <div class="bg-white shadow w-full rounded-lg p-4 sm:p-6 xl:p-8 ">
                                    <div class="mb-4 flex items-center justify-between">
                                        <div>
                                            <h3 class="text-xl font-bold text-gray-900 mb-2">Latest Promotions</h3>
                                            <span class="text-base font-normal text-gray-500">This is a list of latest Promotions</span>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <a href="#" class="text-sm font-medium text-cyan-600 hover:bg-gray-100 rounded-lg p-2">View all</a>
                                        </div>
                                    </div>
                                    <div class="flex flex-col mt-8">
                                        <div class="overflow-x-auto rounded-lg">
                                            <div class="align-middle inline-block min-w-full">
                                                <div class="shadow  overflow-hidden sm:rounded-lg">
                                                    <table class="min-w-full divide-y divide-gray-200">
                                                        <thead class="bg-gray-50">
                                                        <tr>
                                                            <th scope="col" class="p-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                                Category
                                                            </th>
                                                            <th scope="col" class="p-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                                Rate
                                                            </th>
                                                            <th scope="col" class="p-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                                Fidelity Points
                                                            </th>
                                                            <th scope="col" class="p-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                                Start Date
                                                            </th>
                                                            <th scope="col" class="p-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                                Expiration Date
                                                            </th>
                                                            <th scope="col" class="p-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                                Status
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody class="bg-white">
                                                        <c:forEach items="${promotions}" var="promotion">
                                                        <tr>
                                                            <td class="p-4 whitespace-nowrap text-sm font-normal text-gray-900">
                                                            <c:out value="${promotion.getPCategory().cName}"/>
                                                            </td>
                                                            <td class="p-4 whitespace-nowrap text-sm font-normal text-gray-500">
                                                                <c:out value="${promotion.getPRate()}"/>
                                                            </td>
                                                            <td class="p-4 whitespace-nowrap text-sm font-semibold text-gray-900">
                                                                <c:out value="${promotion.getPPointFidelite()}"/>
                                                            </td>
                                                            <td class="p-4 whitespace-nowrap text-sm font-semibold text-gray-900">
                                                                <c:out value="${promotion.getPStartDate()}"/>
                                                            </td>
                                                            <td class="p-4 whitespace-nowrap text-sm font-semibold text-gray-900">
                                                                <c:out value="${promotion.getPExpireDate()}"/>
                                                            </td>
                                                            <td class="p-4 whitespace-nowrap text-sm font-semibold text-gray-900">
                                                                <span class="font-semibold status mr-3"><c:out value="${promotion.getPStatus()}"/></span>
                                                            </td>
                                                        </tr>
                                                        </c:forEach>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4 w-full grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
                                <div class="bg-white shadow rounded-lg p-4 sm:p-6 xl:p-8 ">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0">
                                            <span class="text-2xl sm:text-3xl leading-none font-bold text-gray-900">2,340</span>
                                            <h3 class="text-base font-normal text-gray-500">New products this week</h3>
                                        </div>
                                        <div class="ml-5 w-0 flex items-center justify-end flex-1 text-green-500 text-base font-bold">
                                            14.6%
                                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M5.293 7.707a1 1 0 010-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 01-1.414 1.414L11 5.414V17a1 1 0 11-2 0V5.414L6.707 7.707a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-white shadow rounded-lg p-4 sm:p-6 xl:p-8 ">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0">
                                            <span class="text-2xl sm:text-3xl leading-none font-bold text-gray-900">5,355</span>
                                            <h3 class="text-base font-normal text-gray-500">Promotion this week</h3>
                                        </div>
                                        <div class="ml-5 w-0 flex items-center justify-end flex-1 text-green-500 text-base font-bold">
                                            32.9%
                                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M5.293 7.707a1 1 0 010-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 01-1.414 1.414L11 5.414V17a1 1 0 11-2 0V5.414L6.707 7.707a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-white shadow rounded-lg p-4 sm:p-6 xl:p-8 ">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0">
                                            <span class="text-2xl sm:text-3xl leading-none font-bold text-gray-900">3</span>
                                            <h3 class="text-base font-normal text-gray-500">total Responsable Rayon</h3>
                                        </div>
                                        <div class="ml-5 w-0 flex items-center justify-end flex-1 text-red-500 text-base font-bold">
                                            -2.7%
                                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14.707 12.293a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 111.414-1.414L9 14.586V3a1 1 0 012 0v11.586l2.293-2.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
            <script async defer src="https://buttons.github.io/buttons.js"></script>
            <script src="https://demo.themesberg.com/windster/app.bundle.js"></script>
        </div>
    </main>
</div>
<script>
    // change status bg color based on status
    const status = document.querySelectorAll('.status');
    status.forEach((status) => {
        if (status.innerText === 'PENDING') {
            status.style.backgroundColor = '#FBBF24';
            status.style.color = '#fff';
            status.style.padding = '4px 8px';
        } else if (status.innerText === 'ACCEPTED') {
            status.style.backgroundColor = '#88e54d';
            status.style.color = '#fff';
            status.style.padding = '4px 8px';
        }else if (status.innerText === 'REJECTED') {
            status.style.backgroundColor = '#f31629';
            status.style.color = '#fff';
            status.style.padding = '4px 8px';
        }else if (status.innerText === 'EXPIRED') {
            status.style.backgroundColor = '#5b5b5a';
            status.style.color = '#fff';
            status.style.padding = '4px 8px';
        }
    });


</script>
</body>
</html>
