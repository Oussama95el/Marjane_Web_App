<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Marjane Back-office</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div>
<div class="flex flex-row justify-between items-center p-4">
        <div class="flex flex-row">
            <img src="assets/images/logoMarjane.png" alt="logo image" class="h-12 w-15">
        </div>
         <div class="">
            <ul class="flex flex-row">
                <li class="mr-6">
                    <a href="/" class="text-blue-500 hover:text-blue-800">Login</a>
                </li>
            </ul>
         </div>
</div>

    <div class="flex flex-col bg-gradient-to-r from-cyan-500 to-blue-500 items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
        <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
            <div class="text-center p-3">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                    Sign in to your account
                </h1>
            </div>
            <div class="flex items-center justify-center p-6">
                <button id="SA" value="SA" class="w-1/2 hover:text-emerald-50 rounded-lg bg-white p-2 text-center hover:bg-blue-600">Super Admin</button>
                <button id="M" value="M" class="w-1/2 hover:text-emerald-50 rounded-lg bg-white p-2 text-center hover:bg-blue-600">Manager</button>
                <button id="RR" value="RR" class="w-1/2 hover:text-emerald-50 rounded-lg bg-white p-2 text-center hover:bg-blue-600">Resp Rayon</button>
            </div>

            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <form method="post" class="space-y-4 md:space-y-6" action="/auth">
                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                        <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="name@company.com" required="">
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                        <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">
                    </div>
                    <div>
                        <input type="hidden" name="member" id="typeLogin">
                    </div>
                    <div class="flex items-center justify-between">
                        <div class="flex items-start">
                            <div class="flex items-center h-5">
                                <input id="remember" aria-describedby="remember" type="checkbox" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800">
                            </div>
                            <div class="ml-3 text-sm">
                                <label for="remember" class="text-gray-500 dark:text-gray-300">Remember me</label>
                            </div>
                        </div>
                        <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Forgot password?</a>
                    </div>
                    <button type="submit" class="w-full text-white bg-blue-600 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Sign in</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    const SA = document.getElementById("SA");
    const M = document.getElementById("M");
    const RR = document.getElementById("RR");
    const member = document.getElementById("typeLogin");
    const arr = [SA, M, RR];

    arr.forEach(function (item) {
        item.addEventListener("click", function () {
            item.style.backgroundColor = "#2590EB";
            item.style.color = "white";
            member.value = item.value;
            console.log(member.value);
            // reset the other buttons
            arr.forEach(function (item2) {
                if (item2.value !== item.value) {
                    item2.style.backgroundColor = "white";
                    item2.style.color = "#2590EB";
                }
            });
        });

    });
    // if typeLogin is empty, alert the user and prevent the form from submitting
    document.querySelector("form").addEventListener("submit", function (e) {
        if (member.value === "") {
            alert("Please select a login type");
            e.preventDefault();
        }
    });
</script>
</body>
</html>