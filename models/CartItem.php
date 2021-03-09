<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cart_item".
 *
 * @property int $id
 * @property string|null $name
 * @property int|null $price
 * @property int|null $qty
 * @property string|null $image_url
 * @property int|null $user
 * @property int|null $product
 */
class CartItem extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cart_item';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['price', 'qty', 'user', 'product'], 'integer'],
            [['name', 'image_url'], 'string', 'max' => 150],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'price' => 'Price',
            'qty' => 'Qty',
            'image_url' => 'Image Url',
            'user' => 'User',
            'product' => 'Product',
        ];
    }

    /**
     * {@inheritdoc}
     * @return CartItemQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CartItemQuery(get_called_class());
    }
}
