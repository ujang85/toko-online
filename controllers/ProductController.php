<?php
namespace app\controllers;
use Yii;
use app\models\Product;
use yii\filters\auth\QueryParamAuth;
 
class ProductController extends \yii\rest\Controller
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
    public function actionIndex(){
        $products = Product::find()->all();
        return [
            'data'=>$products,
        ];
    }
}