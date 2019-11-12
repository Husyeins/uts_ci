<?php

class Mcrud extends CI_Model {

	public function retrieve()
	{
		$this->db->select('id,nim,nama_mahasiswa,prodi,jk,alamat,hp');
		$this->db->from("lihat_db");
		$q = $this->db->get();
		if ($q->num_rows()>0) {
			$hasil = $q->result_array();
		}else{
			$hasil = array();
		}
		$q->free_result();

		return $hasil;
	}

	public function retrieve2()
	{
		$this->db->select('id,nim,hp_lama,hp_baru,tgl_ubah');
		$this->db->from("tbl_ubah_hp");
		$q = $this->db->get();
		if ($q->num_rows()>0) {
			$hasil = $q->result_array();
		}else{
			$hasil = array();
		}
		$q->free_result();

		return $hasil;
	}

	public function simpan_data($data)
	{
		$q = $this->db->insert('data_mhs', $data);
		if ($q) {
			redirect('c_crud/tampil');
		}else{
			redirect('c_crud/tambah');
		}
	}

	public function getRow($id)
	{
		$q = $this->db->where('id', $id)->get('data_mhs');
		return $q;
	}

	public function update_data()
	{
		$id = $this->input->post('id');
		$data = array(
			'nim' => $this->input->post('nim'),
			'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
			'prodi' => $this->input->post('prodi'),
 			'jk' => $this->input->post('jk'),
 			'alamat' => $this->input->post('alamat'),
 			'hp' => $this->input->post('hp')
 			
 		);	
		
		$q = $this->db->where('id', $id)->update('data_mhs', $data);
		if ($q) {
			redirect('c_crud/tampil');
		}else{
			redirect('c_crud/ubah');
			echo "hal tersimpan";
		}
	}


	public function hapus_data()
	{
		$id = $this->uri->segment(3);
		$q = $this->db->where('id', $id)->delete('data_mhs');
		if ($q) {
			redirect('c_crud/tampil');
		}
	}	
}