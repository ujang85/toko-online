<?php

namespace app\controllers;
use yii\rest\Controller;
use yii\filters\auth\QueryParamAuth;

class TagRestController extends Controller
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
       $tag=\app\models\Tag::find()->all();
       return [
       			'results'=>$tag,
       		  ]; 
    }
}