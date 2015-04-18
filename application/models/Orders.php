<?php
class Application_Model_Orders{
	
	
	private $orderId;
	private $dealId;
	private $totalAmount;
	private $discount;
	private $tax;
	private $cdate;
	
	
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
	
	
	public function getOrderId(){	return $this->orderId;	}
	public function setOrderId($_val){	$this->orderId = $_val;	}
	
	public function getDealId(){	return $this->dealId;	}
	public function setDealId($_val){	$this->dealId = $_val;	}
	
	
	public function getTotalAmount(){	return $this->totalAmount;	}
	public function setTotalAmount($_val){	$this->totalAmount = $_val;	}
	
	public function getTax(){	return $this->tax;	}
	public function setTax($_val){	$this->tax = $_val;	}
	
	public function getDiscount(){	return $this->discount;	}
	public function setDiscount($_val){	$this->discount = $_val;	}
	
	public function getCdate(){	return $this->cdate;	}
	public function setCdate($_val){	$this->cdate = $_val;	}


}  //$
