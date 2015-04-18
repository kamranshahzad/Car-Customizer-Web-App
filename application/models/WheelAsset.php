<?php
class Application_Model_WheelAsset{
	
	
	private $asset_id;
	private $wheel_id;
	private $FrontView;
	private $RearView;
	private $InteriorView;
	private $OtherView;
	private $FVIEW;
	private $RVIEW;
	private $IVIEW;

	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value){
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Trim property');
        }
        $this->$method($value);
    }
 
    public function __get($name){
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Trim property');
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
	
	

	public function getAssetId()		{	return $this->asset_id;		}
	public function setAssetId($_val)	{	$this->asset_id = $_val;	}

	public function getWheelId()		{	return $this->wheel_id;		}
	public function setWheelId($_val)	{	$this->wheel_id = $_val;	}
	
	public function getFrontView()		{	return $this->FrontView;	}
	public function setFrontView($_val)	{	$this->FrontView = $_val;	}
	
	public function getRearView()		{	return $this->RearView;		}
	public function setRearView($_val)	{	$this->RearView = $_val;	}
	
	public function getInteriorView()		{	return $this->InteriorView;	}
	public function setInteriorView($_val)	{	$this->InteriorView = $_val;}
	
	public function getOtherView()		{	return $this->OtherView;	}
	public function setOtherView($_val)	{	$this->OtherView = $_val;}
	
	public function getFVIEW()			{	return $this->FVIEW;		}
	public function setFVIEW($_val)		{	$this->FVIEW = $_val;		}
	
	public function getRVIEW()			{	return $this->RVIEW;		}
	public function setRVIEW($_val)		{	$this->RVIEW = $_val;		}
	
	public function getIVIEW()			{	return $this->IVIEW;		}
	public function setIVIEW($_val)		{	$this->IVIEW = $_val;		}


}  //$
