<?php 

/*
 * 静态缓存方式读取api数据
 */

//静态缓存相关，保存、获取、删除缓存文件

class File{
	private $_dir;
	const EXT = '.txt'; //文件后缀

	public function __construct(){
		$this->_dir = dirname(__FILE__).'./caches/';
		//dirname(__FILE__)获取当前文件所在目录
	}

	/*
	 *设置缓存失效时间的原理：将数据和缓存时间一起存入文件中；读取文件时，再将时间和数据菜拆分
	 *如果当前时间 > 文件创建时间 + 缓存有效时间，则缓存失效；否则说明在缓存有效期内，直接读取缓存数据
	 */	

	//存放缓存数据的函数，$key为文件名，$value为缓存数据，$catchTime为缓存有效时间，默认0代表永久有效
	public function cacheData($key, $value='', $cacheTime=0)
	{
		$filename = $this->_dir.$key.self::EXT; 		//完整的文件名称，含路径

		//存在$value值，不为空，说明有数据要写入缓存，即为写
		if($value !== ''){

			if (is_null($value)) {		//如果$value值为null，则为删除
				return @unlink($filename);	//php删除文件用unlink();
			}

			$dir = dirname($filename);	//dirname()返回文件的目录
			if(!is_dir($dir)){			//不存在获取到的路径时，创建新目录
				mkdir($dir,0777);
			}

//将有效时间按时间戳形式转换，设定为11位（时间戳为10位，这里单位是s）
			$cacheTime = sprintf('%011d', $cacheTime);
			//使用sprintf()函数，设置为整数11位存储

			return file_put_contents($filename, $cacheTime.json_encode($value));
			//将cacheTime和缓存数据json_encode(data)，拼装后存入文件中
		}



		//不存在$value，没有缓存数据，只有文件名$key，说明是读取数据
		if(!is_file($filename)){
			//系统中找不到$key对应目录的文件，说明不存在要读取的文件
			return FALSE;		
		}
		
		//获取缓存文件的全部内容
		$contents = file_get_contents($filename);
		//用substr()函数，截取11位有效时间的内容；注意用“”,能解析变量内容；后将时间转为整数形式
		$cacheTime = intval(substr("$contents",0,11));
		//获取文件中真正有效的缓存数据
		$value = substr("$contents",11);
/*
			echo "cacheTime: ".$cacheTime."<br/>";
			echo "filemtime: ".filemtime($filename)."<br/>";
			echo "cacheTime + filemtime= ". ($cacheTime + filemtime($filename))."<br/>";
			echo "now: ".time();
			exit;
*/
		if ($cacheTime !=0 && ($cacheTime + filemtime($filename) < time())) {
			//缓存创建时间+有效时间 < 当前时间，说明缓存失效；则删除缓存文件，并重新读取数据库
			unlink($filename);
			return FALSE;
		}else{
			return json_decode($value, true);
		}

		//json_decode()返回对象格式，如果要返回字符串，第二个参数设为true
		// $contents = json_decode(file_get_contents($filename), true);		

	}
}
/*
$file  =  New File();
echo $file->cacheData('test');
*/