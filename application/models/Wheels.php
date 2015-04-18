<?php
class Application_Model_Wheels
{
	private $wheel_id;
	private $vehicleId;
	private $wheel_type_id;
	private $effected;
	private $partName; //*
	private $partManufacturer;
	private $description;//*
	private $sku;//*
	private $status;//*
	private $partIcon;
	private $partPrice;//*
	private $monthlyPrice;//*

	
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

		public function getWheelId() { return $this->wheel_id; }
		public function setWheelId($x) { $this->wheel_id = $x; } 
		 
		public function getVehicleId() { return $this->vehicleId; }
		public function setVehicleId($x) { $this->vehicleId = $x; } 
		 
		public function getWheelTypeId() { return $this->wheel_type_id; }
		public function setWheelTypeId($x) { $this->wheel_type_id = $x; } 
		 
		public function getEffected() { return $this->effected; }
		public function setEffected($x) { $this->effected = $x; }
		 
		public function getPartName() { return $this->partName; }
		public function setPartName($x) { $this->partName = $x; } 
		 
		public function getPartManufacturer() { return $this->partManufacturer; }
		public function setPartManufacturer($x) { $this->partManufacturer = $x; } 
		 
		public function getDescription() { return $this->description; }
		public function setDescription($x) { $this->description = $x; }
		 
		public function getSku() { return $this->sku; }
		public function setSku($x) { $this->sku = $x; }
		 
		public function getStatus() { return $this->status; }
		public function setStatus($x) { $this->status = $x; } 
		 
		public function getPartIcon() { return $this->partIcon; }
		public function setPartIcon($x) { $this->partIcon = $x; } 
		 
		public function getPartPrice() { return $this->partPrice; }
		public function setPartPrice($x) { $this->partPrice = $x; }
		 
		public function getMonthlyPrice() { return $this->monthlyPrice; }  
		public function setMonthlyPrice($x) { $this->monthlyPrice = $x; } 
		
		
} //$
