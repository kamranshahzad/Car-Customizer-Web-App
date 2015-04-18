<?php
class Application_Model_PartCategories{
	
	
	private $catId;
	private $typeId;
	private $catName;
	private $des;
	private $status;
	private $t;
	
	
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
	
	
	public function getCatId(){	return $this->catId;	}
	public function setCatId($_val){	$this->catId = $_val;	}
		
	public function getTypeId(){	return $this->typeId;	}
	public function setTypeId($_val){	$this->typeId = $_val;	}
	
	public function getCatName(){	return $this->catName;	}
	public function setCatName($_val){	$this->catName = $_val;	}
		
	public function getDes(){	return $this->des;	}
	public function setDes($_val){	$this->des = $_val;	}
	
	public function getStatus(){	return $this->status;	}
	public function setStatus($_val){	$this->status = $_val;	}
		
	public function getT(){	return $this->t;	}
	public function setT($_val){	$this->t = $_val;	}

}  //$
