<?php
    include_once 'connection.php';
?>

<?php
    $sql = mq("SELECT * FROM memberTBL");
    $arr = mysqli_fetch_array($sql);
?>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>멤버 리스트</title>
</head>
<body>
    <table>
        <tr>
            <th>memberID</th>
            <th>memberName</th>
            <th>memberAddress</th>
        </tr>
        <tr>
            <td><?=$arr[0] ?></td>
            <td><?=$arr[1] ?></td>
            <td><?=$arr[2] ?></td>
        </tr>
    </table>
</body>
</html>
