resource "null_resource" "Moodle-Execution" {
  
    connection {
    type = "ssh"
    host = aws_instance.Bhanu-bastion.public_ip
    user = "ubuntu"
    private_key = file("bhanu-key")
    }

 
  provisioner "file" {
    source      = "ansible.cfg"
    destination = "/home/ubuntu/ansible.cfg"
  }

  provisioner "file" {
    source      = "inventory"
    destination = "/home/ubuntu/inventory"
  }



  provisioner "file" {
    source      = "ansible.sh"
    destination = "/home/ubuntu/ansible.sh"
  }


  
   provisioner "file" {
    source      = "moodle.conf"
    destination = "/home/ubuntu/moodle.conf"
  }

   provisioner "file" {
    source      = "play.yaml"
    destination = "/home/ubuntu/play.yaml"
  }

   provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /home/ubuntu/ansible.sh",
      "sh /home/ubuntu/ansible.sh",
    ]
  }
    
  depends_on = [ aws_instance.Bhanu-bastion ]
  
  }
