<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 10/11/2022
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--                <a href="/CategoryServlet" class="bg-blue-600 px-3 py-4 text-white font-extrabold rouded text-sm">--%>
<%--                    Add Promotion--%>
<%--                </a>--%>
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
                <th
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-center"
                >
                    Action
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${promotions}" var="promotion">
                <tr>
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
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                        <div class="flex gap-[2rem] justify-center">
                            <a href="/resp-ray/update-promotion?action=confirm&id=<c:out value="${promotion.getId()}"/>"
                               class="w-[20px] h-[20px] font-extrabold rouded text-sm confirm"
                               type="button" data-modal-toggle="popup-modal"
                            >
                                <svg class="w-[12px] h-[12px] hover:w-[15px] hover:h-[15px] hover:fill-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <path d="M470.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L192 338.7 425.4 105.4c12.5-12.5 32.8-12.5 45.3 0z">
                                    </path>
                                </svg>
                            </a>
                            <a href="/resp-ray/update-promotion?action=reject&id=<c:out value="${promotion.getId()}"/>"
                               class="w-[20px] h-[20px] font-extrabold rouded text-sm reject">
                                <svg class="w-[12px] h-[12px] hover:w-[15px] hover:h-[15px] hover:fill-red-600" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M310.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L160 210.7 54.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L114.7 256 9.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L160 301.3 265.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L205.3 256 310.6 150.6z"></path>
                                </svg>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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

    // foreach status check if PENDING then show confirm and reject buttons
    const confirm = document.querySelectorAll('.confirm');
    const reject = document.querySelectorAll('.reject');
    status.forEach((status, index) => {
        if (status.innerText === 'PENDING') {
            confirm[index].style.display = 'block';
            reject[index].style.display = 'block';
        } else {
            confirm[index].style.display = 'none';
            reject[index].style.display = 'none';
        }
    });


</script>
</body>
</html>
