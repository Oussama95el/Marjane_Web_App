<%--
  Created by IntelliJ IDEA.
  User: adm
  Date: 01/11/2022
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404 page</title>
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<!-- component -->
<main class="h-screen w-full flex flex-col justify-center items-center bg-white">
    <h1 class="text-9xl font-extrabold text-blue-600 tracking-widest">404</h1>
    <div class="bg-yellow-300 px-2 text-sm rounded rotate-12 absolute">
        Problem logging in
    </div>
    <button class="mt-5">
        <a
                class="relative inline-block text-sm font-medium text-[#FF6A3D] group active:text-orange-500 focus:outline-none focus:ring"
        >
            <a href="/" class="relative inline-flex items-center justify-center p-4 px-6 py-3 overflow-hidden font-medium text-indigo-600 transition duration-300 ease-out border-2 border-blue-400 rounded-full shadow-md group">
                <span class="absolute inset-0 flex items-center justify-center w-full h-full text-white duration-300 -translate-x-full bg-blue-600   group-hover:translate-x-0 ease">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                </span>
                <span class="absolute flex items-center justify-center w-full h-full text-blue-400 transition-all duration-300 transform group-hover:translate-x-full ease">Back To Page</span>
                <span class="relative invisible">Back To Page</span>
            </a>
        </a>
    </button>
</main>
</body>
</html>
