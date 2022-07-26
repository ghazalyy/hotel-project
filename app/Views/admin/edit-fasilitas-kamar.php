<?=$this->extend('admin/dashboard2');?>
<?=$this->section('konten');?>

<h2><?=$JudulHalaman;?></h2>
<?=$introText;?>

<form method="POST" action="<?=site_url('/edit-fasilitas-kamar');?>" enctype="multipart/form-data">

<div class="form-group">
    <label class="font-weight-bold">Nama Fasilitas</label>
    <input type="text" name="txtNamaFasilitas" value="<?=$detailFasilitasKamar['nama_fasilitas'];?>" class="form-control"/>
</div>

<input type="hidden" name="txtIdFasilitasHotel" class="form-control" value="<?=$detailFasilitasKamar['id_fasilitas_kamar'];?>"/>

	<input type="hidden" name="txtFotoFasilitas" class="form-control" value="<?=$detailFasilitasKamar['foto_fasilitas'];?>"/>

<div class="form-group">
    <label class="font-weight-bold">Deskripsi Fasilitas</label>
    <textarea class="form-control" name="txtDeskripsiFasilitas" rows="5"><?=$detailFasilitasKamar['deskripsi_fasilitas'];?>
</textarea>
</div>

<div class="form-group">
    <label class="font-weight-bold">Foto Fasilitas</label>
    <input type="file" name="txtFotoFasilitas" class="form-control"/>
</div>

<div class="form-group">
<!-- <button class="btn btn-warning btn-sm" OnClick="javascipt:history.back()">Batal</button> -->
<a href="javascript:history.back()" class="btn btn-warning btn-sm font-weight-bold">Batal</a>
    <button class="btn btn-primary">edit</button>
    
</div>

</form>
<?=$this->endSection();?>