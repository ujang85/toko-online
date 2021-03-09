<?php

namespace app\controllers;
use yii\rest\Controller;
use yii\filters\auth\QueryParamAuth;

class CartItemRestController extends Controller
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
       $cartitem=\app\models\CartItem::find()->all();
       return [
       			'results'=>$cartitem,
       		  ]; 
    }
}