<?php
// require 'action.php';
include_once("../../function/helper.php");
include_once("../../function/koneksi.php");
function query($query){
	global $koneksi;
	$result= mysqli_query($koneksi, $query);
	$rows=[];
	while ($row = mysqli_fetch_assoc($result)) {
		$rows[]= $row;
	}
	return $rows;
}
	
	// ambil id dari url
	$id = $_GET["id"];
	$bayar = $_GET["bayar"];
	$waktu_keluar = $_GET["waktu"];
	
	// fungsi keluar
	global $id,$bayar,$kode_bayar,$koneksi;
	
	$waktu = mysqli_query($koneksi, "SELECT waktu_masuk FROM kendaraan WHERE id_parkir = $id");
	$waktu_masuk = mysqli_fetch_assoc($waktu);
	$keterangan = "Keluar";
	$rumus = ceil(((strtotime($waktu_keluar) - strtotime($waktu_masuk['waktu_masuk']))/3600)) ;
	$harga = $rumus * $bayar;
	$query = "UPDATE kendaraan SET waktu_keluar = '$waktu_keluar', harga='$harga', keterangan= '$keterangan' WHERE id_parkir = $id";
		mysqli_query($koneksi, $query);
	// header(BASE_URL.'laporan.php')
	include_once ('bayarkeluar.php');
	// echo "<h1>".$harga."</h1>"
// $alert = query("SELECT harga FROM kendaraan WHERE kendaraan_id=$id");
// $knd = query("SELECT * FROM `kendaraan` INNER JOIN  jeniskendaraan ON kendaraan.jenis_id = jeniskendaraan.jenis_id WHERE kendaraan_id = $id")[0];
?>