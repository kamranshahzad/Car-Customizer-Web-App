<?php

class Application_Model_Deal {

    private $dealId;
    private $uid;
    private $refNo;
    private $vehicleId;
    private $paymentType;
   
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
	
	
	
    public function getDealId() {
        return $this->dealId;
    }
	public function setDealId($dealId) {
        $this->dealId = $dealId;
    }

    public function getUid() {
        return $this->uid;
    }
	public function setUid($uid) {
        $this->uid = $uid;
    }

    public function getRefNo() {
        return $this->refNo;
    }
	public function setRefNo($refNo) {
        $this->refNo = $refNo;
    }

    public function getVehicleId() {
        return $this->vehicleId;
    }
	public function setVehicleId($vehicleId) {
        $this->vehicleId = $vehicleId;
    }

    public function getPaymentType() {
        return $this->paymentType;
    }
	public function setPaymentType($paymentType) {
        $this->paymentType = $paymentType;
    }
	



} //$
