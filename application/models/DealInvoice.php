<?php

class Application_Model_DealInvoice {

    private $id;
    private $invoice_id;
    private $deal_id;
   
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
	
	
	public function getId(){	return $this->id;	}
	public function setId($_val){	$this->id = $_val;	}
	
	public function getInvoiceId(){	return $this->invoice_id;	}
	public function setInvoiceId($_val){	$this->invoice_id = $_val;	}
	
	public function getDealId(){	return $this->deal_id;	}
	public function setDealId($_val){	$this->deal_id = $_val;	}



} //$
