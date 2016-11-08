<?php 

// http://app.com/list.php?page=1&pagesize=12

/*
 * 方案一：直接从数据库中读数据，适用于对数据实效性要求较高的情况，如实时显示
 */

require_once("api.php");
require_once("db.php");

$page = isset($_GET['page']) ? $_GET['page'] : 1;
$pagesize = isset($_GET['pagesize']) ? $_GET['pagesize'] : 2;

if (!is_numeric($page) || !is_numeric($pagesize)) {
	return Response::show(401,'数据不合法');
}

$offset = ($page-1) * $pagesize;
//每页新闻的起始数，即为前n-1页的页数 * 每页的显示数量

$sql = "select * from cms_news where status=1 order by listorder desc limit ".$offset.",".$pagesize;


/*
 *连接数据库、操作数据
 */

//操作数据库时用try{}……catch(){……}方式
try{
	$conn = Db::getInstance()->connect();
}catch(Exception $e){
	return Response::show(403, '数据库连接失败');
	//这里是给客户端看的，不能用throw($e-getMessage())方式，会把后台数据暴露出来
}


$result = mysql_query($sql, $conn);
$rows = array();
while ($row = mysql_fetch_assoc($result)) {
	$rows[] = $row;
}

//返回数据给app页面
if ($rows) {
	return Response::show(200, '首页数据获取成功', $rows);
} else {
	return Response::show(400, '首页数据获取失败');
}
