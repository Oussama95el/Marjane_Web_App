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
            <div
                    class="relative w-full pt-1 px-4 max-w-full flex-grow flex-1 flex gap-[1rem] justify-end"
            >
              <a href="/CategoryServlet" class="bg-blue-600 px-3 py-4 text-white font-extrabold rouded text-sm">
                Add Promotion
              </a>
            </div>
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
                        class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
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
                    <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
                        <c:out value="${promotion.getPStatus()}"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
<%--            <tbody>--%>
<%--            <tr>--%>
<%--                <td--%>
<%--                        class="border-t-0 px-3 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"--%>
<%--                >--%>
<%--                    xxxxxxxxx--%>
<%--                </td>--%>
<%--                <th--%>
<%--                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-left flex items-center"--%>
<%--                >--%>
<%--                    <div class="flex items-center">--%>
<%--                        <span class="mr-2">xxx</span>--%>
<%--                        <span class="mr-2">%</span>--%>
<%--                    </div>--%>
<%--                </th>--%>
<%--                <td--%>
<%--                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"--%>
<%--                >--%>
<%--                    <div class="flex items-center">--%>
<%--                        <span class="mr-2">xxxx</span>--%>
<%--                        <span class="mr-2">MAD</span>--%>
<%--                    </div>--%>
<%--                </td>--%>
<%--                <td--%>
<%--                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"--%>
<%--                >--%>
<%--                    xxxxxxxxxx--%>
<%--                </td>--%>
<%--                <td--%>
<%--                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"--%>
<%--                >--%>
<%--                    xxxxxxxxxx--%>
<%--                </td>--%>
<%--                <td--%>
<%--                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"--%>
<%--                >--%>
<%--                    xxxxxxxxxx--%>
<%--                </td>--%>
<%--                <td--%>
<%--                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4"--%>
<%--                >--%>
<%--                    xxxxxxxxxx--%>
<%--                </td>--%>
<%--                <td--%>
<%--                        class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4 text-right"--%>
<%--                >--%>
<%--                    <div class="flex items-center">--%>
<%--                        <a href="#" class="mt-4">--%>
<%--                  <span class="mr-2" role="button">--%>
<%--                    <svg--%>
<%--                            xmlns="http://www.w3.org/2000/svg"--%>
<%--                            viewBox="0 0 512 512"--%>
<%--                            class="w-5 h-5 mr-3 cursor-pointer hover:fill-primary"--%>
<%--                    >--%>
<%--                      <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->--%>
<%--                      <path--%>
<%--                              d="M490.3 40.4C512.2 62.27 512.2 97.73 490.3 119.6L460.3 149.7L362.3 51.72L392.4 21.66C414.3-.2135 449.7-.2135 471.6 21.66L490.3 40.4zM172.4 241.7L339.7 74.34L437.7 172.3L270.3 339.6C264.2 345.8 256.7 350.4 248.4 353.2L159.6 382.8C150.1 385.6 141.5 383.4 135 376.1C128.6 370.5 126.4 361 129.2 352.4L158.8 263.6C161.6 255.3 166.2 247.8 172.4 241.7V241.7zM192 63.1C209.7 63.1 224 78.33 224 95.1C224 113.7 209.7 127.1 192 127.1H96C78.33 127.1 64 142.3 64 159.1V416C64 433.7 78.33 448 96 448H352C369.7 448 384 433.7 384 416V319.1C384 302.3 398.3 287.1 416 287.1C433.7 287.1 448 302.3 448 319.1V416C448 469 405 512 352 512H96C42.98 512 0 469 0 416V159.1C0 106.1 42.98 63.1 96 63.1H192z"></path>--%>
<%--                    </svg>--%>
<%--                  </span>--%>
<%--                        </a>--%>
<%--                        <span--%>
<%--                                class="mr-2"--%>
<%--                                role="button"--%>
<%--                        >--%>
<%--                  <svg--%>
<%--                          xmlns="http://www.w3.org/2000/svg"--%>
<%--                          viewBox="0 0 448 512"--%>
<%--                          class="w-5 h-5 cursor-pointer hover:fill-primary"--%>
<%--                  >--%>
<%--                    <!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->--%>
<%--                    <path--%>
<%--                            d="M135.2 17.69C140.6 6.848 151.7 0 163.8 0H284.2C296.3 0 307.4 6.848 312.8 17.69L320 32H416C433.7 32 448 46.33 448 64C448 81.67 433.7 96 416 96H32C14.33 96 0 81.67 0 64C0 46.33 14.33 32 32 32H128L135.2 17.69zM31.1 128H416V448C416 483.3 387.3 512 352 512H95.1C60.65 512 31.1 483.3 31.1 448V128zM111.1 208V432C111.1 440.8 119.2 448 127.1 448C136.8 448 143.1 440.8 143.1 432V208C143.1 199.2 136.8 192 127.1 192C119.2 192 111.1 199.2 111.1 208zM207.1 208V432C207.1 440.8 215.2 448 223.1 448C232.8 448 240 440.8 240 432V208C240 199.2 232.8 192 223.1 192C215.2 192 207.1 199.2 207.1 208zM304 208V432C304 440.8 311.2 448 320 448C328.8 448 336 440.8 336 432V208C336 199.2 328.8 192 320 192C311.2 192 304 199.2 304 208z"></path>--%>
<%--                  </svg>--%>
<%--                </span>--%>
<%--                    </div>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
        </table>
    </div>
</div>
</body>
</html>