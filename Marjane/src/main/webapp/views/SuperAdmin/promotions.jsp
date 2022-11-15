<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 10/11/2022
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Responsable rayon promotions</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<div class="h-screen w-full flex overflow-hidden select-none">
    <jsp:include page="../../components/SuperAdmin/SideNav.jsp" flush="true"/>
    <main class="my-1 pt-2 pb-2 px-10 flex-1 bg-gray-200 dark:bg-black rounded-l-lg
            transition duration-500 ease-in-out overflow-y-auto">
        <nav class="flex items- center justify-evenly bg-white text-center">
            <div class="w-full">
                <a href="#" class="px-5 py-2.5 w-full relative group overflow-hidden font-medium bg-white text-blue-800 inline-block" id="createPromo">
                    <span class="absolute top-0 left-0 flex w-full h-0 mb-0 transition-all duration-200 ease-out transform translate-y-0 bg-blue-600 group-hover:h-full opacity-90"></span>
                    <span class="relative group-hover:text-blue">Promotion List</span>
                </a>
            </div>
        </nav>

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
                <jsp:include page="../../components/SuperAdmin/Pagination.jsp" flush="true"/>
            </div>
        </div>

    </main>
</div>

<script>
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
