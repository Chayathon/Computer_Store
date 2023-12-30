<?php
    include('condb.php');

    $sql = "SELECT * FROM  cs_type ORDER BY t_id ASC"; 
    $result = mysqli_query($con,$sql) or die ("Error in query: $sql ".mysqli_error());
?>

<!-------------------------------------------------------------------- LIST -------------------------------------------------------------------->

<table class="table table-hover">
    <thead>
        <tr class="table table-active" align="center">
            <th>ID</th>
            <th>Name</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <?php foreach($result as $row) { ?>
        <tr align="center">
            <td><?php echo $row['t_id']; ?></td>
            <td><?php echo $row['t_name']; ?></td>
            <td><a href="update_type.php?t_id=<?php echo $row['t_id'];?>" data-bs-toggle="modal" data-bs-target="#update<?php echo $row['t_id'];?>"><img src="img/logo/edit.png" width="18"></a></td>
            <td><a href="delete_type.php?t_id=<?php echo $row['t_id'];?>" data-bs-toggle="modal" data-bs-target="#delete<?php echo $row['t_id'];?>"><img src="img/logo/delete.png" width="20"></a></td>
        </tr>

    <!------------------------------------------------------------------ UPDATE ------------------------------------------------------------------>
        
        <div class="modal fade" id="update<?php echo $row['t_id'];?>" tabindex="-1" aria-labelledby="update<?php echo $row['t_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update<?php echo $row['t_id'];?>">Edit Type</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal was-validated" name="update" id="update" method="post" action="update_type.php">
                            <div class="form-floating">
                                <input class="form-control is-valid" type="text" name="t_name" id="t_name" placeholder="Name" value="<?php echo $row['t_name'];?>" required>
                                <label for="t_name">Name</label>
                                <input class="form-control" type="hidden" name="t_id" id="t_id" value="<?php echo $row['t_id'];?>">
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
        
        <div class="modal fade" id="delete<?php echo $row['t_id'];?>" tabindex="-1" aria-labelledby="delete<?php echo $row['t_id'];?>" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="delete<?php echo $row['t_id'];?>">Delete Type</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Confirm to delete Type <b><?php echo $row['t_name'];?></b> ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a href="delete_type.php?t_id=<?php echo $row['t_id'];?>" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
</table>