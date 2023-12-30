<!DOCTYPE html>
<html lang="en">
<head>
    <?php
        SESSION_START();
        include("h_member.php");
    ?>
</head>
<body>
    <?php
        include("condb.php");
        $ID = $_SESSION['ID'];
        @$a_id = $_SESSION['a_id'];

        $sql = "SELECT * FROM cs_address AS a INNER JOIN cs_user AS u ON a.u_id = u.u_id WHERE a.u_id = '$ID' ORDER BY a_id ASC";
        $result = mysqli_query($con, $sql) or die ("Error in query: $sql ".mysqli_error());

        $sql_user = "SELECT * FROM cs_user WHERE u_id = '$ID'";
        $result_user = mysqli_query($con, $sql_user) or die ("Error in query: $sql ".mysqli_error());

        $sql_address = "SELECT * FROM cs_address WHERE a_id = '$a_id'"; 
        $result_address = mysqli_query($con, $sql_address) or die ("Error in query: $sql_address ".mysqli_error());
    ?>
    <?php include("navbar_member.php"); ?>
    <p></p>
    <div class="container-fluid">
        <div class="row">
            <div class="center">
                <center>
                    <div class="col-md-6">
                        <div class="shadow-lg p-3 mb-5 bg-body rounded">
                            <form class="row g-1 was-validated" name="address" id="address" method="post" action="address_db">
                                <h3>Address</h3>
                                <p></p>
                                <p align="left">
                                    <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#saved_address" aria-expanded="false" aria-controls="saved_address">
                                        Saved Address
                                    </button>

                                    <div class="collapse" id="saved_address">
                                        <div class="card card-body">
                                            <?php foreach ($result as $results) { ?>
                                                <table>
                                                    <tr>
                                                        <th width="92%">- <?php echo $results['a_name']; ?>,&nbsp;<?php echo $results['a_phone']; ?>,&nbsp;<?php echo $results['a_sub']; ?>,&nbsp;<?php echo $results['a_district']; ?>,&nbsp;<?php echo $results['a_province']; ?>,&nbsp;<?php echo $results['a_zip']; ?></th>
                                                        <td width="4%" align="right"><a data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" href="address_edit?a_id=<?php echo $results['a_id'];?>"><img src="img/logo/edit.png" width="18"></a></td>
                                                        <td width="4%" align="right"><a data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" href="address_del?a_id=<?php echo $results['a_id'];?>"><img src="img/logo/delete.png" width="20"></a></td>
                                                    </tr>
                                                </table>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </p>
                                <?php if(isset($_SESSION['success'])) { ?>
                                    <div class="alert alert-success d-flex align-items-center" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                        <div>
                                            <?php
                                                echo $_SESSION['success'];
                                                unset($_SESSION['success']);
                                            ?>
                                        </div>
                                    </div>
                                <?php } ?>
                                    <div class="col-md-6 form-floating">
                                        <input type="text" class="form-control is-invalid"  name="a_name" id="a_name" placeholder="Recipient Name" value="<?php if(isset($_COOKIE['name'])) { echo $_COOKIE['name']; } ?>" required>
                                        <label for="a_name">Recipient Name</label>
                                        <?php foreach($result_user as $row) { ?><input class="form-control" type="hidden" name="u_id" id="u_id" value="<?php echo $row['u_id'];?>"><?php } ?>
                                        <?php foreach($result_address as $row) { ?><input class="form-control" type="hidden" name="a_id" id="a_id" value="<?php echo $row['a_id'];?>"><?php } ?>
                                    </div>
                                    <div class="col-md-6 form-floating mb-2">
                                        <input type="text" class="form-control is-invalid" name="a_phone" id="a_phone" placeholder="Phone Number" value="<?php if(isset($_COOKIE['phone'])) { echo $_COOKIE['phone']; } ?>" required>
                                        <label for="a_phone">Phone Number</label>
                                    </div>
                                    <div class="col-md-12 form-floating mb-2">
                                        <textarea class="form-control is-invalid" name="a_sub" id="a_sub" placeholder="Address" required><?php if(isset($_COOKIE['address'])) { echo $_COOKIE['address']; } ?></textarea>
                                        <label for="a_sub">Address</label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">
                                        <input type="text" class="form-control is-invalid" name="a_district" id="a_district" placeholder="District" value="<?php if(isset($_COOKIE['district'])) { echo $_COOKIE['district']; } ?>" required>
                                        <label for="a_district">District</label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">
                                        <input type="text" class="form-control is-invalid" name="a_province" id="a_province" placeholder="Province" value="<?php if(isset($_COOKIE['province'])) { echo $_COOKIE['province']; } ?>" required>
                                        <label for="a_province">Province</label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">
                                        <input type="text" class="form-control is-invalid" name="a_zip" id="a_zip" placeholder="ZIP code" value="<?php if(isset($_COOKIE['zip'])) { echo $_COOKIE['zip']; } ?>" required>
                                        <label for="a_zip">ZIP code</label>
                                    </div>
                                    <div class="d-grid gap-2 col-6 mx-auto">
                                        <button class="btn btn-warning" type="submit" name="edit" <?php if(empty($_COOKIE['address'])) { ?> disabled <?php } ?>>Edit Address</button>
                                    </div>
                                    <div class="d-grid gap-2 col-6 mx-auto">
                                        <button class="btn btn-success" type="submit" name="save"<?php if(!empty($_COOKIE['address'])) { ?> disabled <?php } ?>>Save Address</button>
                                    </div>
                            </form>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </div>

    <script>
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    </script>
</body>
</html>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>