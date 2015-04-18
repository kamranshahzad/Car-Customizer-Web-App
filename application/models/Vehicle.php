<?php
class Application_Model_Vehicle{
	
	
	private $vehicleId;
	private $trimId;
	private $colorId;
	private $title;
	
	private $bigFront;
	private $bigRear;
	private $bigInterior;
	private $smallFront;
	private $smallRear;
	private $smallInterior;
	
	
	
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
	
	
	public function getVehicleId(){	return $this->vehicleId;	}
	public function setVehicleId($_val){	$this->vehicleId = $_val;	}
	
	public function getTrimId(){	return $this->trimId;	}
	public function setTrimId($_val){	$this->trimId = $_val;	}
	
	
	public function getColorId(){	return $this->colorId;	}
	public function setColorId($_val){	$this->colorId = $_val;	}

	public function getTitle(){	return $this->title;	}
	public function setTitle($_val){	$this->title = $_val;	}
	
	
	
	public function getBigFront(){	return $this->bigFront;	}
	public function setBigFront($_val){	$this->bigFront = $_val;	}
	
	public function getBigRear(){	return $this->bigRear;	}
	public function setBigRear($_val){	$this->bigRear = $_val;	}
	
	public function getBigInterior(){	return $this->bigInterior;	}
	public function setBigInterior($_val){	$this->bigInterior = $_val;	}
	
	public function getSmallFront(){	return $this->smallFront;	}
	public function setSmallFront($_val){	$this->smallFront = $_val;	}
	
	public function getSmallRear(){	return $this->smallRear;	}
	public function setSmallRear($_val){	$this->smallRear = $_val;	}
	
	public function getSmallInterior(){	return $this->smallInterior;	}
	public function setSmallInterior($_val){	$this->smallInterior = $_val;	}

}  //$
