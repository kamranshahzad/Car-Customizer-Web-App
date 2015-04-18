<?php
class Application_Model_News{
	
	
	private $nid;
	private $title;
	private $des;
	private $dates;
	private $status;
	
	
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
	
	
	public function getNid(){	return $this->nid;	}
	public function setNid($_val){	$this->nid = $_val;	}
		
	public function getTitle(){	return $this->title;	}
	public function setTitle($_val){	$this->title = $_val;	}

	public function getDes(){	return $this->des;	}
	public function setDes($_val){	$this->des = $_val;	}
	
	public function getDate(){	return $this->dates;	}
	public function setDate($_val){	$this->dates = $_val;	}
	
	public function getStatus(){	return $this->status;	}
	public function setStatus($_val){	$this->status = $_val;	}
	
	

}  //$
