<?php


class Zend_Controller_Action_Helper_Templates extends Zend_Controller_Action_Helper_Abstract{
	
	// all email templates will come here...
	
	private $baseUrl;
	
	public function __construct(){
		$this->baseUrl = Zend_Registry::get('publicPath');
	}
	
	
	
	public function sendCreateUserMail( $subject  , $dataObj ){
		
		$varMap  = new Application_Model_Mapper_VariableMapper();
		$roleMap = new Application_Model_Mapper_RoleMapper();
		$templateTxt = $varMap->findByKey('email4newuser')->getVarValue();
		
		$is = 'Yes';
		if($dataObj->getEnabled() == 0){
			$is = 'No';
		}
		
		$output = '<table width="100%" border="0">
		  <tr>
			<td> 
			<br/>
			<br/>
			<div class="welcomeTxt">Welcome to Addoncars , </div>
			<p class="desTxtPara">'.$templateTxt.'</p>
			</td>
		  </tr>
		  <tr>
			<td>
				<div class="emailSubTitle">Acount Details</div>
				<p class="desTxtPara">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username : <b> '.$dataObj->getUserName().' </b><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password : <b> '.$dataObj->getPassword().' </b><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Active   :  '.$is.'
				</p>
			</td>
		  </tr>
		  <tr>
			<td>
				<div class="emailSubTitle">User Role Details:</div>
				 <p class="desTxtPara">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role Title 		 : '.$roleMap->fetchById($dataObj->getRoleId())->getRoleName().'  <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role Description : '.$roleMap->fetchById($dataObj->getRoleId())->getDescription().' <br/>
				</p>
			</td>
		  </tr>
		  <tr>
			<td>
				<div class="emailSubTitle">Login Links:</div>
				<p class="desTxtPara">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://localhost/aoc/public/" class="openlinks"> website link </a>  <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://localhost/aoc/public/admin/" class="openlinks"> Login link </a>
				</p>
			</td>
		  </tr>
		  <tr>
			<td>
				  <p class="desTxtPara">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> From AOA </b> <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Staff
				  </p>
			</td>
		  </tr>
		</table>';
		$this->sendMail( $output , $subject , $dataObj->getEmail() );	
	}
	
	
	public function sendUserTasksMail( $subject , $userId , $flag = 1 ){
		
		$varMap  = new Application_Model_Mapper_VariableMapper();
		$userMap = new Application_Model_Mapper_UserMapper();
		$data    = $userMap->fetchByUid($userId);
		
		
		$templateTxt = '';
		switch($flag){
			case 1:
				$templateTxt = $varMap->findByKey('email4unblockuser')->getVarValue();
				break;
			case 2:
				$templateTxt = $varMap->findByKey('email4blockuser')->getVarValue();
				break;
			case 3:
				$templateTxt = $varMap->findByKey('emailremoveuser')->getVarValue();
				break;
		}
		
		
		$output = '<table width="100%" border="0">
		  <tr>
			<td> 
			<br/>
			<br/>
			<div class="welcomeTxt">Dear Mr-'.$data->getUserName().' , </div>
			<p class="desTxtPara">'.$templateTxt.'</p>
			</td>
		  </tr>
		  <tr>
			<td>
				  <p class="desTxtPara">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> From AOA </b> <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Staff
				  </p>
			</td>
		  </tr>
		</table>';
		$this->sendMail( $output , $subject , $data->getEmail() );	
	}
	
	
	
	
	
	
	
	
	/*
		_ mail workers
	*/
	public function sendMail( $txtBody , $subject , $to ){
		$mail = new Zend_Mail();
		$mail->addTo($to , '');
		$mail->setBodyHtml($this->setEmailBody($txtBody));
		$mail->setFrom('admin@addoncars.com', 'AOC Admin');
        $mail->setSubject($subject);
        $mail->send();
	}
	
	
	public function setEmailBody($emailTxt = ''){
		

		
		$bodyTxt = '
    		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
			<title>Add On Cars</title>
			<style type="text/css">
			body
			{
				font-family:Arial, Helvetica, sans-serif;
				padding:0px;
				margin:0px;
				line-height:normal;
			}
			img { border:none; outline:none;}
			.bg { background-position: center top;background-repeat:no-repeat; }
			.header{ background:url('.$this->baseUrl.'images/top-header-bg.jpg) repeat-x; width:980px; }
			.header .headerMain{ width:374px; height:67px; background:url('.$this->baseUrl.'images/add-on-car-header.jpg) no-repeat; margin:0px auto; text-align:center; }
			.header .headerMainIndex{ width:647px; height:67px; background:url('.$this->baseUrl.'images/header-main.jpg) no-repeat; margin:0px auto; text-align:center; }
			.header .headerMainIndex .logolink{ width:277px; padding:10px 25px 0px 20px; height:50px; }
			.header .headerMainIndex .loginCon{ width:297px; padding:29px 20px 0px 0px; }
			
			.wrapper{ width:980px; margin:0px auto; }
			.wrapper .bodyTagline{ width:516px; height:69px; margin:0px auto 25px auto;  }
			.wrapper .colL{ width:406px; height:207px; padding-top:140px; float:left; }
			.wrapper .colR{ width:453px; height:299px; float:right; background:url('.$this->baseUrl.'images/mani-txt-bg.png) no-repeat; padding:25px 18px 25px 25px; }
			
			.welcomeTxt { color:#4d4848; font-size:20px; font-weight:bold;}
			.emailDate  { color:#4d4848;font-size:11px; font-weight:bold; line-height:30px; text-align:right;}
			.desTxtPara { color:#616161; font-size:12px; text-align:justify;}
			.openlinks   {color:#616161;font-size:12px; line-height:18px;}
			.openlinks a       { color:#09F; text-decoration:none;}
			.openlinks a:hover { color:#09F; text-decoration:underline;}
			.emailSubTitle     { color:#c00000; font-weight:bold; display:block;}
			.accountInfo .userpass {color:#616161;font-size:12px;}
			.instructions {color:#616161;}
			.address {color:#c00000; }
			.points  {font-size:12px;}
			.colorContainer { width:825px;margin:0 auto; }
			.colorContainer .mid { background-color:#FFF; width:899px;}
			.colorContainer .mid .midContainer{ width:825px;margin:0 auto;padding-top:20px;}
			
			.footer{ width:940px; border-top:1px solid #d5d5d5; height:90px; margin:55px auto 0px auto; font-size:10px; color:#5e5d5d; text-align:center; text-transform:uppercase; padding-top:30px;  font-family:Arial, Helvetica, sans-serif; }
			.footer a{ color:#000000; }
			.footer a:hover{ color:#c00000; }
			.center { margin-left:auto; margin-right:auto;}
			
			</style>
			</head>
			<body>
			
			<table border="0" class="bg" background="'.$this->baseUrl.'images/canves-bg.jpg" width="980" align="center">
			<tr>
				<td>
				<div class="header center">
			  <div class="headerMain">
				<div class="logolink Fl"><img src="'.$this->baseUrl.'images/blank.gif" alt="" width="277" height="45" border="0" /></div>
				<div class="clear"></div>
			  </div>
			  <br />
			</div>
			<!--header-->
			<div class="wrapper mar55B">
			
			
				   <table border="0">
						<tr>
							<td style="width:77px;">&nbsp;</td>
							<td>
								 <table border="0" width="825" bgcolor="#FFFFFF">
									<tr>
										<td style="padding:20px;">
											 '.$emailTxt.' <br/>

										</td>
									</tr>
							  </table>
							</td>
							<td style="width:77px;">&nbsp;</td>
						</tr>
				   </table>
				   <br/><br/>
			</div>
			<!--wrapper-->
			<div class="footer"  > Copyright 2010 <span class="black">Add on Cars</span>. All rights Reserved.</div><br />
			  <br />
			<!--footer-->
				</td>
			</tr>
			</table>
			
			</body>
			</html>';
		
		return $bodyTxt; 
	}

	
} //$
