<?php 

require_once("file.php");

$data = array(
	'id'=>1,
	'name'=>'singwa',
	'type'=> array(26,30,17)
	);

$file = new File();

/*
//写入缓存
if ($file->cacheData('file_cache', $data)) {
	echo "success";
}else{
	echo "error";
}
*/


/*
//读取缓存
if ($arr=$file->cacheData('file_cache')) {
	var_dump($arr);exit;
	echo "success";
}else{
	echo "error";
}
*/


//删除缓存
if ($arr=$file->cacheData('file_cache', null)) {	
	echo "success";
}else{
	echo "error";
}
