<?php
class Application_Model_DealDetails
{
	private $dealId;
	private $salesPersonFirstName;
	private $salesPersonLastName;
	private $customerFirstName;
	private $customerLastName;
	private $customerEmail;
	private $customerPhone;

	
	 public function __construct(array $options = null)
    {
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid User property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid User property');
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
	
	
	public function getDealId() {
		return $this->dealId;
	}
	public function setDealId($dealId) {
		$this->dealId = $dealId;
	}
	
	
	public function getSalesPersonFirstName() {
		return $this->salesPersonFirstName;
	}
	public function setSalesPersonFirstName($_val) {
		$this->salesPersonFirstName = $_val;
	}
	
	
	public function getSalesPersonLastName() {
		return $this->salesPersonLastName;
	}
	public function setSalesPersonLastName($_val) {
		$this->salesPersonLastName = $_val;
	}
	
	
	
	public function getCustomerFirstName() {
		return $this->customerFirstName;
	}
	public function setCustomerPersonFirstName($_val) {
		$this->customerFirstName = $_val;
	}
	
	
	public function getcustomerLastName() {
		return $this->customerLastName;
	}
	public function setCustomerLastName($_val) {
		$this->customerLastName = $_val;
	}
	
	
	public function getCustomerEmail() {
		return $this->customerEmail;
	}
	public function setCustomerEmail($_val) {
		$this->customerEmail = $_val;
	}
	
	
	public function getCustomerPhone() {
		return $this->customerPhone;
	}
	public function setCustomerPhone($_val) {
		$this->customerPhone = $_val;
	}



} //*
