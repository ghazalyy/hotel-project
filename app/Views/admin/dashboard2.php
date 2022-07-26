
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Hotel </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/dashboard/">

    

    <!-- Bootstrap core CSS -->
<link href="<?=base_url('/bootstrap/css/bootstrap.min.css');?>" rel="stylesheet" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
        body {
  font-size: .875rem;
}

.feather {
  width: 16px;
  height: 16px;
  vertical-align: text-bottom;
}

/*
 * Sidebar
 */

.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 5rem;
  }
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: .5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

@supports ((position: -webkit-sticky) or (position: sticky)) {
  .sidebar-sticky {
    position: -webkit-sticky;
    position: sticky;
  }
}

.sidebar .nav-link {
  font-weight: 500;
  color: #333;
}

.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #999;
}

.sidebar .nav-link.active {
  color: #007bff;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: inherit;
}

.sidebar-heading {
  font-size: .75rem;
  text-transform: uppercase;
}

/*
 * Navbar
 */

.navbar-brand {
  padding-top: .75rem;
  padding-bottom: .75rem;
  font-size: 1rem;
  background-color: rgba(0, 0, 0, .25);
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
}

.navbar .navbar-toggler {
  top: .25rem;
  right: 1rem;
}

.navbar .form-control {
  padding: .75rem 1rem;
  border-width: 0;
  border-radius: 0;
}

.form-control-dark {
  color: #fff;
  background-color: rgba(255, 255, 255, .1);
  border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
  border-color: transparent;
  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
  </head>
  <body>
    
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3 d-md-block bg-dark" href="#">HOTEL ABAS</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="<?=site_url('/logout');?>">LogOut</a>
    </li>
  </ul>
</nav>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-warning sidebar collapse">
      <div class="sidebar-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="<?=site_url('/dashboard');?>">
              <span data-feather="home"></span>
              Home <span class="sr-only">(current)</span>
            </a>
          </li>
          <!-- DASHBOARD ADMIN -->
            <?php
            if(session()->get('level')=='admin'){
            ?>
          <li class="nav-item text-nowrap">
            <a class="nav-link" href="<?=site_url('/tampil-fasilitas-hotel');?>">
            <span data-feather="layout"></span>
              Fasilitas Hotel
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=site_url('/tampil-fasilitas-kamar');?>">
            <span data-feather="inbox"></span>
              Fasilitas Kamar
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=site_url('/tampil-kamar');?>">
              <span data-feather="file-text"></span>
              Data Kamar
            </a>
          </li>

<!-- DASHBOARD PETUGAS -->
        <?php }  
            if(session()->get('level')=='petugas') {
        ?>

          <li class="nav-item">
            <a class="nav-link" href="<?=site_url('/tampil-reservasi');?>">
              <span data-feather="bar-chart-2"></span>
              Data Reservasi
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=site_url('/cek-kamar');?>">
              <span data-feather="layers"></span>
              Cek Kamar
            </a>
          </li>
          <?php } ?>
        </ul>   
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
        <?php
          if(!isset($JudulHalaman)){ ?>

          <div class="dashboard">
            <h1>Selamat Datang</h1>
            <p class="lead">Halaman ini adalah halaman pengelolaan aplikasi reservasi Hotel ABAS</p>
          </div>
        <?php } else {
          echo $this->renderSection('konten');
        }
        ?>
    </main>
  </div>
</div>


    <script src="<?=base_url('/bootstrap/js/jquery.slim.min.js');?>" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="<?=base_url('/bootstrap/js/bootstrap.bundle.min.js');?>" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

      
        <script src="<?=base_url('/bootstrap/js/feather.min.js');?>"></script>
        <script src="<?=base_url('/bootstrap/js/dashboard.js');?>"></script>
  </body>
</html>
