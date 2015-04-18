<?php
class Application_Model_Parts
{
	private $partId;
	private $vehicleId;
	private $partCategoryId;
	private $effected;
	private $partName; //*
	private $partManufacturer;
	private $description;//*
	private $sku;//*
	private $status;//*
	private $partIcon;
	private $partPrice;//*
	private $monthlyPrice;//*
	private $isSet;

	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Part property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Part property');
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

		public function getPartId() { return $this->partId; } 
		public function getVehicleId() { return $this->vehicleId; } 
		public function getPartCategoryId() { return $this->partCategoryId; } 
		public function getEffected() { return $this->effected; } 
		public function getPartName() { return $this->partName; } 
		public function getPartManufacturer() { return $this->partManufacturer; } 
		public function getDescription() { return $this->description; } 
		public function getSku() { return $this->sku; } 
		public function getStatus() { return $this->status; } 
		public function getPartIcon() { return $this->partIcon; } 
		public function getPartPrice() { return $this->partPrice; } 
		public function getMonthlyPrice() { return $this->monthlyPrice; } 
		public function getIsSet() { return $this->isSet; } 

		public function setPartId($x) { $this->partId = $x; } 
		public function setVehicleId($x) { $this->vehicleId = $x; } 
		public function setPartCategoryId($x) { $this->partCategoryId = $x; } 
		public function setEffected($x) { $this->effected = $x; } 
		public function setPartName($x) { $this->partName = $x; } 
		public function setPartManufacturer($x) { $this->partManufacturer = $x; } 
		public function setDescription($x) { $this->description = $x; } 
		public function setSku($x) { $this->sku = $x; } 
		public function setStatus($x) { $this->status = $x; } 
		public function setPartIcon($x) { $this->partIcon = $x; } 
		public function setPartPrice($x) { $this->partPrice = $x; } 
		public function setMonthlyPrice($x) { $this->monthlyPrice = $x; } 
		public function setIsSet($x) { $this->isSet = $x; } 
		
		
} //$
