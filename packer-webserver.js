{
    "variables" : {
        "build_version": "{{isotime \"2006-01-02-150405\"}}",
        "aws_profile": "default",
        "vpc_id": "",
        "subnet_id": "",
        "security_group_id": ""
    },
    "builders": [
        {
            "type": "amazon-ebs",
            "region": "us-east-1",
            "profile": "{{user `aws_profile`}}",
            "vpc_id": "{{user `vpc_id`}}",
            "subnet_id": "{{user `subnet_id`}}",
            "security_group_id": "{{user `security_group_id`}}",
            "source_ami_filter": {
                "filters": {
                    "name": "Windows_Server-1909-English-Core-Base-2020.04.15"
                },
                "most_recent": true,
                "owners": ["801119661308"]
            },
            "ami_name": "WebServer-{{user `build_version`}}",
            "instance_type": "m5.large",
            "user_data_file": ".\\packer-userdata.ps1",
            "associate_public_ip_address": true,
            "communicator": "winrm",
            "winrm_username": "Administrator",
            "winrm_port": 5986,
            "winrm_timeout": "15m",
            "winrm_use_ssl": true,
            "winrm_insecure": true
        }
    ],
    "provisioners": [
      {
          "type": "powershell",
          "scripts": [
              "./Provisioners/ec2config.ps1",
              "./Provisioners/awspowershelltools.ps1",
              "./Provisioners/webserver-provisiondependencies.ps1",
              "./Provisioners/webserver-provisionweb.ps1"
          ]
      },
      {
        "type": "windows-update",
        "filters": [
            "exclude:$_.Title -like '*Preview*'",
            "include:$true"
        ],
        "update_limit": 25
      },
      {
        "type": "powershell",
        "inline": [
          "C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Scripts\\SendWindowsIsReady.ps1 -Schedule",
          "C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Scripts\\InitializeInstance.ps1 -Schedule",
          "C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Scripts\\SysprepInstance.ps1 -NoShutdown"
        ]
      }
    ],
    "post-processors": [
      {
          "type": "manifest"
      }
    ]
}