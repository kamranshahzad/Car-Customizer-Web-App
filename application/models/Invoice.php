<?php
class Application_Model_Invoice{
	
	private $id;
	private $invoiceId;
	private $dealId;

	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Invoice property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Invoice property');
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
	
	
	public function getId() {
		return $this->id;
	}
	public function setId($Id) {
		$this->id = $Id;
	}
	
	
	public function getInvoiceId() {
		return $this->invoiceId;
	}
	public function setInvoiceId($invoiceId) {
		$this->invoiceId = $invoiceId;
	}


	public function getDealId() {
		return $this->dealId;
	}
	public function setDealId($dealId) {
		$this->dealId = $dealId;
	}


}  //$
