<?php

class C_crud extends CI_Controller {
	public function __construct()

	{
		parent::__construct();
		$this->load->model('mcrud');
		$this->load->helper('url');
		$this->load->helper('form');
	}

	public function index()
	{
		redirect('c_crud/tampil');
	}

	public function tampil()
	{
		$data = array(
			'isi' => $this->mcrud->retrieve(),
		); 
		$this->load->view('template/header');
		$this->load->view('template/sidebar');
		$this->load->view('tampil_data', $data);
		$this->load->view('template/footer');
	}	

	public function tampil2()
	{
		$data = array(
			'isi' => $this->mcrud->retrieve2(),
		);
		$this->load->view('template/header');
		$this->load->view('template/sidebar'); 
		$this->load->view('tampil_log', $data);
		$this->load->view('template/footer');
	}	

	public function tambah()
	{
		$data = array('judul' => 'Tambah Data');
		$this->load->view('template/header');
		$this->load->view('template/sidebar');
		$this->load->view('tambah_data', $data);
		$this->load->view('template/footer');
	}

	public function simpan()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('nama_mahasiswa','required|alpha');
		$this->form_validation->set_rules('hp','nomer','required|numeric');
		if ($this->form_validation->run()==false) 
		{
			$data = array('judul' => 'Tambah Data');
			$this->load->view('tambah_data', $data);
		}else{
				echo "hal tersimpan";

			$data = array(
				'id' => '',
				'nim' => $this->input->post('nim'),
				'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
				'prodi' => $this->input->post('prodi'),
				'jk' => $this->input->post('jk'),
				'alamat' => $this->input->post('alamat'),
				'hp' => $this->input->post('hp')
				
			);
			$this->mcrud->simpan_data($data);
		}
}

	public function ubah()
	{ 

		$id = $this->uri->segment(3);
	    $q = $this->mcrud->getRow($id);
	    $data = array( 
	    	'judul' => 'Ubah Data',
	    	 'id' 	=> $q->row('id'),
	    	 'nim' => $q->row('nim'),
	    	 'prodi' => $q->row('prodi'),
	    	 'nama_mahasiswa' => $q->row('nama_mahasiswa'),
	    	 'jk' => $q->row('jk'),
	    	 'alamat' => $q->row('alamat'),
	    	 'hp' => $q->row('hp')
	    	); 
	
	$this->load->view('template/header');
	$this->load->view('template/sidebar');
    $this->load->view('update_data', $data);  
    $this->load->view('template/footer');   
   } 

 	public function update()
 	{     
 		$this->mcrud->update_data();
 	} 

 	public function view()
	{
		$id= $this->uri->segment(3);
		

	}
 
    public function hapus()
    {     
    	$this->mcrud->hapus_data();
   	} 
}
