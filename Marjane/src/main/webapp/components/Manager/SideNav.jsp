<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 02/11/2022
  Time: 09:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sidenav</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<nav class="w-24 flex flex-col justify-between items-center bg-white">
    <!-- Left side NavBar -->
    <div class="flex flex-col justify-between items-center">
        <div>
            <!-- App Logo -->

            <img src="/assets/images/Marjane01.png" class="h-12 w-12 fill-current text-blue-600 dark:text-blue-300" alt="logo01">

        </div>

    <ul class="mt-2 text-gray-700 dark:text-gray-400 capitalize">
        <!-- Links -->

        <li class="mt-3 p-2 hover:text-blue-600 dark-hover:text-blue-300 rounded-lg">
            <a href="../../views/Manager/dashboard.jsp" class=" flex flex-col items-center">
                <svg class="fill-current h-5 w-5" viewBox="0 0 24 24">
                    <path
                            d="M19 5v2h-4V5h4M9 5v6H5V5h4m10 8v6h-4v-6h4M9
							17v2H5v-2h4M21 3h-8v6h8V3M11 3H3v10h8V3m10
							8h-8v10h8V11m-10 4H3v6h8v-6z"></path>
                </svg>
                <span class="text-xs mt-2">dashBoard</span>
            </a>

        </li>

        <li
                class="mt-3 p-2 hover:text-blue-600 dark-hover:text-blue-300
				rounded-lg">
            <a href="/PromoServlet" class=" flex flex-col items-center" id="promotionManager">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="fill-current h-5 w-5">
                    <!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                    <path d="M374.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-320 320c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l320-320zM128 128c0-35.3-28.7-64-64-64S0 92.7 0 128s28.7 64 64 64s64-28.7 64-64zM384 384c0-35.3-28.7-64-64-64s-64 28.7-64 64s28.7 64 64 64s64-28.7 64-64z">
                    </path></svg>
                <span class="text-xs mt-2">promotions</span>
            </a>
        </li>

        <li
                class="mt-3 p-2 hover:text-blue-600 rounded-lg">
            <a href="/resp-rayon" class=" flex flex-col items-center" id="respRayManager">
                <svg class="fill-current h-5 w-5" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                        <path d="M192 0c-41.8 0-77.4 26.7-90.5 64H64C28.7 64 0 92.7 0 128V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7
                                 64-64V128c0-35.3-28.7-64-64-64H282.5C269.4 26.7 233.8 0 192 0zm0 128c-17.7 0-32-14.3-32-32s14.3-32 32-32s32
                                 14.3 32 32s-14.3 32-32 32zm64 128c0 35.3-28.7 64-64 64s-64-28.7-64-64s28.7-64 64-64s64 28.7 64 64zM80 432c0-44.2 35.8-80 80-80h64c44.2 0 80 35.8 80 80c0 8.8-7.2 16-16 16H96c-8.8 0-16-7.2-16-16z">
                        </path>
                    </svg>
                <span class="text-xs mt-2">Resp.Rayon</span>
            </a>
        </li>



    </ul>
    </div>
    <div
            class="flex justify-center items-center p-2 text-blue-700 hover:bg-purple-200 rounded-full">
        <!-- important action -->

        <a href="/" class="flex flex-col items-center">
            <svg class="fill-current h-5 w-5" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                <path d="M160 96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96C43 32 0 75 0 128V384c0 53 43 96 96
                    96h64c17.7 0 32-14.3 32-32s-14.3-32-32-32H96c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32h64zM504.5 273.4c4.8-4.5 7.5-10.8 7.5-17.4s-2.7-12.9-7.5-17.4l-144-136c-7-6.6-17.2-8.4-26-4.6s-14.5 12.5-14.5
                    22v72H192c-17.7 0-32 14.3-32 32l0 64c0 17.7 14.3 32 32 32H320v72c0 9.6 5.7 18.2 14.5 22s19 2 26-4.6l144-136z">
                </path>
            </svg>
            <span class="text-xs mt-2"> logout</span>
        </a>

    </div>

</nav>
<script>
    // active link in nav bar
    const currentLocation = location.href;
    const menuItem = document.querySelectorAll('a');
    const menuLength = menuItem.length;
    console.log(currentLocation);
    for (let i = 0; i < menuLength; i++) {
        if (menuItem[i].href === currentLocation) {
            menuItem[i].className = "flex flex-col items-center text-blue-600"
        }
    }


</script>
</body>
</html>
