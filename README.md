# python_robotFramwork


Installation
------------

Local Setup:
If you already have Python_ with `pip <https://pip.pypa.io/en/stable/installing/>`_ installed,
you can simply run::

    pip install requirements.txt
    
Docker Setup:  
If you already have installed the docker , you can simply run::
 1. cd [path] - path of the docker file
  
 2. docker build -f ./Dockerfile -t robot . 
  
Note : it will take sometime to create the container
  
Test Execution :
  Local : Run the below command from the root directory
  
          robot --include addWishList --outputdir Reports suites/test.robot
  
          Note : if you want to execute all the test cases without any Tags please remove '--include addWishList'
  
  Docker Remote: Run the below command from the root directory
  
          docker-compose up
  
  
  
Test Results : 
    Test results can be found in reports directory.

