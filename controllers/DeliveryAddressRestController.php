<?php

namespace app\controllers;
use yii\rest\Controller;
use yii\filters\auth\QueryParamAuth;

class DeliveryAddressRestController extends Controller
{
	protected function verbs()
    {
       return [
           'index' => ['GET','POST'],
       ];
    }
    public function behaviors(){
      $behaviors = parent::behaviors();
      $behaviors['authenticator'] = [
        'class' => QueryParamAuth::className(),
      ];
      return $behaviors;
    }
	public function actionIndex()
    {    
       $deliveryaddress=\app\models\DeliveryAddress::find()->all();
       return [
       			'results'=>$deliveryaddress,
       		  ]; 
    }
}