<?php 

//静态缓存相关，保存、获取、删除缓存文件

class File{
	private $_dir;
	const EXT = '.txt'; //文件后缀

	public function __construct(){
		$this->_dir = dirname(__FILE__).'./caches/';
		//dirname(__FILE__)获取当前文件所在目录
	}

	//存放缓存数据的函数，$key为文件名，$value为缓存数据，$path为存放路劲
	public function cacheData($key, $value='', $path='')
	{
		$filename = $this->_dir.$path.$key.self::EXT; 		//完整的文件名称，含路径

		//存在$value值，不为空，说明有数据要写入缓存，即为写
		if($value !== ''){

			if (is_null($value)) {		//如果$value值为null，则为删除
				return @unlink($filename);	//php删除文件用unlink();
			}

			$dir = dirname($filename);	//dirname()返回文件的目录
			if(!is_dir($dir)){			//不存在获取到的路径时，创建新目录
				mkdir($dir,0777);
			}

			return file_put_contents($filename, json_encode($value));
		}

		//不存在$value，没有缓存数据，只有文件名$key，说明是取数据
		if(!is_file($filename)){
			//系统中找不到$key对应目录的文件，说明不存在要读取的文件
			return FALSE;		
		}else{
			//json_decode()返回对象格式，如果要返回字符串，第二个参数设为true
			return json_decode(file_get_contents($filename), true);			
		}

	}
}
