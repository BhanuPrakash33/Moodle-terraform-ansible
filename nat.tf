# For NAT Gateway
resource "aws_eip" "Bhanu-eip" {
    vpc = true
}

resource "aws_nat_gateway" "Bhanu-nat-gw" {
    allocation_id = aws_eip.Bhanu-eip.id
    subnet_id = aws_subnet.Bhanu-public-1.id
    depends_on = [aws_internet_gateway.Bhanu-gw]
    tags = {
        Name = "Bhanu-nat-gw"
    }
}

# For Route Table
resource "aws_route_table" "Bhanu-private-rt" {
    vpc_id = aws_vpc.Bhanu-main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.Bhanu-nat-gw.id
    }
    tags = {
        Name = "Bhanu-private-rt"
    }
}

# For Route associations private
resource "aws_route_table_association" "Bhanu-private-1-a" {
    subnet_id = aws_subnet.Bhanu-private-1.id
    route_table_id = aws_route_table.Bhanu-private-rt.id
}

resource "aws_route_table_association" "Bhanu-private-1-b" {
    subnet_id = aws_subnet.Bhanu-private-2.id
    route_table_id = aws_route_table.Bhanu-private-rt.id
}

