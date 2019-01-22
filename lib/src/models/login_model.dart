class LoginModel {
  String vid;
  String vemail;
  String idKota;
  Null photo;
  String vwarga;
  String vktp;
  Null vnamapref;
  String vnama1;
  String vnama2;
  String dttl;
  String jenisKelamin;
  String vcodenegara;
  String vphone;
  String valamat;
  String valamatGoogle;
  String pengalaman;
  Null vjabatan;
  Null vperusahaan;
  Null vkemampuan;
  Null vkemampuanid;
  String vposisi;
  Null dworkstart;
  Null dworkend;
  String stillworking;
  Null vlokasi;
  String vgaji;
  Null vsekolah;
  Null vlevel;
  Null vjurusan;
  Null vgpa;
  Null dschstart;
  Null dschend;
  String stillstudy;
  Null vspesialisasi;
  Null vspid;
  Null vfile;
  String dcrea;
  String regfrom;
  String lastlogin;
  String active;
  String activation;
  String vidGroupSpesialisasi;
  String vidSpec1;
  String vidSpec2;
  String infoVacancy;
  String infoNewsletter;
  String profileComplete;
  String vnemSekolah;
  String completedProfile;
  Null activeCv;
  String unexperienced;
  String phone;

  LoginModel.fromJson(Map<String, dynamic> json) {
    vid = json['vid'];
    vemail = json['vemail'];
    idKota = json['id_kota'];
    photo = json['photo'];
    vwarga = json['vwarga'];
    vktp = json['vktp'];
    vnamapref = json['vnamapref'];
    vnama1 = json['vnama1'];
    vnama2 = json['vnama2'];
    dttl = json['dttl'];
    jenisKelamin = json['jenis_kelamin'];
    vcodenegara = json['vcodenegara'];
    vphone = json['vphone'];
    valamat = json['valamat'];
    valamatGoogle = json['valamat_google'];
    pengalaman = json['pengalaman'];
    vjabatan = json['vjabatan'];
    vperusahaan = json['vperusahaan'];
    vkemampuan = json['vkemampuan'];
    vkemampuanid = json['vkemampuanid'];
    vposisi = json['vposisi'];
    dworkstart = json['dworkstart'];
    dworkend = json['dworkend'];
    stillworking = json['stillworking'];
    vlokasi = json['vlokasi'];
    vgaji = json['vgaji'];
    vsekolah = json['vsekolah'];
    vlevel = json['vlevel'];
    vjurusan = json['vjurusan'];
    vgpa = json['vgpa'];
    dschstart = json['dschstart'];
    dschend = json['dschend'];
    stillstudy = json['stillstudy'];
    vspesialisasi = json['vspesialisasi'];
    vspid = json['vspid'];
    vfile = json['vfile'];
    dcrea = json['dcrea'];
    regfrom = json['regfrom'];
    lastlogin = json['lastlogin'];
    active = json['active'];
    activation = json['activation'];
    vidGroupSpesialisasi = json['vid_group_spesialisasi'];
    vidSpec1 = json['vid_spec1'];
    vidSpec2 = json['vid_spec2'];
    infoVacancy = json['info_vacancy'];
    infoNewsletter = json['info_newsletter'];
    profileComplete = json['profile_complete'];
    vnemSekolah = json['vnem_sekolah'];
    completedProfile = json['completed_profile'];
    activeCv = json['active_cv'];
    unexperienced = json['unexperienced'];
    phone = json['phone'];
  }
}