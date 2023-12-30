<?php
    include('condb.php');

    $sql = "SELECT * FROM  cs_user WHERE `u_status` LIKE 'member'"; 
    $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());
?>

<!-------------------------------------------------------------------- LIST -------------------------------------------------------------------->

<table class="table table-hover">
    <thead>
        <tr class="table table-active" align="center">
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
            <th>E-mail</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <?php foreach($result as $row) { ?>
        <tr align="center">
            <td><?php echo $row['u_id']; ?></td>
            <td><?php echo $row['u_user']; ?></td>
            <td><?php echo $row['u_pass']; ?></td>
            <td><?php echo $row['u_email']; ?></td>
            <td><a href="update_member.php?u_id=<?php echo $row['u_id'];?>" data-bs-toggle="modal" data-bs-target="#update<?php echo $row['u_id'];?>"><img src="img/logo/edit.png" width="18"></a></td>
            <td><a href="delete_member.php?u_id=<?php echo $row['u_id'];?>" data-bs-toggle="modal" data-bs-target="#delete<?php echo $row['u_id'];?>"><img src="img/logo/delete.png" width="20"></a></td>
        </tr>

    <!------------------------------------------------------------------ UPDATE ------------------------------------------------------------------>
        
        <div class="modal fade" id="update<?php echo $row['u_id'];?>" tabindex="-1" aria-labelledby="update<?php echo $row['u_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update<?php echo $row['u_id'];?>">Edit Member</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal was-validated" name="update" id="update" method="post" action="update_member.php">
                            <div class="form-floating mb-2">
                                <input type="text" class="form-control is-valid" name="u_user" id="u_user" placeholder="Username" value="<?php echo $row['u_user'];?>" required>
                                <label for="u_user">Username</label>
                                <input class="form-control" type="hidden" name="u_id" id="u_id" value="<?php echo $row['u_id'];?>">
                            </div>
                            <div class="form-floating mb-2">
                                <input type="password" class="form-control is-invalid" name="u_pass1" id="u_pass1" placeholder="Password" required>
                                <label for="u_pass1">Password</label>
                            </div>
                            <div class="form-floating mb-2">
                                <input type="password" class="form-control is-invalid" name="u_pass2" id="u_pass2" placeholder="Confirm Password" required>
                                <label for="u_pass2">Confirm Password</label>
                            </div>
                            <div class="form-floating">
                                <input type="email" class="form-control is-valid" name="u_email" id="u_email" placeholder="E-mail" value="<?php echo $row['u_email'];?>" required>
                                <label for="u_email">E-mail</label>
                            </div>
                    </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>
                        </form>
                </div>
            </div>
        </div>

    <!------------------------------------------------------------------ DELETE ------------------------------------------------------------------>
        
        <div class="modal fade" id="delete<?php echo $row['u_id'];?>" tabindex="-1" aria-labelledby="delete<?php echo $row['u_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="delete<?php echo $row['u_id'];?>">Delete Member</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Confirm to delete Member <b><?php echo $row['u_user'];?></b> ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a href="delete_member.php?u_id=<?php echo $row['u_id'];?>" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</table>