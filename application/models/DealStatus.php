<?php
class Application_Model_DealStatus
{
    private $id;
    private $dealId;
	private $status;
	private $pendingDateTime;
	private $openDateTime;
	private $completeDateTime;
    private $finalizedDateTime;
	
	public function __construct(array $options = null){
        if (is_array($options)) {
            $this->setOptions($options);
        }
    }
 
    public function __set($name, $value)
    {
        $method = 'set' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Deal property');
        }
        $this->$method($value);
    }
 
    public function __get($name)
    {
        $method = 'get' . $name;
        if (('mapper' == $name) || !method_exists($this, $method)) {
            throw new Exception('Invalid Deal property');
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
    public function setId($id) {
        $this->id = $id;
    }


    public function getDealId() {
        return $this->dealId;
    }
    public function setDealId($dealId) {
        $this->dealId = $dealId;
    }


    public function getStatus() {
        return $this->status;
    }
    public function setStatus($status) {
        $this->status = $status;
    }


    public function getPendingDateTime() {
        return $this->pendingDateTime;
    }
    public function setPendingDateTime($pendingDateTime) {
        $this->pendingDateTime = $pendingDateTime;
    }

	
    public function getOpenDateTime() {
        return $this->openDateTime;
    }
    public function setOpenDateTime($openDateTime) {
        $this->openDateTime = $openDateTime;
    }
	
	
    public function getCompleteDateTime() {
        return $this->completeDateTime;
    }
    public function setCompleteDateTime($completeDateTime) {
        $this->completeDateTime = $completeDateTime;
    }
	

    public function getFinalizedDateTime() {
        return $this->finalizedDateTime;
    }
    public function setFinalizedDateTime($finalizedDateTime) {
        $this->finalizedDateTime = $finalizedDateTime;
    }

} //$
