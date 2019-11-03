	<!-- Start home -->
	<div id="home">
		<!-- Start navigation -->
		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
			<a class="navbar-brand" href="http://localhost:8015/Template%20ecommerce/"><img src="logo1.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav mx-auto">
					
        <?php
            if(isset($_SESSION['user'])){
              $image = (!empty($user['photo'])) ? 'images/'.$user['photo'] : 'images/profile.jpg';
              echo '
                <li class="dropdown user user-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <img src="'.$image.'" class="user-image" alt="User Image">
                    <span class="hidden-xs">'.$user['firstname'].' '.$user['lastname'].'</span>
                  </a>
                  <ul class="dropdown-menu">
                    <!-- User image -->
                    <li class="user-header">
                      <img src="'.$image.'" class="img-circle" alt="User Image">

                      <p>
                        '.$user['firstname'].' '.$user['lastname'].'
                        <small>Member since '.date('M. Y', strtotime($user['created_on'])).'</small>
                      </p>
                    </li>
                    <li class="user-footer">
                      <div class="pull-left">
                        <a href="profile.php" class="btn btn-default btn-flat">Profile</a>
                      </div>
                      <div class="pull-right">
                        <a href="logout.php" class="btn btn-default btn-flat">Sign out</a>
                      </div>
                    </li>
                  </ul>
                </li>
              ';
            }
            else{
              echo "
                <li><a href='login.php'>LOGIN</a></li>
                <li><a href='signup.php'>SIGNUP</a></li>
              ";
            }
          ?>
					<li class="nav-item">
						<a class="nav-link scroll" href="#home" style="padding-left:300px;">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link scroll" href="#recomended">Recomended</a>
					</li>
					<li class="nav-item">
						<a class="nav-link scroll" href="#glasses">Glasses</a>
					</li>
					<li class="nav-item">
						<a class="nav-link scroll" href="#sunglasses">Sunglasses</a>
					</li>
					<li class="nav-item">
						<a class="nav-link scroll" href="#contact">Contact</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" style="padding-left : 400px;" href="cart_view.php"><i class="fas fa-shopping-cart"></i> cart</a>
					</li>
				</ul>

        </ul>
      </div>
    </div>
  </nav>
</header>