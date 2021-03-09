<?php

namespace app\controllers;
use yii\rest\Controller;

class InvoiceRestController extends Controller
{
	public function actionIndex()
    {    
       $invoice=\app\models\Invoice::find()->all();
       return [
       			'results'=>$invoice,
       		  ]; 
    }
}