<?php




class Bootstrap extends Zend_Application_Bootstrap_Bootstrap{
	
	
	public static $frontController = null;
    public static $root = '';
    public static $registry = null;
	
	
	protected function _initSessions(){
		Zend_Session::start();
	}
	
	protected function _initAutoload(){	
	  $autoLoader = Zend_Loader_Autoloader::getInstance();
	  $autoLoader->registerNamespace('Graphs_');//Application_
	  $autoLoader->registerNamespace('Bugs_');
	  $resourceLoader = new Zend_Loader_Autoloader_Resource(array('basePath' => APPLICATION_PATH , 'namespace' => 'Application' ));
	  $resourceLoader->addResourceType('form', 'forms/', 'Form_');
	  $resourceLoader->addResourceType('model', 'models/', 'Model_');
	  return $autoLoader;
	}
	
	protected function _initDatabase()
	{
		 $params = array(
				'host'     => 'localhost',
				'username' => 'kamran',
				'password' => '786',
				'dbname'   => 'addoncars_new',
			);
		
		$profiler = new Bugs_Db_Profiler();
		$profiler->setEnabled(true);
		$params['profiler'] = $profiler;
		$database = Zend_Db::factory('PDO_MYSQL', $params);
		$database->getConnection();
		Zend_Registry::set("database", $database);
		return $database;
	}
	
	protected function _initDomain(){	
		$domain     = 'http://localhost/aoc/';
		Zend_Registry::set("domain", $domain);
		return $domain;
	}
	
	protected function _initPublicPath(){
		$publicPath = 'http://localhost/aoc/public/';
		Zend_Registry::set("publicPath", $publicPath);
		return $publicPath;
	}
	
	
	protected function _initActionHelpers(){
		Zend_Controller_Action_HelperBroker::addPath(APPLICATION_PATH .'/controllers/helpers');
		Zend_Controller_Action_HelperBroker::addPath(APPLICATION_PATH .'/views/helpers');	
	}
	
	
	protected function _initRegisterControllerPlugins() {
		$loader = new Zend_Loader_PluginLoader(array(
			'Plugin' => APPLICATION_PATH . '\plugins',
		));
		$pluginList = array(
			'aclguard'      => $loader->load('AclGuard')
			//'plugin2' => $loader->load('Plugin2'),
		);
		$frontController = Zend_Controller_Front::getInstance();
		foreach ($pluginList as $pluginClass) {
			$frontController->registerPlugin(new $pluginClass());
		}
	}
	
	


	protected function _initViewHelpers()
	  {
				$front  = Zend_Controller_Front::getInstance();
				$router = $front->getRouter();
				
				/*
				$router->addRoute('user',
				  new Zend_Controller_Router_Route('user/index', array(
					'controller' => 'userperm',
					'action'     => 'index'
				  ))
				);
				*/
				
				/*
				$router->addRoute('user/displayusers',
				  new Zend_Controller_Router_Route('user/*', array(
					'controller' => 'userperm',
					'action'     	=> 'displayusersperm'
				  ))
				);
				*/
				
				$router->addRoute('user/createuser',
				  new Zend_Controller_Router_Route('createuserperm/*', array(
					'controller' => 'userperm',
					'action'     	=> 'createuserperm'
				  ))
				);
	  }
	
	
	
	/*
	protected function _initEnvironment(){
        error_reporting(E_ALL|E_STRICT);
        ini_set('display_errors', true);
        date_default_timezone_set('Europe/London');
        self::$root = dirname(dirname(__FILE__));
    }

    protected function _initRegistry()
    {
        self::$registry = new Zend_Registry(array(), ArrayObject::ARRAY_AS_PROPS);
        Zend_Registry::setInstance(self::$registry);
    }

    protected function _initConfiguration()
    {
        $config = new Zend_Config_Ini(
            self::$root . '/config/config.ini',
            'general'
        );
        self::$registry->configuration = $config;
    }

    protected function _initFrontController()
    {
        self::$frontController = Zend_Controller_Front::getInstance();
        self::$frontController->throwExceptions(true);
        self::$frontController->returnResponse(true);
        self::$frontController->setControllerDirectory(
            self::$root . '/application/controllers'
        );
        self::$frontController->setParam('registry', self::$registry);

        return self::$frontController; // this is *VERY* important
    }

    protected function _initView()
    {
        $view = new Zend_View;
        $view->setEncoding('UTF-8');
        $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer($view);
        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
        Zend_Layout::startMvc(
            array(
                'layoutPath' => self::$root . '/application/views/layouts',
                'layout' => 'common'
            )
        );
    }
	
	//# this will be taken care of later 
    static public function sendResponse(Zend_Controller_Response_Http $response)
    {
        $response->setHeader('Content-Type', 'text/html; charset=UTF-8', true);
        $response->sendResponse();
    }
	*/

	
}