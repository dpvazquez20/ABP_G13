<?php 

    include '../models/tracing_model.php';
    include '../views/tracing_default.php';
    include '../views/tracing_add.php';
    include '../views/tracing_modify.php';
    include '../views/tracing_consult.php';
    include '../languages/spanish.php';
    include '../views/log_in.php';
    session_start();

	// getting form's data
	function get_data_form()
    {

		$id = '';
		if(isset($_REQUEST['id']))
		{
			$id = $_REQUEST['id'];
			//unset($_REQUEST['id']);
		}

		$tracing = new TracingModel($id);

		return $tracing;
	}

	function get_data_form_sportsman()
    {

		$id = '';
		if(isset($_SESSION['userId']))
		{
			$id = $_SESSION['userId'];
		}

		$tracing = new TracingModel($id);

		return $tracing;
	}

	// checking that user is logged
	if(isset($_SESSION['userType']))
	{

		// checking that user has permissions
		if($_SESSION['userType'] == $strings['coach'])
	    {

			if (isset($_REQUEST['action']))
			{
				$action = $_REQUEST['action'];
			}else {
				$action = '';
			}

			Switch ($action)
            {
				// selected see user's details
				case $strings['Follow']:

					// looking for form's data
					if (isset($_REQUEST['id'])) // if we have form's data, we insert it
					{
						$tracing = get_data_form(); // getting data
						$data1 = $tracing ->headCoach();
						$data2 = $tracing ->follow();
						new TracingConsult($data1, $data2,true);   
					
					}else { // if not, the view is called
						$tracing = get_data_form(); // getting data
						$data = $tracing->toListSportsmans(); // trying consult
						new TracingDefault($data,''); // showing user data 
					}

					break;

                // selected something to find
                case $strings['Search']:

                    // looking for data
                    if (isset($_REQUEST['searchfield']))
                    {
                        $tracing = get_data_form(); // getting data
                        $reply = $tracing->searchSportsman($_REQUEST['searchfield']); // getting reply
                        unset($_REQUEST['searchfield']);

                        if (is_string($reply))
                        {
                            $data = $user->toList(); // getting users list
                            new TracingDefault($data, $reply); // showing an error message

                        }else {
                            new TracingDefault($reply, ''); // showing users list without a message
                        }
                    }

                    break;

                // selected order by something
                case $strings['Order']:

                     // looking for data
                     if (isset($_REQUEST['orderfield']))
                     {
                        $tracing = get_data_form();
						$reply = $tracing->orderSportsman($_REQUEST['orderfield']); // getting reply

                        unset($_REQUEST['orderfield']);

                        if (is_string($reply))
                        {
                            $data = $tracing->toListSportsmans(); // getting users list
                            new TracingDefault($data, $reply); // showing an error message

                        }else {
                            new TracingDefault($reply, ''); // showing users list without a message
                        }
                    }

                    break;


                default:
                	$tracing = get_data_form();
					$data = $tracing->toListSportsmans(); // getting users list
					$reply = '';
					new TracingDefault($data, $reply); // showing users list without a message

					break;
			}

		} else {
			if($_SESSION['userType'] == $strings['sportsman']){

				if (isset($_REQUEST['action']))
				{
					$action = $_REQUEST['action'];
				}else {
					$action = '';
				}

				Switch ($action)
	            {

	            	case $strings['completeLine']:

	            		if (isset($_REQUEST['lineaSesionesId'])) // if we have form's data, we insert it
						{
							$tracing = get_data_form_sportsman(); // getting data
							$tracing->changeComplete($_REQUEST['lineaSesionesId']); // trying consult
							$data1 = $tracing ->headSportsman();
							$data2 = $tracing ->follow();
							new TracingConsult($data1, $data2,false);
						
						}else { // if not, the view is called
							header("Location: ../views/home.php");
						}

						break;

					case $strings['completeTable']:

						if (isset($_REQUEST['sesionId'])) // if we have form's data, we insert it
						{
							$tracing = get_data_form_sportsman(); // getting data
							$tracing->completeTable($_REQUEST['sesionId']); // trying consult
							$data1 = $tracing ->headSportsman();
							$data2 = $tracing ->follow();
							new TracingConsult($data1, $data2,false);
						
						}else { // if not, the view is called
							header("Location: ../views/home.php");
						}

						break;

					case $strings['previousTable']:

						if (isset($_REQUEST['sesionId'])) // if we have form's data, we insert it
						{
							$tracing = get_data_form_sportsman(); // getting data
							$data2 = $tracing ->followPrevious($_REQUEST['sesionId']);

							if(is_string($data2)){
								die("die: $data2");
								$data1 = $tracing->headSportsman();
								$data2 = $tracing->follow();
								new TracingConsult($data1, $data2,false);
							}else{
								$data1 = $tracing->headSportsmanIdPrevious($_REQUEST['sesionId']);
								if($data1[0]['completado'] == 0)
								{
									new TracingConsult($data1, $data2,false);
								}else{
									new TracingConsult($data1, $data2,true);
								}
							}
						
						}else { // if not, the view is called
							header("Location: ../views/home.php");
						}

						break;

					case $strings['nextTable']:

						if (isset($_REQUEST['sesionId'])) // if we have form's data, we insert it
						{
							$tracing = get_data_form_sportsman(); // getting data
							$data2 = $tracing ->followNext($_REQUEST['sesionId']);

							if(is_string($data2)){
								die("die: $data2");
								$data1 = $tracing->headSportsman();
								$data2 = $tracing->follow();
								new TracingConsult($data1, $data2,false);
							}else{
								$data1 = $tracing->headSportsmanIdNext($_REQUEST['sesionId']);
								if($data1[0]['completado'] == 0)
								{
									new TracingConsult($data1, $data2,false);
								}else{
									new TracingConsult($data1, $data2,true);
								}
							}
						
						}else { // if not, the view is called
							header("Location: ../views/home.php");
						}

						break;

					default:

	                	if (isset($_SESSION['userId'])) // if we have form's data, we insert it
						{
							//die("DIE");
							$tracing = get_data_form_sportsman(); // getting data
							$data1 = $tracing ->headSportsman();
							$data2 = $tracing ->follow();
							new TracingConsult($data1, $data2,false);

						}else { // if not, the view is called
							header("Location: ../views/home.php");
						}

						break;
				}	

			}else{
				header('Location: ../views/home.php');
			}
          }

	}else {
		new LogIn('');
	}
?>