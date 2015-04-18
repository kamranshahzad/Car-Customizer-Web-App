<?php

class AddOnCars {
	
		var $dbhost = "localhost";
        var $dbname = "addonca1_addoncars";
        var $dbuser = "addonca1_aocdba";
        var $dbpass = "j@w@d@bb@$$";
        
        function AddOnCars()
        {
           $this->methodTable = array(
		   				"getViewsStatistices" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "string",
							"arguments" => array("trim_id")
						),
                		"getPartByID" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("part_id")
							),
						"getWheelByID" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("wheel_id")
							),
						"getPartByCategoryId" => array(
							"description" => "parts",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("cat_id")
							),
						"getWheelByCategoryId" => array(
							"description" => "wheels",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("cat_id")
							),
						"getVehicleByID" => array(
							"description" => "vehicles",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("vid")
							),
						"getBackgroundByID" => array(
							"description" => "backgrounds",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("bid")
							),
						 "getAllPartTypes" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "getAllPartManufacturer" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "getAllPartCategories" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("cid")
							),
						 "getAllWheelTypes" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "getWheelTypesById" => array(
							"description" => "tablename",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("wid")
							),
						 "insertParts" => array(
							"description" => "tablename",
							"access" => "remote"
							),
						  "insertWheels" => array(
							"description" => "wheels , wheel_assets , wheel_dimentions",
							"access" => "remote"
							),
						 "insertMakes" => array(
							"description" => "makes",
							"access" => "remote"
							),
						 "countMakes" => array(
							"description" => "makes",
							"access" => "remote"
							),
						 "getAllMakes" => array(
							"description" => "makes",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "deleteMakes" => array(
							"description" => "makes",
							"access" => "remote"
							),
						 "insertBackgrounds" => array(
							"description" => "backgrounds",
							"access" => "remote"
							),
						 "countBackgrounds" => array(
							"description" => "backgrounds",
							"access" => "remote"
							),
						 "getBackgrounds" => array(
							"description" => "backgrounds",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "deleteBackgrounds" => array(
							"description" => "backgrounds",
							"access" => "remote"
							),
						 
						 "insertModels" => array(
							"description" => "backgrounds",
							"access" => "remote"
							),
						 "countModels" => array(
							"description" => "backgrounds",
							"access" => "remote"
							),
						 "getModels" => array(
							"description" => "backgrounds",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("make_id","year_id")
							),
						 "deleteModels" => array(
							"description" => "backgrounds",
							"access" => "remote"
							),
						 
						 "insertTrims" => array(
							"description" => "trim",
							"access" => "remote"
							),
						 "countTrims" => array(
							"description" => "trim",
							"access" => "remote"
							),
						 "getTrims" => array(
							"description" => "trim",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("make_id")
							),
						 "deleteTrims" => array(
							"description" => "trim",
							"access" => "remote"
							),
						 
						 "insertVehicle" => array(
							"description" => "vehicles",
							"access" => "remote"
							),
						 "countVehiclesByID" => array(
							"description" => "vehicles",
							"access" => "remote"
							),
						 "countFilteredVehicles" => array(
							"description" => "vehicles,colors",
							"access" => "remote"
							),
						 "getVehiclesByID" => array(
							"description" => "vehicles",
							"access" => "remote",
							"returntype" => "recordSet",
							"arguments" => array("vid")
							),
						 "getFilteredVehicles" => array(
							"description" => "vehicles, colors",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "deleteVehicle" => array(
							"description" => "vehicles",
							"access" => "remote"
							),
						 
						 
						 "insertYears" => array(
							"description" => "years",
							"access" => "remote"
							),
						 "getYears" => array(
							"description" => "years",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "deleteYears" => array(
							"description" => "years",
							"access" => "remote"
							),
						 
						 "getExteriorColor" => array(
							"description" => "exterior_colors ",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "insertExteriorColor" => array(
							"description" => "tablename",
							"access" => "remote"
							),
						 "countExteriorColor" => array(
							"description" => "tablename",
							"access" => "remote"
							),
						 "deleteExteriorColor" => array(
							"description" => "exterior_colors",
							"access" => "remote"
							),
						 "getInteriorColor" => array(
							"description" => "interior_colors",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						 "insertInteriorColor" => array(
							"description" => "interior_colors",
							"access" => "remote"
							),
						 "countInteriorColor" => array(
							"description" => "interior_colors",
							"access" => "remote"
							),
						 "deleteInteriorColor" => array(
							"description" => "interior_colors",
							"access" => "remote"
							),
						 
						 "getSettings" => array(
							"description" => "settings",
							"access" => "remote",
							"returns" => "array"
							),
						 
						 "deleteParts" => array(
							"description" => "tablename",
							"access" => "remote"
							),
						 "isRecordExist" => array(
							"description" => "tablename",
							"access" => "remote"
							),
						  "isUserExist" => array(
							"description" => "tablename",
							"access" => "remote",
							"arguments" => array("uname","pass")
							),
						  "insertPartInDeal" => array(
							"description" => "deal_accessories",
							"access" => "remote"
							),
						  "removePartFrmDeal" => array(
							"description" => "deal_accessories",
							"access" => "remote"
							),
						   "getDealItemsByID" => array(
							"description" => "deal_accessories",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						   "getDealPartsInfo" => array(
							"description" => "parts",
							"access" => "remote",
							"returntype" => "recordSet"
							),
						   "getDealWheelInfo" => array(
							"description" => "wheels",
							"access" => "remote",
							"returntype" => "recordSet"
							)
            );
        	// Initialize db connection
        	$this->conn = mysql_connect($this->dbhost, $this->dbuser, $this->dbpass);
       	 	mysql_select_db ($this->dbname);
        }
	
	/*   WORKER FUNCTIONS*/
	
	
	/*  Deals Manager */
	
	
	
	function insertPartInDeal( $dealRef , $userID , $partType , $part_id , $isset='N' ){
		$row = mysql_fetch_object(mysql_query("SELECT deal_id FROM deals WHERE ref_no='$dealRef' AND uid='$userID' "));
		$dealID = $row->deal_id;
		mysql_query("INSERT INTO deal_accessories VALUES ( NULL , '$dealID' , '$partType' , '$part_id' ,'$isset','0' )");
		$last_id =  mysql_insert_id();
		return $last_id;
	}
	
	function insertPartItemsInDeal( $dealID , $partType , $partIdsStr   ){
		$pIdArr =  explode(",", $partIdsStr);
		$tempArr = array();
		for($p = 0; $p < count($pIdArr); $p++){
			if($pIdArr[$p] != ''){
				mysql_query("INSERT INTO deal_accessories VALUES ( NULL , '$dealID' , '$partType' , '".$pIdArr[$p]."' , 'N', '0')");
				array_push($tempArr , mysql_insert_id());
			}
		}
		return $tempArr;
	}
	
	function getSetPartItems($idsStr){
		$idsArr = explode(",", $idsStr);
		$filter = '';
		for($p = 0; $p < count($idsArr); $p++){
			if($idsArr[$p] != ''){
				if($p == count($idsArr)-2 ){
					$filter .= 'part_id='.$idsArr[$p];
				}else{
					$filter .= 'part_id='.$idsArr[$p].' OR ';	
				}	
			}
		}
		return mysql_query("SELECT part_id,part_name,part_price,montly_price,effected FROM parts WHERE $filter");
	}
	
	
	function removePartFrmDeal($aid , $part_type ){
		return mysql_query("DELETE FROM deal_accessories WHERE aid='$aid' AND part_type='$part_type' ");
	}
	
	function getDealVehicle($dealRef , $uid ){  //*reg
		return mysql_query("SELECT *
							FROM vehicles
							INNER JOIN colors ON vehicles.color_id = colors.color_id
							WHERE vehicles.vehicle_id = (
							SELECT vehicle_id
							FROM deals
							WHERE ref_no = '$dealRef'
							AND uid = '$uid' )
							GROUP BY vehicles.color_id");
	}
	
	
	function getDealProducts($dealRef , $uid){
		$result = mysql_query("SELECT deal_id FROM deals WHERE ref_no = '$dealRef' AND uid = '$uid'");
		$row    = mysql_fetch_object($result);
		return mysql_query("SELECT * FROM deal_accessories WHERE deal_id= '".$row->deal_id."' ORDER BY aid DESC");
	}
	
	
	function getDealItemsByID($deal_id){
		return mysql_query("SELECT * FROM deal_accessories WHERE deal_id='$deal_id'");
	}
	
	function getDealPartsInfo($deal_id,$part_type){
		return mysql_query("SELECT deal_accessories.aid,deal_accessories.deal_id,deal_accessories.part_type,parts.part_id,parts.part_name,parts.part_price,parts.montly_price FROM deal_accessories INNER JOIN parts ON parts.part_id = deal_accessories.part_id WHERE deal_accessories.part_type='$part_type' AND deal_accessories.deal_id='$deal_id' GROUP BY parts.part_id");
	}
	
	function getDealWheelInfo($deal_id,$part_type){
		return mysql_query("SELECT deal_accessories.aid,deal_accessories.deal_id,deal_accessories.part_type,wheels.wheel_id,wheels.part_name,wheels.part_price,wheels.montly_price FROM deal_accessories INNER JOIN wheels ON wheels.wheel_id = deal_accessories.part_id WHERE deal_accessories.part_type='$part_type' AND deal_accessories.deal_id='$deal_id' GROUP BY wheels.wheel_id");
	}
	
	
	
	
	
	/*   Parts   */
	function insertParts($vehicle_id , $part_category_id , $effected,  $part_name, $part_manufacturer,$description,$sku,$status,$part_icon,$part_price, $montlyPrice, $FrontView_asset ,$RearView_asset ,$InteriorView_asset ,$OtherView_asset , $FVIEW_asset , $RVIEW_asset , $IVIEW_asset , $FrontView_coord ,$RearView_coord ,$InteriorView_coord ,$OtherView_coord , $FVIEW_coord , $RVIEW_coord , $IVIEW_coord ){
		 mysql_query("INSERT INTO parts VALUES (NULL ,'$vehicle_id','$part_category_id' ,'$effected', '$part_name','$part_manufacturer', '$description' ,'$sku' ,'$status' ,'$part_icon','$part_price','$montlyPrice' , 'N') ") or die(mysql_error());
		 $last_id =  mysql_insert_id();
		 $this->insertPartAssets($last_id , $FrontView_asset ,$RearView_asset ,$InteriorView_asset ,$OtherView_asset , $FVIEW_asset , $RVIEW_asset , $IVIEW_asset );
		 $this->insertPartCoordinates($last_id , $FrontView_coord ,$RearView_coord ,$InteriorView_coord ,$OtherView_coord , $FVIEW_coord , $RVIEW_coord , $IVIEW_coord );
		 return $last_id;
	}
	
	function insertPartAssets( $part_id ,$FrontView,$RearView,$InteriorView,$OtherView, $FVIEW , $RVIEW , $IVIEW ){
		$sql = "INSERT INTO part_assets(part_id,FrontView,RearView,InteriorView,OtherView,FVIEW,RVIEW,IVIEW) VALUES ('$part_id', '$FrontView' , '$RearView', '$InteriorView' , '$OtherView' , '$FVIEW' , '$RVIEW' , '$IVIEW' )";
		mysql_query($sql);
	}
	function insertPartCoordinates( $part_id ,$FrontView,$RearView,$InteriorView,$OtherView, $FVIEW , $RVIEW , $IVIEW ){
		$sql = "INSERT INTO part_dimentions(part_id,FrontView,RearView,InteriorView,OtherView,FVIEW,RVIEW,IVIEW) VALUES ('$part_id', '$FrontView' , '$RearView', '$InteriorView' , '$OtherView' , '$FVIEW' , '$RVIEW' , '$IVIEW' )";
		mysql_query($sql);
	}
	
	
	function getPartByCategoryId($cat_id , $vehicle_id ){
		return mysql_query("SELECT * FROM parts WHERE part_category_id='$cat_id' AND vehicle_id='$vehicle_id'");
	}
	
	
	function getPartByCreateSet($cat_id , $vehicle_id ){ //*reg
		return mysql_query("SELECT * FROM parts WHERE part_category_id='$cat_id' AND vehicle_id='$vehicle_id' AND is_set='N' AND effected='1'");
	}
	
	function getSinglePart($part_id){   //*reg
		return mysql_query("SELECT * FROM parts WHERE part_id='$part_id'");
	}
	
	function getPartByID($part_id){
		return mysql_query("SELECT * FROM part_assets INNER JOIN part_dimentions ON part_assets.part_id = part_dimentions.part_id WHERE part_assets.part_id='$part_id' GROUP BY part_assets.part_id");	
	}
	
	function deleteParts($id) {
      return mysql_query("DELETE FROM parts WHERE part_id=".$id);
    }
	
	
	
	function getDealParts($part_id){   //*reg
		return mysql_query("SELECT part_id,part_name,effected,part_price,montly_price,is_set FROM parts WHERE part_id='$part_id'");
	}
	
	
	
	
	
   
   /* part_sets  */
   	function insertPartSet($vehicle_id , $part_category_id ,  $part_name, $part_manufacturer,$description,$sku,$status,$part_icon,$part_price, $montlyPrice , $set_ids ){
		 mysql_query("INSERT INTO parts VALUES (NULL ,'$vehicle_id','$part_category_id' ,'0', '$part_name','$part_manufacturer', '$description' ,'$sku' ,'$status' ,'$part_icon','$part_price','$montlyPrice' ,'Y') ") or die(mysql_error());
		 $last_id =  mysql_insert_id();
		 $this->insertSet($last_id , $set_ids);
		 return $last_id; //* reg
	}
	function insertSet( $part_id ,$set_ids ){ //*reg
		$sql = "INSERT INTO part_sets(part_id,set_ids) VALUES ('$part_id', '$set_ids' )";
		mysql_query($sql);
	}
	function getPartsSet( $part_id  ){ //*reg
		return mysql_query("SELECT * FROM part_sets WHERE part_id='$part_id' ");
	}
	function isPartsSetExist($vehicle_id){
		return mysql_num_rows(mysql_query("SELECT * FROM parts INNER JOIN part_sets ON parts.part_id = part_sets.part_id WHERE parts.vehicle_id='$vehicle_id'"));	
	}
	
	function removePartsSet($vehicle_id  ){ //*reg
		$result = mysql_query("SELECT part_id FROM parts WHERE vehicle_id='$vehicle_id' AND is_set='Y'");
		$row    = mysql_fetch_object($result);
		$this->deletePartSet($row->part_id);
		return $this->deletePartByPid($row->part_id);
	}
   	
	function deletePartSet($pid) {
      return mysql_query("DELETE FROM part_sets WHERE part_id =".$pid);
    }
	
	function deletePartByPid($pid) {
      return mysql_query("DELETE FROM parts WHERE part_id =".$pid);
    }
	
	
	
	
	
	/* Wheels */
	function insertWheels($vehicle_id , $part_category_id , $effected,  $part_name, $part_manufacturer,$description,$sku,$status,$part_icon,$part_price, $montlyPrice , $FrontView_asset ,$RearView_asset ,$InteriorView_asset ,$OtherView_asset , $FVIEW_asset , $RVIEW_asset , $IVIEW_asset , $FrontView_coord ,$RearView_coord ,$InteriorView_coord ,$OtherView_coord , $FVIEW_coord , $RVIEW_coord , $IVIEW_coord ){
		 mysql_query("INSERT INTO wheels VALUES (NULL ,'$vehicle_id','$part_category_id' ,'$effected', '$part_name','$part_manufacturer', '$description' ,'$sku' ,'$status' ,'$part_icon','$part_price' ,'$montlyPrice') ");
		 $last_id =  mysql_insert_id();
		 $this->insertWheelAssets($last_id , $FrontView_asset ,$RearView_asset ,$InteriorView_asset ,$OtherView_asset , $FVIEW_asset , $RVIEW_asset , $IVIEW_asset );
		 $this->insertWheelCoordinates($last_id , $FrontView_coord ,$RearView_coord ,$InteriorView_coord ,$OtherView_coord , $FVIEW_coord , $RVIEW_coord , $IVIEW_coord );
		 return $last_id;
	}
	
	function insertWheelAssets( $part_id ,$FrontView,$RearView,$InteriorView,$OtherView, $FVIEW , $RVIEW , $IVIEW ){
		$sql = "INSERT INTO wheel_assets(wheel_id,FrontView,RearView,InteriorView,OtherView,FVIEW,RVIEW,IVIEW) VALUES ('$part_id', '$FrontView' , '$RearView', '$InteriorView' , '$OtherView' , '$FVIEW' , '$RVIEW' , '$IVIEW' )";
		return mysql_query($sql);
	}
	
	function insertWheelCoordinates( $part_id ,$FrontView,$RearView,$InteriorView,$OtherView, $FVIEW , $RVIEW , $IVIEW ){
		$sql = "INSERT INTO wheel_dimentions(wheel_id,FrontView,RearView,InteriorView,OtherView,FVIEW,RVIEW,IVIEW) VALUES ('$part_id', '$FrontView' , '$RearView', '$InteriorView' , '$OtherView' , '$FVIEW' , '$RVIEW' , '$IVIEW' )";
		return mysql_query($sql);
	}
	
	function getWheelByCategoryId($cat_id , $vehicle_id ){
		return mysql_query("SELECT * FROM wheels WHERE wheel_type_id='$cat_id' AND vehicle_id='$vehicle_id'");
	}
	
	function getWheelByID($wheel_id){
		return mysql_query("SELECT * FROM wheel_assets INNER JOIN wheel_dimentions ON wheel_assets.wheel_id = wheel_dimentions.wheel_id WHERE wheel_assets.wheel_id='$wheel_id' GROUP BY wheel_assets.wheel_id");	
	}
	
	function getDealWheels($wheel_id){   //*reg
		return mysql_query("SELECT wheel_id,part_name,effected,part_price,montly_price FROM wheels WHERE wheel_id='$wheel_id'");
	}
	
	

	
	/* Helper functions  */
	function isRecordExist($id){
		return mysql_num_rows(mysql_query("SELECT * FROM parts WHERE part_id='$id'"));	
	}
	
	function getAllPartManufacturer(){
		return mysql_query("SELECT * FROM part_manufacturer");	
	}
	
	function insertManufacturer( $manuLbl ){  // **
		$sql = "INSERT INTO part_manufacturer( manufacturer_name ) VALUES ('$manuLbl' )";
		return mysql_query($sql);
	}
	
	function deleteManufacturer($mid) { // **
      return mysql_query("DELETE FROM part_manufacturer WHERE manufacturer_id =".$mid);
    }
	
	
	
	function getAllPartTypes(){
		return mysql_query("SELECT * FROM part_types");	
	}
	
	
	//Admin
	function getAllPartCategories( $tid , $vehicle_id ){
		return mysql_query("SELECT part_categories.part_category_id, part_categories.part_category_name FROM part_categories INNER JOIN parts ON part_categories.part_category_id  = parts.part_category_id WHERE parts.vehicle_id='$vehicle_id' AND part_categories.part_type_id='$tid' GROUP BY parts.part_category_id");	
	}
	function getAllAccessoryCategories( $tid  ){ //*reg
		return mysql_query("SELECT * FROM part_categories WHERE part_type_id='$tid' GROUP BY part_category_id");	
	}
	
	function getWheelSizeAll( $tid ){  //*reg
		return mysql_query("SELECT part_category_id,part_category_name FROM part_categories WHERE part_type_id='$tid' GROUP BY part_category_id");	
	}
	
	//Admin
	function getWheelTypesById($wid , $vehicle_id ){
		return mysql_query("SELECT wheel_types.wheel_type_id,wheel_types.wheel_type_name FROM wheel_types INNER JOIN wheels ON wheel_types.wheel_type_id = wheels.wheel_type_id WHERE wheels.vehicle_id='$vehicle_id' AND wheel_types.wheel_type_id ='$wid' GROUP BY wheel_types.wheel_type_id");	
	}
	function getWheelTypesById2($wid ){
		return mysql_query("SELECT * FROM wheel_types WHERE part_category_id ='$wid' GROUP BY wheel_type_id");	
	}
	
	
	function getAllWheelTypes(){
		return mysql_query("SELECT * FROM wheel_types");	
	}
	
	function getVehicleByID($vid){
		return mysql_query("SELECT * FROM vehicles WHERE vehicle_id='$vid'");	
	}
	
	//make
	function insertMakes($make_label , $make_logo ){
		 return mysql_query("INSERT INTO makes VALUES (NULL,'$make_label','$make_logo' ) ");
	}
	
	function updateMakes($make_id , $make_label , $make_logo ){   // *reg
		 return mysql_query("UPDATE makes SET make_name='$make_label' , make_icon='$make_logo' WHERE make_id='$make_id'") or die(mysql_error());
	}
	
	function getAllMakes(){
		return mysql_query("SELECT * FROM makes");	
	}
	
	function getMakesLogo($make_id){  //*reg
		return mysql_query("SELECT make_icon FROM makes WHERE make_id='$make_id'");	
	}
	
	function getAllMakesByID($mid){   // *reg
		return mysql_query(" SELECT * FROM makes WHERE make_id='$mid' ");	
	}
	
	function countMakes(){
		$result = mysql_query("SELECT * FROM makes") ;
		return mysql_num_rows($result);
	}
	
	function deleteMakes($id) {
      return mysql_query("DELETE FROM makes WHERE make_id=".$id);
    }
	
	/*  backgrounds   */
	
	function getBackgroundByID($bid){
		return mysql_query("SELECT * FROM backgrounds WHERE backgrounds.background_id='$bid'");	
	}
	
	function getBGById($bg_id ){   //*reg
		return mysql_query("SELECT * FROM backgrounds WHERE background_id='$bg_id'");
	}
	
	function insertBackgrounds($bg_name , $bg_image ){
		 return mysql_query("INSERT INTO backgrounds VALUES (NULL,'$bg_name','$bg_image' ) ");
	}
	
	function updateBackground($bg_id , $bg_name , $bg_image ){  //*reg
		 return mysql_query("UPDATE backgrounds SET bg_name='$bg_name',bg_image ='$bg_image' WHERE background_id='$bg_id'");
	}
	
	
	function getBackgrounds(){
		return mysql_query("SELECT * FROM backgrounds");	
	}
	
	function countBackgrounds(){
		$result = mysql_query("SELECT * FROM backgrounds") ;
		return mysql_num_rows($result);
	}
	
	function deleteBackgrounds($id) {
      return mysql_query("DELETE FROM backgrounds WHERE bg_id=".$id);
    }
	
	//models
	function insertModels($make_id , $year_id , $model_name , $model_image ){
		 return mysql_query("INSERT INTO models VALUES (NULL,'$make_id','$year_id','$model_name','$model_image' ) ");
	}
	
	function updateModels($model_id , $make_id , $year_id , $model_name , $model_image ){
		 return mysql_query("UPDATE models SET make_id='$make_id',year_id='$year_id',model_name='$model_name',model_image='$model_image' WHERE model_id='$model_id' ");
	}
	
	function getModels($make_id, $year_id ){
		return mysql_query("SELECT * FROM models WHERE make_id='$make_id' AND year_id='$year_id'");	
	}
	
	function getModelsByID($model_id ){ // * reg
		return mysql_query("SELECT * FROM models WHERE model_id='$model_id'");	
	}
	
	function countModels($make_id, $year_id){
		$result = mysql_query("SELECT * FROM models WHERE make_id='$make_id' AND year_id='$year_id'");
		return mysql_num_rows($result);
	}
	
	function deleteModels($model_id) {
      return mysql_query("DELETE FROM models WHERE model_id=".$model_id);
    }
	
	//Years
	function getYears(){
		return mysql_query("SELECT * FROM years");	
	}
	function insertYears($year){
		 return mysql_query("INSERT INTO years VALUES (NULL,'$year' ) ");
	}
	function deleteYears($year_id) {
      return mysql_query("DELETE FROM years WHERE year_id=".$year_id);
    }
	
	//Trims
	function insertTrims($model_id , $trim_name ){
		 return mysql_query("INSERT INTO trim VALUES (NULL,'$model_id','$trim_name' ) ");
	}
	
	function updateTrims($trim_id , $model_id , $trim_name ){  //*reg
		 return mysql_query("UPDATE trim SET  model_id='$model_id',trim_name='$trim_name' WHERE trim_id='$trim_id' ");
	}
	
	function getTrims($make_id ){
		return mysql_query(" SELECT * FROM trim WHERE model_id='$make_id' ");	
	}
	
	function getTrimsById($trim_id ){  //  *reg
		return mysql_query(" SELECT * FROM trim WHERE trim_id='$trim_id' ");	
	}
	
	function countTrims($make_id){
		$result = mysql_query("SELECT * FROM trim WHERE model_id='$make_id' ");
		return mysql_num_rows($result);
	}
	
	function deleteTrims($model_id) {
      return mysql_query("DELETE FROM trim WHERE trim_id=".$model_id);
    }
	
	// Colors (exterior_colors , interior_colors )
	
	function getExteriorColor($trim_id){	
		return mysql_query("SELECT * FROM exterior_colors WHERE trim_id='$trim_id' ");
	}
	function getExteriorColorByID($color_id){	// *reg
		return mysql_query("SELECT * FROM exterior_colors WHERE exterior_colors_id='$color_id' ");
	}
	function insertExteriorColor($trim_id , $color_label , $color_code){
		 return mysql_query("INSERT INTO exterior_colors VALUES (NULL, '$trim_id' , '$color_label' , '$color_code' )");	
	}
	function updateExteriorColor($color_id ,$trim_id , $color_label , $color_code){
		 return mysql_query("UPDATE exterior_colors SET trim_id='$trim_id',color_label='$color_label',color_code='$color_code' WHERE exterior_colors_id='$color_id'");	
	}
	function countExteriorColor($trim_id){
		$result = mysql_query("SELECT * FROM exterior_colors WHERE trim_id='$trim_id' ");
		return mysql_num_rows($result);
	}
	function deleteExteriorColor($exterior_id) {
      return mysql_query("DELETE FROM exterior_colors WHERE exterior_colors_id=".$exterior_id);
    }
	
	
	function getInteriorColor($trim_id){
		return mysql_query("SELECT * FROM interior_colors WHERE trim_id='$trim_id' ");	
	}
	function getInteriorColorById($color_id){  // *reg
		return mysql_query("SELECT * FROM interior_colors WHERE interior_colors_id='$color_id' ");	
	}
	function insertInteriorColor($trim_id , $color_label , $color_image){
		 return mysql_query("INSERT INTO interior_colors VALUES (NULL,'$trim_id','$color_label','$color_image' )");	
	}
	function updateInteriorColor($color_id, $trim_id , $color_label , $color_image){
		 return mysql_query("UPDATE interior_colors SET trim_id='$trim_id',color_label='$color_label',color_image='$color_image' WHERE interior_colors_id='$color_id' ");	
	}
	function countInteriorColor($trim_id){
		$result = mysql_query("SELECT * FROM interior_colors WHERE trim_id='$trim_id' ");
		return mysql_num_rows($result);
	}
	function deleteInteriorColor($interior_id) {
      	return mysql_query("DELETE FROM interior_colors WHERE interior_colors_id=".$interior_id);
    }
	
	// Colors (main tbl)
	function insertColor($trim_id , $interior_id, $exterior_id , $title , $front_big_img , $rear_big_img , $interior_big_img , $front_small_img , $rear_small_img , $interior_small_img ){
		 mysql_query("INSERT INTO colors VALUES (NULL,'$interior_id' , '$exterior_id' )");
		 $last_id =  mysql_insert_id();
		 $this->insertVehicle($trim_id , $last_id , $title , $front_big_img , $rear_big_img , $interior_big_img , $front_small_img , $rear_small_img , $interior_small_img );
		  $vehicle_id =  mysql_insert_id();
		 $this->insertCanvesBackground($vehicle_id);
		 return $last_id;	
	}
	
	function deleteColor($color_id){
		return mysql_query("DELETE FROM colors WHERE color_id=".$color_id);
	}
	
	
	
	// Vehicles
	
	function insertVehicle($trim_id , $color_id , $title , $front_big_img , $rear_big_img , $interior_big_img , $front_small_img , $rear_small_img , $interior_small_img){
		 $result = mysql_query("INSERT INTO vehicles VALUES (NULL,'$trim_id','$color_id','$title' ,'$front_big_img' , '$rear_big_img' , '$interior_big_img' , '$front_small_img' , '$rear_small_img' , '$interior_small_img' )");
		 //$last_id =  mysql_insert_id();
		 return $result;		
	}
	
	function getVehiclesByID($vid ,$trim_id , $exterior_id , $interior_id  ){
		return mysql_query("SELECT *  FROM vehicles INNER JOIN colors ON vehicles.color_id  = colors.color_id WHERE vehicles.trim_id ='$trim_id' AND vehicles.vehicle_id ='$vid' AND colors.exterior_colors_id='$exterior_id' AND colors.interior_colors_id='$interior_id' GROUP BY vehicles.vehicle_id");	
	}
	
	
	function getFilteredVehicles($trim_id , $exterior_id , $interior_id ){
		return mysql_query("SELECT *  FROM vehicles INNER JOIN colors ON vehicles.color_id  = colors.color_id WHERE vehicles.trim_id ='$trim_id' AND colors.exterior_colors_id='$exterior_id' AND colors.interior_colors_id='$interior_id' GROUP BY vehicles.vehicle_id");	
	}
	
	function isVehicleExists($trim_id , $exterior_id , $interior_id  ){ //* reg
		return mysql_num_rows(mysql_query("SELECT *  FROM colors INNER JOIN vehicles ON colors.color_id = vehicles.color_id WHERE colors.interior_colors_id ='$interior_id' AND colors.exterior_colors_id='$exterior_id' AND vehicles.trim_id ='$trim_id' GROUP BY colors.color_id"));	
	}
	
	function updateVehicles( $vehicle_id , $title , $sfview , $srview ,$siview , $cfview , $crview ,$ciview ){   //*reg
		return mysql_query("UPDATE vehicles SET  title='$title' , front_small_img='$sfview' , rear_small_img='$srview' , interior_small_img='$siview' , front_big_img='$cfview' , rear_big_img='$crview' ,interior_big_img='$ciview' WHERE vehicle_id='$vehicle_id'");
	}
	
	
	function countVehiclesByID( $vid ){
		$result = mysql_query("SELECT * FROM vehicles WHERE vehicle_id='$vid'");
		return mysql_num_rows($result);
	}
	
	function getVehicleByVehicleID( $vid ){  //*reg
		return mysql_query("SELECT * FROM vehicles WHERE vehicle_id='$vid'");
	}
	
	function getVehicleByTrimId( $tid ){  //*reg
		return mysql_query("SELECT * FROM vehicles WHERE trim_id='$tid'");
	}
	
	
	function countFilteredVehicles($trim_id ,  $exterior_id , $interior_id){
		$result = mysql_query("SELECT *  FROM vehicles INNER JOIN colors ON vehicles.color_id  = colors.color_id WHERE vehicles.trim_id ='$trim_id' AND colors.exterior_colors_id='$exterior_id' AND colors.interior_colors_id='$interior_id' GROUP BY vehicles.vehicle_id");
		return mysql_num_rows($result);
	}
	
	function filteredVehiclesExtInter($trim_id ,  $exterior_id , $interior_id){
		return mysql_query("SELECT *  FROM vehicles INNER JOIN colors ON vehicles.color_id  = colors.color_id WHERE vehicles.trim_id ='$trim_id' AND colors.exterior_colors_id='$exterior_id' AND colors.interior_colors_id='$interior_id' GROUP BY vehicles.vehicle_id");
	} 
	
	function getVehicleColorID($vid){
		$result = mysql_query(" SELECT color_id FROM vehicles WHERE vehicle_id='$vid' ");
		$row = mysql_fetch_object($result);
		return $row->color_id;
	}
	
	function deleteVehicle($vid) {
	  $this->deleteColor($this->getVehicleColorID($vid));
	  $this->deleteCanvesBackground($vid);
      return mysql_query("DELETE FROM vehicles WHERE vehicle_id=".$vid);
    }
	
	
	/*  settings   */
	function getSettings(){
		$dataArr = array();
		$result = mysql_query("SELECT * FROM settings");
		while($row = mysql_fetch_object($result)){
			$dataArr[$row->sid] = $row->val;
		}
		return $dataArr;
	}
	
	
	
	/* Variables */
	function getVariable($var_name ){   //*reg
		return mysql_query("SELECT * FROM variable WHERE name='$var_name'");
	}
	
	function setVariable($var_name , $value ){   //*reg
		return mysql_query("UPDATE variable SET value='$value' WHERE name='$var_name'");
	}
	
	
	/* canves_backgrounds */
	function isVehicleAppliedBackground($vid){  //*reg
		return mysql_num_rows(mysql_query("SELECT * FROM canves_backgrounds WHERE vehicle_id='$vid'"));	
	}
	
	function deleteCanvesBackground($vehicle_id){
		return mysql_query("DELETE FROM canves_backgrounds WHERE vehicle_id=".$vehicle_id);
	}
	
	function getDefaultBackground($bg_id){  //*reg
		return mysql_query("SELECT * FROM backgrounds WHERE background_id ='$bg_id'");
	}
	
	function getDefaultBackgroundVars(){  //*reg
		return mysql_query("SELECT * FROM variable INNER JOIN backgrounds ON variable.value = backgrounds.background_id WHERE variable.name='default_background'");
	}
	
	
	function updateCanvesBackground($vehicle_id , $background_id ){
		 return mysql_query("UPDATE canves_backgrounds SET background_id='$background_id' WHERE vehicle_id='$vehicle_id'");	
	}
	
	function updateCanvesCoordinates($vehicle_id , $coordinates ){ //*reg
		 return mysql_query("UPDATE canves_backgrounds SET coordinates ='$coordinates' WHERE vehicle_id='$vehicle_id'");	
	}
	
	function getCanvesBackground($vehicle_id){  //*reg
		return mysql_query("SELECT * FROM canves_backgrounds INNER JOIN backgrounds ON canves_backgrounds.background_id=backgrounds.background_id WHERE canves_backgrounds.vehicle_id='$vehicle_id' GROUP BY canves_backgrounds.vehicle_id");
	}
	
	function getAppliedBackground($vid ){   //*reg
		$result = mysql_query("SELECT background_id FROM canves_backgrounds WHERE vehicle_id='$vid'");
		$row = mysql_fetch_object($result);
		$bg_id = $row->background_id;
		mysql_query("SELECT * FROM backgrounds WHERE background_id ='$bg_id'");
	}
	
	function insertCanvesBackground( $vehicle_id ){  //*reg
		 $row = mysql_fetch_object($this->getVariable('default_background'));
		 $background_id = $row->value;
		 $row2 = mysql_fetch_object($this->getVariable('default_coordinates'));
		 $coordinates = $row2->value;
		 return mysql_query("INSERT INTO canves_backgrounds VALUES (NULL,'$vehicle_id','$background_id','$coordinates' )");	
	}
	
	
	/*
	*********************************************************************************************************
	Swapper
	*/
	function getPartBySwapper( $cat_id , $vehicle_id ){ // *reg
		return mysql_query("SELECT * FROM parts WHERE part_category_id='$cat_id' AND vehicle_id='$vehicle_id' AND  is_set='N' AND effected='1'");
	}
	
	function getSwapSet( $cat_id , $vehicle_id ){ // *reg
		return mysql_query("SELECT * FROM swapper WHERE category_id='$cat_id' AND vehicle_id='$vehicle_id'");
	}
	
	function isSwapSetExist( $vehicle_id ,$category_id){  //*reg
		return mysql_num_rows(mysql_query("SELECT * FROM swapper WHERE vehicle_id='$vehicle_id' AND category_id='$category_id'"));	
	}
	
	function insertSwapSet( $vehicle_id , $category_id , $swap_value){  //*reg
		 return mysql_query("INSERT INTO swapper VALUES (NULL,'$vehicle_id','$category_id','$swap_value' )");	
	}
	
	function updateSwapSet( $vehicle_id , $category_id , $swap_value ){ //*reg
		 return mysql_query("UPDATE swapper SET swap_text ='$swap_value' WHERE vehicle_id='$vehicle_id' AND category_id='$category_id'");	
	}
	
	function deleteSwapSet( $vehicle_id ,$category_id ){ // *reg
		return mysql_query("DELETE FROM swapper WHERE vehicle_id='$vehicle_id' AND category_id='$category_id'");
	}
	
	
	/*
	********************************************************************************************************
	User Manager
	*/
	
	function isUserExist($uname , $pass){
		return mysql_num_rows(mysql_query("SELECT * FROM users WHERE uname='$uname' AND password='$pass'"));	
	}
	
	function pullDealsSettings($uid){  //*reg
		return mysql_query("SELECT name,street_address,city,state,zip,phone,logo FROM dealers_default_settings WHERE uid='$uid' ");
	}
	
	
	/*
	*******************************************************************************************************
	Views  Worker
	*/
	function getViewsStatistices($trim_id=0){
		$colorCount1 = mysql_query("SELECT COUNT(*) FROM exterior_colors WHERE trim_id='$trim_id'");
		$aArr = mysql_fetch_array($colorCount1);
		$colorCount2 = mysql_query("SELECT COUNT(*) FROM interior_colors WHERE trim_id='$trim_id'");
		$bArr = mysql_fetch_array($colorCount2);
		$done = mysql_query("SELECT COUNT(*) FROM vehicles INNER JOIN colors ON vehicles.color_id=colors.color_id WHERE vehicles.trim_id ='$trim_id'");
		$cArr = mysql_fetch_array($done);
		return $aArr[0] .'#'. $bArr[0] .'#'.$cArr[0];
	}
	
	
	
	
	/*
	******************************************************************************************************
	Easy Worker
	*/
	function getVehicles_easyWorker($trim_id){  //*reg
		return mysql_query("SELECT vehicles.vehicle_id,vehicles.title FROM vehicles
							 INNER JOIN parts ON vehicles.vehicle_id = parts.vehicle_id
							 INNER JOIN wheels ON vehicles.vehicle_id = wheels.vehicle_id  
							 WHERE vehicles.trim_id='$trim_id' GROUP BY vehicles.vehicle_id");
	}
	
	function getVehiclePartsStats_easyWorker( $vehicle_id , $category_id ){ //*reg
		
	}
	
	function getVehicleWheelStats_easyWorker( $vehicle_id ){   //*reg
		
	}
	
	
	
	
}  //$ADONCARS



/*
$obj = new AddOnCars();
$obj->insertPartInDeal( $dealID , 'p' , 45 );
*/

?>