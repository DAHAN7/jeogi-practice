<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>숙소 추가</title>
</head>
<body>
    <h1>숙소 추가</h1>
    <form action="write" method="post">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <label>Name:</label>
        <input type="text" name="name" required><br>
        <label>Address:</label>
        <input type="text" name="address" required><br>
        <label>Description:</label>
        <textarea name="description" required></textarea><br>
        <label>Type:</label>
        <input type="text" name="type" required><br>
        <label>Price:</label>
        <input type="number" name="price" required><br>
        <label>Main Image:</label>
        <input type="text" name="mainimages"><br>
        <label>Image 1:</label>
        <input type="text" name="images1" ><br>
        <label>Image 2:</label>
        <input type="text" name="images2"><br>
        <input type="submit" value="Add Accommodation">
    </form>
</body>
</html>
