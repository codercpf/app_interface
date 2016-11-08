<?php 

// http://app.com/list.php?page=1&pagesize=12

/*
 * 方案二：是方案一的改进版
 * 当缓存文件存在，且没有失效时，直接读取缓存文件；否则读取数据库，并写入缓存
 */

require_once("api.php");
require_once("db.php");
require_once("static_cache.php");

$page = isset($_GET['page']) ? $_GET['page'] : 1;
$pagesize = isset($_GET['pagesize']) ? $_GET['pagesize'] : 2;

if (!is_numeric($page) || !is_numeric($pagesize)) {
	return Response::show(401,'数据不合法');
}

$offset = ($page-1) * $pagesize;
//每页新闻的起始数，即为前n-1页的页数 * 每页的显示数量

$sql = "select * from cms_news where status=1 order by listorder desc limit ".$offset.",".$pagesize;

$cache = new File();
$rows = array();

//如果要查询的数据，缓存文件不存在，则读取数据库；缓存文件名称体现分页的页数和数据量
if (!$rows = $cache->cacheData('index_mk_cache'.$page.'-'.$pagesize)) {
	// echo 1; exit;
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
	while ($row = mysql_fetch_assoc($result)) {
		$rows[] = $row;
	}

	//将新读取的数据写入缓存文件中
	if ($rows) {
		$cache->cacheData('index_mk_cache'.$page.'-'.$pagesize, $rows, 60);  //文件名、数据、时间
	}
}


//如果存在缓存数据，则直接返回数据给app页面
if ($rows) {	
	// echo 2;exit;
	return Response::show(200, '首页数据获取成功', $rows);
} else {
	return Response::show(400, '首页数据获取失败');
}
