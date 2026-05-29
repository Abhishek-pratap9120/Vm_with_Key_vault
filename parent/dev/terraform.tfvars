rg = {
    "rg1" = {
        rg_name ="argh_rg"
        rg_location = "central india"
    }
    "rg2" = {
        rg_name ="argh_rg2"
        rg_location = "central india"
    }
    "rg3" = {
        rg_name ="argh_rg3"
        rg_location = "central india"
    }
}

vnet = {
    "vnet1" = {
        vnet_name = "argh_vnet"
        address_space = ["10.0.0.0/16"]
        vnet_location = "central india"
        rg_name = "argh_rg"
    }
}

subnet = {
    "subnet1" = {
        subnet_name = "argh_subnet"
        rg_name = "argh_rg"
        vnet_name = "argh_vnet"
        address_prefixes =  ["10.0.2.0/24"]
    }
    "subnet2" = {
    subnet_name = "AzureBastionSubnet"
    rg_name = "argh_rg"
    vnet_name = "argh_vnet"
    address_prefixes =  ["10.0.3.0/26"]
    }

}

public_ip ={
    "pip1" ={
        pip_name = "argh_pip"
        rg_name = "argh_rg"
        pip_location = "central india"
        allocation_method = "Static"
    }
}

vm = {
    "vm1" = {
        nic_name = "argh_nic"
        nic_location = "central india"
        rg_name = "argh_rg"
        vm_name = "arghvm"
        vm_location = "central india"
        subnet_name =  "argh_subnet"
        vnet_name = "argh_vnet"
        key_name = "meritijori"
        secret_user_name = "username"
        secret_password_name = "password"

    }
}

# bastion = {
#     bastion1 = {
#         bastion_name = "argh-bastion"
#         bastion_location = "central india"
#         rg_name = "argh_rg"
#         subnet_name = "AzureBastionSubnet"
#         vnet_name = "argh_vnet"
#         pip_name = "argh_pip"
#     }
# }

key = {
    "key1" = {
        key_name = "meritijori"
        key_location = "central india"
        rg_name = "argh_rg"
        secret_user_name = "username"
        secret_user_value = "arghdeepVm"
        secret_password_name = "password"
        secret_password_value = "Abhi9120150@"
    }
}