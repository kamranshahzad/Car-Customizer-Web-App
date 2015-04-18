<?php
class Application_Model_DealAccessories{
	
	
	private $aId;
	private $dealId;
	private $partType;
	private $partId;
	private $isset;
	private $purchase;
	
	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid accessory property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid accessory property');
        }
        return $this->$method();
    }
 
    public function setOptions(array $options)
    {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
	
	
	
	public function getAccessoryId() {
		return $this->aId;
	}
	public function setAccessoryId($_val) {
		$this->aId = $_val;
	}
	
	public function getDealId() {
		return $this->dealId;
	}
	public function setDealId($dealId) {
		$this->dealId = $dealId;
	}

	public function getPartType() {
		return $this->partType;
	}
	public function setPartType($partType) {
		$this->partType = $partType;
	}
	
	public function getPartId() {
		return $this->partId;
	}
	public function setPartId($partId) {
		$this->partId = $partId;
	}
	
	public function getIsset() {
		return $this->isset;
	}
	public function setIsset($_val) {
		$this->isset = $_val;
	}		
	
	public function getPurchase() {
		return $this->purchase;
	}
	public function setPurchase($_val) {
		$this->purchase = $_val;
	}	


}  //$
