<?php
session_start();

require_once "../../koneksi.php";

$userID = $_SESSION['id'];
$query = "SELECT image FROM user WHERE id='$userID'";
$result = mysqli_query($connect, $query);
$row = mysqli_fetch_assoc($result);
$profilePicture = !empty($row['image']) ? "../../uploaded_img/" . $row['image'] : "../../assets/Default_Profile.png";

// Konfigurasi pagination
$limit = 7; // Jumlah baris per halaman
$page = isset($_GET['page']) ? $_GET['page'] : 1; // Halaman saat ini
$start = ($page - 1) * $limit; // Titik mulai data

// Mengambil data dari database dengan batasan
$result = mysqli_query($connect, "SELECT * FROM user LIMIT $start, $limit");

// Menghitung total data
$total_results = mysqli_query($connect, "SELECT COUNT(*) AS total FROM user");
$total_rows = mysqli_fetch_assoc($total_results)['total'];
$total_pages = ceil($total_rows / $limit); // Menghitung jumlah total halaman
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Pengguna</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="users.css">
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container-fluid d-flex justify-content-center">
                <a class="navbar-brand me-auto" href="../profile/index.php">
                    <img src="<?php echo $profilePicture; ?>" alt="" style="width: 40px; height:40px; border-radius:50%; border: 1px solid grey;" class="profile-picture">
                </a>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item">
                                <a class="nav-link mx-lg-2 " href="../index.php">Beranda</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-2 active" aria-current="page" href="#">Data Pengguna</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-2" href="../buku/index.php">Data Buku</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <form action="../../logout/logout.php" method="post">
                    <button class="login-button">Keluar</button>
                </form>
                <button class="navbar-toggler pe-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
    </header>

    <section class="first-section d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="container-fixed-width">
            <div class="input-box">
                <!-- Tambahkan tombol "Tambah User" di sini -->
                <div class="action-button-bottom d-flex justify-content-start mb-3">
                    <a href="tambah-user.php" class="btn btn-success me-3" type="button">Tambah User</a>
                    <!-- <a href="cetak-data.php" class="btn btn-primary" type="button">Cetak Data</a> -->
                    <a href="cetak-data.php" class="btn btn-primary" type="button">
                        <img src="../../assets/printer.svg" alt="Logo" style="margin-right: 7px; margin-top: 3px;">Cetak Data
                    </a>
                </div>
                <!-- Tabel dan navigasi tetap di sini -->
                <table class="table table-bordered">
                    <thead class="table-primary">
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Nama Lengkap</th>
                            <th scope="col">Alamat</th>
                            <th scope="col">Telepon</th>
                            <th scope="col">Username</th>
                            <th scope="col">Password</th>
                            <th scope="col">Email</th>
                            <th scope="col">Otoritas</th>
                            <th scope="col">Dibuat Pada</th>
                            <th scope="col">Aksi</th>
                        </tr>
                    </thead>
                    <?php
                    $rowNumber = $start + 1;
                    while ($row = mysqli_fetch_array($result)) {
                    ?>
                        <tr>
                            <td><?php echo $rowNumber++ ?></td>
                            <td><?php echo $row['nama_lengkap'] ?></td>
                            <td><?php echo $row['alamat'] ?></td>
                            <td><?php echo $row['telepon'] ?></td>
                            <td><?php echo $row['username'] ?></td>
                            <td><?php echo $row['password'] ?></td>
                            <td><?php echo $row['email'] ?></td>
                            <td><?php echo $row['otoritas'] ?></td>
                            <td><?php echo date('d/m/Y H:i', strtotime($row['created_at'])); ?></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="edit-user.php?id=<?php echo $row['id']; ?>"><button type="button" class="btn btn-warning"><img src="../../assets/pencil.svg" alt=""></button></a>
                                    <a href="hapus-user.php?id=<?php echo $row['id']; ?>"><button type="button" class="btn btn-danger"><img src="../../assets/trash.svg" alt=""></button></a>
                                </div>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </table>
                <!-- Navigasi halaman -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <?php if ($page > 1) : ?>
                            <li class="page-item"><a class="page-link" href="?page=<?php echo $page - 1; ?>">Previous</a></li>
                        <?php endif; ?>
                        <?php for ($i = 1; $i <= $total_pages; $i++) : ?>
                            <li class="page-item <?php if ($i == $page) echo 'active'; ?>"><a class="page-link" href="?page=<?php echo $i; ?>"><?php echo $i; ?></a></li>
                        <?php endfor; ?>
                        <?php if ($page < $total_pages) : ?>
                            <li class="page-item"><a class="page-link" href="?page=<?php echo $page + 1; ?>">Next</a></li>
                        <?php endif; ?>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>

</html>
