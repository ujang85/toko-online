1.Deskripsi tentang penyebab adanya ulasan-ulasan buruk yang terjadi selama even promo 12.12 adalah sbb:
    a) Pelanggan memasukkan produk ke keranjang belanja,tetapi setelah melakukan checkout,pesanan/order dibatalkan sepihak oleh pihak toko.
    b) Pembatalan sepihak oleh pihak toko terjadi karena adanya kesalahan laporan jumlah stok produk yang ditawarkan.
    c) Karena adanya pembatalan sepihak kepada pelanggan oleh pihak toko,maka menyebabkan rasa kecewa dari pelanggan.
	
2.Untuk mencegah kejadian ini lagi,maka perlu dibuat sistem pelaporan jumlah stok yg up to date.dan juga adanya sistem validasi pada saat transaksi di toko online.
 

Proof of Concept

    a) guest melihat daftar produk
    b) guest mendaftar dan masuk
    c) customer melihat daftar, nama & harga produk serta memfilter berdasarkan kategori,tags
    d) customer memasukan item ke keranjang belanja
    e) customer mengubah jumlah pesanan per produk
    f) customer melihat total harga di keranjang belanja sebelum checkout dan mendapatkan perkiraan yang akan dibayar
    g) customer melihat invoice,bisa melakukan pembayaran
    h) customer melihat riwayat pesanan,bisa melihat detail pesanan dan statusnya
    i) customer mengelola alamat pengiriman,bisa menambahkan lebih dari satu alamat pengiriman

Sehingga sekarang kita mendapatkan daftar entitas berikut:

    a) user
    b) product
    c) category
    d) tag
    e) delivery address
    f) order
    g) invoice
    h) order item
    i) cart item

Dari daftar entitas di atas dan user stories,dibuat entity relationship
diagram nya. Seperti ini:






















Atribut Tiap-tiap Entitas:


a. Entitas : DeliveryAddress
atribut
tipe
deskripsi
id
int
Id sbg PK
provinsi
string
cukup jelas
nama
string
cukup jelas
kabupaten
string
cukup jelas
kecamatan
string
cukup jelas
kelurahan
string
cukup jelas
detail
string
detail tentang alamat, misalnya dekat indomart dll


b. Entitas : OrderItem
atribut
tipe
deskripsi
id
int
Id sbg PK
name
string
nama item, diambil dari produk saat order dibuat
price
int
harga item, diambil dari produk saat order dibuat
qty
int
jumlah item yang diorder
product
string
mereferensikan entitas Product terkait
order
string
mereferensikan entitas Order terkait


c. Entitas : Order
atribut
tipe
deskripsi
status
enum
status dari pesanan, berisi enumeration OrderStatus yaitu waiting payment,
OrderStatus processing, in_delivery, delivered



d. Entitas : CartItem
atribut
tipe
deskripsi
id
int
Id sbg PK
name
string
nama item, diambil dari produk saat user menambahkan produk
price
int
harga item, diambil dari produk saat user menambahkan produk
qty
int
jumlah item yang diorder
image_url
string
image url dari produk
user
User
mereferensikan entitas User pemilik cart item
product
Product
mereferensikan entitas Product terkait




e. Entitas : product
atribut
tipe
deskripsi
id
int
Id sbg PK
name
string
nama produk
description
string
deskripsi produk
price
int
harga produk
image_url
string
string yang digunakan untuk menyimpan nama image produk
category
string
mererensikan entitas Category untuk produk
tag
string
mereferensikan entitas Tag untuk produk, bisa lebih dari satu


f. Entitas : tag
atribut
tipe
deskripsi
id
int
Id sbg PK
name
string
nama tags


g. Entitas : Category
atribut
tipe
deskripsi
id
int
Id sbg PK
name
string
nama kategory



API endpoints design.

Product 		GET /products/ dapatkan daftar produk
			POST /products buat produk baru
			PUT /products/:id update produk berdasarkan parameter id
			DELETE /products/:id hapus produk berdasarkan parameter id

Category		GET /categories dapatkan daftar kategori
			POST /categories buat kategori baru
			PUT /categories/:id update kategori berdasarkan parameter id
			DELETE /categories/:id hapus kategori berdasarkan parameter id
Tag			GET /tags dapatkan daftar tag
			POST /tags buat tag baru
			PUT /tags/:id update tag berdasarkan parameter id
			DELETE /tags/:id hapus tag berdasarkan parameter id
		
DeliveryAddress	GET /delivery-addresses dapatkan daftar alamat pengiriman user
			POST /delivery-addresses buat alamat pengiriman baru
			PUT /delivery- update alamat pengiriman berdasarkan
				addresses/:id parameter id
			DELETE /delivery- hapus alamat pengiriman berdasarkan
				address/:id parameter id

Order			GET /orders dapatkan daftar order milik user
			POST /orders buat order baru

CartItem		GET /carts	dapatkan daftar items di keranjang belanja dari
					user
			PUT /carts	update items di keranjang belanja user
