<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 03/11/2022
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Promotions table</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div
        class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded"
>
    <div class="rounded-t mb-0 px-4 py-3 border-0 bg-white">
        <div class="flex flex-wrap items-center">
            <div class="relative w-full px-4 max-w-full flex-grow flex-1">
                <h3 class="font-semibold text-sm text-blue">Promotions Table</h3>
            </div>
<%--            <div--%>
<%--                    class="relative w-full pt-1 px-4 max-w-full flex-grow flex-1 flex gap-[1rem] justify-end"--%>
<%--            >--%>
<%--              <a href="/CategoryServlet" class="bg-blue-600 px-3 py-4 text-white font-extrabold rouded text-sm">--%>
<%--                Add Promotion--%>
<%--              </a>--%>
<%--            </div>--%>
        </div>
    </div>
    <div class="block w-full overflow-x-auto bg-white">
        <!-- Projects table -->
        <table class="items-center w-full bg-transparent border-collapse">
            <thead>
            <tr>
                <th
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                >
                    Ref
                </th>
                <th
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                >
                    Rate %
                </th>
                <th
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                >
                    Fidelity Points
                </th>
                <th
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                >
                    Category
                </th>

                <th
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                >
                    Start Date
                </th>
                <th
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                >
                    Expiration Date
                </th>
                <th
                        class="px-6 text-center align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
                >
                    Status
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${promotions}" var="promotion">
                <tr>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                       <c:out value="${promotion.getId()}"/>
                    </td>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                        <c:out value="${promotion.getPRate()}"/>
                    </td>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                        <c:out value="${promotion.getPPointFidelite()}"/>
                    </td>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                        <c:out value="${promotion.getPCategory().cName}"/>
                    </td>

                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                        <c:out value="${promotion.getPStartDate()}"/>
                    </td>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                        <c:out value="${promotion.getPExpireDate()}"/>
                    </td>
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4" >
                        <p class="status text-center rounded">
                           <c:out value="${promotion.getPStatus()}"/>
                        </p>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="w-full flex items-center justify-center mb-3">
            <jsp:include page="/components/Manager/Pagination.jsp" flush="true"/>
        </div>
    </div>
</div>

<script>
    // change status bg color based on status
    const status = document.querySelectorAll('.status');
    status.forEach((status) => {
        if (status.innerText === 'PENDING') {
            status.style.backgroundColor = '#FBBF24';
            status.style.color = '#fff';
        } else if (status.innerText === 'ACCEPTED') {
            status.style.backgroundColor = '#88e54d';
            status.style.color = '#fff';
        }else if (status.innerText === 'REJECTED') {
            status.style.backgroundColor = '#f31629';
            status.style.color = '#fff';
        }else if (status.innerText === 'EXPIRED') {
            status.style.backgroundColor = '#5b5b5a';
            status.style.color = '#fff';
        }
    });


</script>

</body>
</html>
