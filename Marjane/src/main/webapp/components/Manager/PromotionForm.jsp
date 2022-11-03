<%@ page import="com.simplon.marjane.entity.CategoryEntity" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 02/11/2022
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  List<CategoryEntity> categories = (List<CategoryEntity>) request.getAttribute("categories");%>

<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="w-full py-4 px-8 rounded bg-white">
    <form method="post" action="/PromoServlet">
        <h2 class="text-grey font-bold text-lg mb-3">Promotion Form</h2>
        <input type="hidden" autocomplete="false"/>
        <div class="relative z-0 mb-6 w-full group">
            <input autocomplete="off" type="number" name="rate" id="rate"
                   class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                   placeholder=" " required="">
            <label for="rate"
                   class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Rate <B>*</B></label>
        </div>

        <%--        select inputs category and sub-category--%>
        <div class="grid md:grid-cols-2 md:gap-6">
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
        <%--        dates input --%>
        <div class="grid md:grid-cols-2 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
                <input autocomplete="off" type="date" name="startDate" id="floating_startDate"
                       class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                       placeholder=" " required="">
                <label for="floating_startDate"
                       class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Start
                    Date</label>
            </div>
            <div class="relative z-0 mb-6 w-full group">
                <input autocomplete="off" type="date" name="expireDate" id="floating_expireDate"
                       class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                       placeholder=" " required="">
                <label for="floating_expireDate"
                       class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Expiration
                    Date</label>
            </div>
        </div>
        <button type="submit"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
            Submit
        </button>
    </form>
</div>
<script>
    const inputs = document.querySelectorAll('.peer');
    inputs.forEach(input => {
        input.addEventListener('focus', () => {
            input.parentElement.classList.add('peer-focus');
        });
        input.addEventListener('blur', () => {
            input.parentElement.classList.remove('peer-focus');
        });
    });

    // if category is MultiMedia then set rate max attribute to 20
    const category = document.getElementById('category');
    const rate = document.getElementById('rate');
    category.addEventListener('change', () => {
        if (category.value === '2') {
            rate.setAttribute('max', '20');
        } else {
            rate.setAttribute('max', '50');
        }
    });
</script>
</body>
</html>
