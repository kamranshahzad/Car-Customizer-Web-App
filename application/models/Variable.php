<?php
class Application_Model_Variable{
	
	
	private $pname;
	private $ptype;
	private $pvalue;
	
	
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
	
	
	public function getVarName(){	return $this->pname;	}
	public function setVarName($_val){	$this->pname = $_val;	}
	
	public function getVarType(){	return $this->ptype;	}
	public function setVarType($_val){	$this->ptype = $_val;	}
	
	
	public function getVarValue(){	return $this->pvalue;	}
	public function setVarValue($_val){	$this->pvalue = $_val;	}



}  //$
