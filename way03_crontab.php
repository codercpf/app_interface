<?php 

// http://app.com/list.php?page=1&pagesize=12

/*
 * 方案三：利用crontab执行定时任务，crontab定时读取数据生成缓存；该页面直接读缓存
 */

require_once("api.php");
require_once("static_cache.php");
$file = new File();
$data = $file->cacheData('index_cron_cache');

//返回数据给app页面
if ($data) {
	return Response::show(200, '首页数据获取成功', $data);
} else {
	return Response::show(400, '首页数据获取失败');
}
