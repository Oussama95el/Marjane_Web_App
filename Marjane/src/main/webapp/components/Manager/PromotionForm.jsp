<%@ page import="com.simplon.marjane.entity.CategoryEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.simplon.marjane.entity.SubCategoryEntity" %><%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 02/11/2022
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  List<CategoryEntity> categories = (List<CategoryEntity>) request.getAttribute("categories");
    List<SubCategoryEntity> subCategories = (List<SubCategoryEntity>) request.getAttribute("subCategories");
    // stream and filter subcategories by value of category
    long categoryId = 0;
    List<SubCategoryEntity> subCategoriesByCategory = subCategories.stream().filter(subCategory -> subCategory.getScCategory() == categoryId).collect(Collectors.toList());
%>

<html>
<head>
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="w-full py-4 px-8 rounded bg-white">
    <form method="post" action="">
        <h2 class="text-grey font-bold text-lg mb-3">Promotion Form</h2>
        <input type="hidden" autocomplete="false"/>
        <div class="relative z-0 mb-6 w-full group">
            <input autocomplete="off" type="email" name="floating_email" id="floating_email"
                   class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                   placeholder=" " required="">
            <label for="floating_email"
                   class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email
                address <B>*</B></label>
        </div>
        <div class="relative z-0 mb-6 w-full group">
            <input autocomplete="off" type="password" name="floating_password" id="floating_password"
                   class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                   placeholder=" " required="">
            <label for="floating_password"
                   class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password
                <B>*</B></label>
        </div>
        <div class="relative z-0 mb-6 w-full group">
            <input autocomplete="off" type="password" name="repeat_password" id="floating_full_name"
                   class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                   placeholder=" " required="">
            <label for="floating_full_name"
                   class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Full
                name <B>*</B></label>
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
            <div class="relative z-0 mb-6 w-full group">
                <select name="sub_category" id="sub_category"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer">
                    <option disabled selected>Select Sub-Category</option>
                    <option value="test">test</option>
                    <%--                    <c:forEach items="${categories}" var="categories">--%>
                    <%--                    <option class="text-sm text-gray-500 font-medium" value="${category.getId()}"><c:out value="${category.getTname()}"/></option>--%>
                    <%--                    </c:forEach>--%>
                </select>
                <label for="sub_category"
                       class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Sub-Category</label>
            </div>
        </div>
        <%--        dates input --%>
        <div class="grid md:grid-cols-2 md:gap-6">
            <div class="relative z-0 mb-6 w-full group">
                <input autocomplete="off" type="date" name="start_date" id="floating_start_date"
                       class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                       placeholder=" " required="">
                <label for="floating_start_date"
                       class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Start
                    Date</label>
            </div>
            <div class="relative z-0 mb-6 w-full group">
                <input autocomplete="off" type="date" name="expiration_date" id="floating_expiration_date"
                       class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                       placeholder=" " required="">
                <label for="floating_expiration_date"
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
    // on change of category select sub category options according to category selected by user using ajax call to servlet
    $(document).ready(function () {
        $('#category').change(function () {
            const category = $(this).val();
            $.ajax({
                url: '/getSubCategories',
                type: 'POST',
                data: {
                    category: category
                },
                success: function (response) {
                    const sub_category = $('#sub_category');
                    sub_category.empty();
                    sub_category.append('<option disabled selected>Select Sub-Category</option>');
                    console.log(response);
                    $.each(response, function (i, sub_category) {
                        sub_category.append('<option value="' + sub_category.id + '">' + sub_category.name + '</option>');
                    });
                }
            });
        });
    });
</script>
</body>
</html>