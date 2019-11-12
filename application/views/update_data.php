<!doctype html>
<html lang="en">
<head>
	<base href="<?=base_url()?>">
	<meta charset="UTF-8">
</head>

  <div class="content-wrapper">
    <section class="content-header">
    	<h1>
			Data Tables
			<small>advanced tables</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Tables</a></li>
			<li class="active">Data tables</li>
		</ol>
	</section>
      <?php echo "<h3>".$judul."</h3>"; ?>

<form method="post" action="<?php echo base_url('c_crud/update')?>" enctype="multipart/form-data">
<table>
	<input type="hidden" name="id" value="<?php echo $id ?>">
		<tr>
	<td>nim</td>
	<td>:</td>
	<td><input type="text" name="nim" value="<?php echo $nim ?>"></td>
		</tr>

		<tr>
	<td>nama</td>
	<td>:</td>
	<td><input type="text" name="nama_mahasiswa" value="<?php echo $nama_mahasiswa ?>"></td>
		</tr>

		<tr>
	<td>prodi</td>
	<td>:</td>
	<td><input type="text" name="prodi" value="<?php echo $prodi ?>"></td>
		</tr>

	<tr>
	<td>Jenis Kelamin</td>
	<td>:</td>
	<td>
		<input type="radio" name="jk" id="L" value="Laki-Laki" <?php echo $jk; ?> checked> Laki-Laki
		<input type="radio" name="jk" id="P" value="Perempuan" <?php echo $jk; ?>> Perempuan
		</td>

	</tr>

		<tr>
	<td>Alamat</td>
	<td>:</td> 
	<td><input type="text" name="alamat" value="<?php echo $alamat ?>"></td>
		</tr>
	
		

		<tr>
	<td>nomer HP</td>
	<td>:</td> 
	<td><input type="text" name="hp" value="<?php echo $hp ?>"></td>
		</tr>

		<tr>
			<td>
				<input type="submit" name="simpan" value="Update">
				<a href="<?php echo base_url()."c_crud/tampil";?>"><input type="button" value="Batal"></a>
			</td>
		</tr>
	</table>
</form>
    </section>
    <section class="content container-fluid">
    </section>
  </div>
