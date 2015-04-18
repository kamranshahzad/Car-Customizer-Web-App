<?php
class Application_Model_Install{
	
	
	private $installId;
	private $dealId;
	private $complete;
	private $idate;
	
	
	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value){
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Variable property');
        }
        $this->$method($value);
    }
 
    public function __get($name){
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Variable property');
        }
        return $this->$method();
    }
 
    public function setOptions(array $options){
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
	
	
	public function getInstallId(){	return $this->installId;	}
	public function setInstallId($_val){	$this->installId = $_val;	}
	
	public function getDealId(){	return $this->dealId;	}
	public function setDealId($_val){	$this->dealId = $_val;	}
	
	public function getComplete(){	return $this->complete;	}
	public function setComplete($_val){	$this->complete = $_val;	}
	
	public function getIDate(){	return $this->iDate;	}
	public function setIDate($_val){	$this->iDate = $_val;	}


}  //$
