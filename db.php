<?php 
/*
单例模式三大原则：
	1、构造函数标记为非public，防止外部使用new操作符创建对象；
	   单例类不能在其他类中实例化，只能被自身实例化；
	2、拥有一个保存类的实例的静态成员变量：$_instance;
	3、拥有一个访问这个实例的公共的静态方法（外部从这个方法调用类实例）
*/

class Db{
	static private $_instance;
		//该静态变量保存自身实例化后的实例
	private function __construct(){
		//构造函数是private，这个类不能在外部被实例化

	}

	static public function getInstance(){
		//该静态公共方法用于实例化自身类，可被外部调用

		if(!(self::$_instance instanceof self)){			
			self::$_instance = new self();
		}
		/*
		* 如果不存在该类实例化后的变量，则实例化该类；存在则直接返回
		* instanceof：是……的实例
		*/
		return self::$_instance;
	}




/*
	php连接数据库
*/
	//数据库配置信息
	static private $_connectSource;
	private $_dbConfig = array(
		'host' => '127.0.0.1',
		'user' => 'root',
		'password' => 'root',
		'database' => 'imooc_singcms',
	);
	public function connect(){
		if (!self::$_connectSource) {
			//当操作数据，没有连接时，重新链接

			self::$_connectSource = @mysql_connect($this->_dbConfig['host'], 
					  $this->_dbConfig['user'], 
					  $this->_dbConfig['password']);
			if(!self::$_connectSource){
				throw new Exception('mysql connect error. '.mysql_error());
				//连接失败时，抛出异常
				// or
				// die('mysql connect error. '.mysql_error());				
			}
			//连接信息，判断连接结果

			mysql_select_db($this->_dbConfig['database'], self::$_connectSource);
			//选择数据库

			mysql_query("set names UTF8", self::$_connectSource);
			//设置数据操作的编码格式
		}		

		return self::$_connectSource;
	}


}
/*
$con = Db::getInstance()->connect();

$sql = "select * from cms_menu";
$result = mysql_query($sql,$con);
echo mysql_num_rows($result);
*/