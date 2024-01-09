output "us_west_1_db_public_ip" { value = ["${aws_instance.us_west_1_db.public_ip}"] }
output "eu_west_3_db_public_ip" { value = ["${aws_instance.eu_west_3_db.public_ip}"] }
output "sa_east_1_db_public_ip" { value = ["${aws_instance.sa_east_1_db.public_ip}"] }
output "ap_south_1_db_public_ip" { value = ["${aws_instance.ap_south_1_db.public_ip}"] }
#output "ap_northeast_1_db_public_ip" { value = ["${aws_instance.ap_northeast_1_db.public_ip}"] }

output "us_west_1_db_private_ip" { value = ["${aws_instance.us_west_1_db.private_ip}"] }
output "eu_west_3_db_private_ip" { value = ["${aws_instance.eu_west_3_db.private_ip}"] }
output "sa_east_1_db_private_ip" { value = ["${aws_instance.sa_east_1_db.private_ip}"] }
output "ap_south_1_db_private_ip" { value = ["${aws_instance.ap_south_1_db.private_ip}"] }
#output "ap_northeast_1_db_private_ip" { value = ["${aws_instance.ap_northeast_1_db.private_ip}"] }


