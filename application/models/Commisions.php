<?php
class Application_Model_Commisions{
	
	
	private $id;
	private $dealId;
	private $quantity;
	private $type;
	
	
	
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
	
	
	public function getId(){	return $this->id;	}
	public function setId($_val){	$this->id = $_val;	}
	
	public function getDealId(){	return $this->dealId;	}
	public function setDealId($_val){	$this->dealId = $_val;	}
	
	
	public function getQuntity(){	return $this->quantity;	}
	public function setQuntity($_val){	$this->quantity = $_val;	}

	public function getType(){	return $this->type;	}
	public function setType($_val){	$this->type = $_val;	}


}  //$
