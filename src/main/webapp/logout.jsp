<%
    session.invalidate(); // Oturumu sonlandır
    response.sendRedirect("login.jsp"); // Giriş sayfasına yönlendir
%>
