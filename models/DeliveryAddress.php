<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "delivery_address".
 *
 * @property int $id
 * @property string|null $alamat
 * @property string|null $propinsi
 * @property string|null $kabupaten
 * @property string|null $kecamatan
 * @property string|null $kelurahan
 * @property string|null $detail
 */
class DeliveryAddress extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'delivery_address';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['detail'], 'string'],
            [['alamat'], 'string', 'max' => 200],
            [['propinsi', 'kabupaten', 'kecamatan', 'kelurahan'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'alamat' => 'Alamat',
            'propinsi' => 'Propinsi',
            'kabupaten' => 'Kabupaten',
            'kecamatan' => 'Kecamatan',
            'kelurahan' => 'Kelurahan',
            'detail' => 'Detail',
        ];
    }

    /**
     * {@inheritdoc}
     * @return DeliveryAddressQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new DeliveryAddressQuery(get_called_class());
    }
}
