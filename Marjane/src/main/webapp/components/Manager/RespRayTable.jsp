<%@ page import="com.simplon.marjane.entity.RespRayonEntity" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 04/11/2022
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  List<RespRayonEntity> respRayons = (List<RespRayonEntity>) request.getAttribute("respRayons");%>

<html>
<head>
    <title>Title</title>
  <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<div
        class="relative flex flex-col min-w-0 break-words w-full mb-6 shadow-lg rounded"
>
  <div class="rounded-t mb-0 px-4 py-3 border-0 bg-white">
    <div class="flex flex-wrap items-center">
      <div class="relative w-full px-4 max-w-full flex-grow flex-1">
        <h3 class="font-semibold text-sm text-blue">Responsable Rayon Table</h3>
      </div>
      <div
              class="relative w-full pt-1 px-4 max-w-full flex-grow flex-1 flex gap-[1rem] justify-end"
      >
        <a href="/RespRayon/create" class="bg-blue-600 px-3 py-4 text-white font-extrabold rouded text-sm">
          Create Responsable Rayon
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
          Full Name
        </th>
        <th
                class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
        >
          Email
        </th>
        <th
                class="px-6 align-middle border border-solid py-3 text-xs uppercase border-l-0 border-r-0 whitespace-nowrap font-semibold text-left"
        >
          Category
        </th>

      </tr>
      </thead>
      <tbody>
      <c:forEach items="${respRayons}" var="respRay">
        <tr>
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            <c:out value="${respRay.getRrName()}"/>
          </td>
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            <c:out value="${respRay.getRrEmail()}"/>
          </td>
          <td class="border-t-0 px-6 align-middle border-l-0 border-r-0 text-xs whitespace-nowrap p-4">
            <c:out value="${respRay.getRrRayon().getcName()}"/>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>
