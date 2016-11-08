<?php 

require_once('db.php');
require_once('static_cache.php');

$sql = "select * from cms_news where status=1 order by listorder desc";

//操作数据库时用try{}……catch(){……}方式
try{
	$conn = Db::getInstance()->connect();
}catch(Exception $e){	
	// return Response::show(403, '数据库连接失败');
	//这里是给客户端看的，不能用throw($e-getMessage())方式，会把后台数据暴露出来

	//改进：这里是crontab定时任务，如果有异常要记录日志，日志名称为当前日期
	file_put_contents('./logs/'.date('y-m-d').'.txt', $e->getMessage());
	return;
}

$rows = array();
$result = mysql_query($sql, $conn);	
while ($row = mysql_fetch_assoc($result)) {
	$rows[] = $row;
}


$file = new File();
if($rows){
	$file->cacheData('index_cron_cache', $rows);
	//读取到有数据，则写入缓存；默认cacheTime=0，表示永久有效
	/*
	 * 这里 永久有效 并不是数据一直不变；因为这个定时文件是每隔几分钟执行一次，
	 * 故下次再执行该文件时，会把当前已有的缓存文件 直接覆盖掉。
	 */
} else {
	file_put_contents('./logs/'.date('y-m-d').'.txt', "没有相关数据");
	//没有读取到数据，则记录日志
}
return;
