<?php 
session_start();
if (!isset($_SESSION['user_id'])){
    header('location: index.php');
}

require_once __DIR__ . '/vendor/vendor/autoload.php';
include_once("function/helper.php");
include_once("function/koneksi.php");
include_once 'function/function.php';

$masuk = query("SELECT * FROM `kendaraan` INNER JOIN  jeniskendaraan ON kendaraan.jenis_id = jeniskendaraan.jenis_id WHERE keterangan = 'Keluar' ORDER BY keterangan ASC");

$mpdf= new \Mpdf\Mpdf();
$html= '<!DOCTYPE html>
	<html>
<head>
	<title>Laporan Kendaraan Keluar</title>
	<link rel="stylesheet" href="css/print.css"
</head>
<body>
	<h1>Laporan Kendaraan Keluar</h1>
	<table border="1" cellpadding="5" cellspacing="0">

	tr>
		<th>No</th>
		<th>Jenis Kendaraan</th>
		<th>Nomor Polisi</th>
		<th>Waktu Masuk</th>
		<th>Waktu keluar</th>
		<th>Harga</th>
		<th>Status</th>
	</tr> ';
	$i= 1;

foreach($masuk as $msk){
$html .= '<tr>
		<td>'. $i++.'</td>
		<td>'.$msk["jeniskendaraan"].'</td>
		<td>'.$msk["nomor_polisi"].'</td>
		<td>'.$msk["waktu_masuk"].'</td>
		<td>'.$msk["waktu_keluar"].'</td>
		<td>'.$msk["harga"].'</td>
		<td>'.$msk["keterangan"].'</td>
			</tr>';
}


$html.='</table>
</body>
</html>';

$mpdf->WriteHTML($html);
$mpdf->Output('laporan.pdf',\Mpdf\Output\Destination::INLINE);
//bisa di singkat jengan I prevew atau D download
?>