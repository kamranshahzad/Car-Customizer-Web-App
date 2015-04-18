<?php

class ErrorController extends Zend_Controller_Action
{
	
	private $_notifier;  
    private $_error;  
    private $_environment;  
	private $urls;
	
	public function init()  
    {  
        parent::init();  
  
        $bootstrap = $this->getInvokeArg('bootstrap');  
  
        $environment = $bootstrap->getEnvironment();  
        $error = $this->_getParam('error_handler');  
        $mailer = new Zend_Mail();  
        $session = new Zend_Session_Namespace();  
        //$database = $bootstrap->getResource('Database');
		$database = Zend_Registry::get('database');
        $profiler = $database->getProfiler();  
  
        $this->_notifier = new Bugs_Notifier_Error(  
            $environment,  
            $error,  
            $mailer,  
            $session,  
            $profiler,  
            $_SERVER  
        );  
  
        $this->_error = $error;  
        $this->_environment = $environment; 
		
		$this->urls = new $this->_helper->urls();
   }  
  
    public function errorAction()  
    {  
		$this->view->links    = $this->urls->drawUrls(array('admin/main' => 'Dashboard' , 'current'=>'Error Description'));
	
        switch ($this->_error->type) {  
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:  
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION:  
                $this->getResponse()->setHttpResponseCode(404);  
                $this->view->message = 'Page not found';  
                break;  
  
            default:  
                $this->getResponse()->setHttpResponseCode(500);  
                $this->_applicationError();  
                break;  
        }  
  
        // Log exception, if logger available  
        if ($log = $this->_getLog()) {  
            $log->crit($this->view->message, $this->_error->exception);  
        }  
    }  
  
    private function _applicationError()  
    {  
        $fullMessage = $this->_notifier->getFullErrorMessage();  
        $shortMessage = $this->_notifier->getShortErrorMessage();  
  
        switch ($this->_environment) {  
            case 'live':  
                $this->view->message = $shortMessage;  
                break;  
            case 'test':  
                $this->_helper->layout->setLayout('blank');  
                $this->_helper->viewRenderer->setNoRender();  
  
                $this->getResponse()->appendBody($shortMessage);  
                break;  
            default:  
                $this->view->message = nl2br($fullMessage);  
        }  
  
        $this->_notifier->notify();  
    }  
  
    private function _getLog()  
    {  
        $bootstrap = $this->getInvokeArg('bootstrap');  
        if (!$bootstrap->hasPluginResource('Log')) {  
            return false;  
        }  
        $log = $bootstrap->getResource('Log');  
        return $log;  
    }
	
	
	public function noauthAction()
    {
        
    }
	
} // $

