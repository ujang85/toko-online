<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "invoice".
 *
 * @property int $id
 * @property int|null $subtotal
 * @property int|null $delivery_fee
 * @property string|null $delivery_address
 * @property int|null $total
 * @property string|null $payment_status
 */
class Invoice extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'invoice';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['subtotal', 'delivery_fee', 'total'], 'integer'],
            [['payment_status'], 'string'],
            [['delivery_address'], 'string', 'max' => 150],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'subtotal' => 'Subtotal',
            'delivery_fee' => 'Delivery Fee',
            'delivery_address' => 'Delivery Address',
            'total' => 'Total',
            'payment_status' => 'Payment Status',
        ];
    }

    /**
     * {@inheritdoc}
     * @return InvoiceQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new InvoiceQuery(get_called_class());
    }
}
