
Memcache是内存中的数据缓存，主要用于分布式、大并发的程序中，注意事项：

1、单机模式不要使用memcache，会消耗大量内存
2、不要使用memcache保存重要数据

使用情况如下：
一、读取数据，如首页index等：

	读取memcache变量
	if(存在memcache){
		返回相应数据;
	}else{
		读取数据库;
		写入memcache;
		返回相应数据;
	}


二、更新数据时，操作之前先删除相应的memcache：
	
	删除memcache;
	执行更新操作;
