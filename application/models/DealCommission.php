<?php
class Application_Model_DealCommission {

    private $id;
    private $dealId;
    private $commission;
    
    public function __construct(array $options = null) {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }

    public function __set($name, $value) {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Deal property');
        }
        $this->$method($value);
    }

    public function __get($name) {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Deal property');
        }
        return $this->$method();
    }

    public function setOptions(array $options) {
        $methods = get_class_methods($this);
        foreach ($options as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (in_array($method, $methods)) {
                $this->$method($value);
            }
        }
        return $this;
    }
	
	
	
    public function getId() {
        return $this->id;
    }
    public function setId($id) {
        $this->id = $id;
    }


		
    public function getDealId() {
        return $this->dealId;
    }
    public function setDealId($dealId) {
        $this->dealId = $dealId;
    }



    public function getCommission() {
        return $this->commission;
    }
	public function setCommission($commission) {
        $this->commission = $commission;
    }


}  //$
