<?php
class Application_Model_InstallationParts{
	
	
	private $pid;
	private $installId;
	private $partId;
	private $installerId;
	private $isDone;
	private $pTime;
	private $pDate;
	
	
	
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
	
	
	public function getPid(){	return $this->pid;	}
	public function setPid($_val){	$this->pid = $_val;	}
	
	public function getInstallId(){	return $this->installId;	}
	public function setInstallId($_val){	$this->installId = $_val;	}
	
	
	public function getPartId(){	return $this->partId;	}
	public function setPartId($_val){	$this->partId = $_val;	}
	
	public function getInstallerId(){	return $this->installerId;	}
	public function setInstallerId($_val){	$this->installerId = $_val;	}
	
	public function getIsDone(){	return $this->isDone;	}
	public function setIsDone($_val){	$this->isDone = $_val;	}
	
	public function getPTime(){	return $this->pTime;	}
	public function setPTime($_val){	$this->pTime = $_val;	}
	
	public function getPDate(){	return $this->pDate;	}
	public function setPDate($_val){	$this->pDate = $_val;	}


}  //$
