<?php
include_once("../helper/koneksi.php");
include_once("../helper/function.php");
// script by mpedia.id , email ilmansunannudin2@gmail.com or whatsapp 082298859671 for support.
$count = 0;
$now = strtotime(date("Y-m-d H:i:s"));
$chunk = 100;
$q = mysqli_query($koneksi, "SELECT * FROM pesan WHERE status='MENUNGGU JADWAL' ORDER BY id ASC LIMIT 50 ");
$i = 0;
while ($data = $q->fetch_assoc()) {
    $jadwal = strtotime($data['jadwal']);
    if ($jadwal < $now) {

        $sender = $data['sender'];
        $nomor = $data['nomor'];
        $pesan = utf8_decode($data['pesan']);

        if ($data['media'] == null) {
            $send = sendMSG($nomor, $pesan, $sender);
            if ($send['status'] == "true") {
                $i++;
                $this_id = $data['id'];
                $q3 = mysqli_query($koneksi, "UPDATE pesan SET status = 'TERKIRIM' WHERE id='$this_id'");
            } else {
                $s = false;
            }
            sleep(1);
        }
    }
}
echo 'succes kirim ke' . $i . 'Nomor';
